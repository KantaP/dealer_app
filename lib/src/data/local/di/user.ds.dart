import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:aconnec_1109_x/src/constants/db.dart';
import 'package:aconnec_1109_x/src/data/local/datasource.abs.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@Singleton(order: -2)
class UserDataSource extends DataSource<UserProfileModel> {
  String tableName = 'users';
  String columnId = '_id';
  String columnActionSetPin = 'actionSetPin';
  String columnUid = 'uid';
  String columnPin = 'pin';
  String columnFirstName = 'firstName';
  String columnLastName = 'lastName';

  late Database _db;

  final logger = Logger('users_db_log');

  UserDataSource() {
    create();
  }

  @override
  Future<int> delete(int id) {
    return _db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future create() async {
    var databasesPath = await getDatabasesPath();
    _db = await openDatabase(join(databasesPath, DatabaseConstant.dbName));
    return await _db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        $columnId integer primary key autoincrement,
        $columnUid text not null,
        $columnActionSetPin INTEGER,
        $columnPin text null,
        $columnFirstName text null,
        $columnLastName text null
      )
      ''').then((value) {
      logger.fine('$tableName table created');
    }).catchError((e) {
      logger.warning(e.toString());
    });
  }

  @override
  Future<List<UserProfileModel>?> getByFilter(
      Map<String, dynamic> filters) async {
    try {
      List<Map<String, dynamic>> maps = await _db.query(
        tableName,
        where: filters.keys.map((key) => '$key = ?').join(' AND '),
        whereArgs: filters.values.toList(),
      );
      if (maps.isNotEmpty) {
        return UserProfileModelPersistence().fromArrayJson(maps);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserProfileModel?> getById(int id) async {
    List<Map> maps = await _db.query(tableName,
        columns: [columnId, columnFirstName, columnLastName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserProfileModelPersistence().fromMapLocalData(maps.first);
    }
    return null;
  }

  @override
  Future<UserProfileModel> insert(UserProfileModel item) async {
    final id = await _db.insert(
        tableName, UserProfileModelPersistence().toLocalData(item),
        conflictAlgorithm: ConflictAlgorithm.replace);
    item.setId(id);
    return item;
  }

  @override
  Future close() async {
    await _db.close();
  }

  @override
  Future<int> update(UserProfileModel item) {
    // print(item.uid);
    return _db.update(
        tableName, UserProfileModelPersistence().toLocalData(item),
        where: '$columnUid = ?', whereArgs: [item.uid]);
  }

  @override
  Future<List<UserProfileModel>?> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
