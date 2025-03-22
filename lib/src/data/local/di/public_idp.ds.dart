import 'dart:async';

import 'package:aconnec_1109_x/src/constants/db.dart';
import 'package:aconnec_1109_x/src/data/local/datasource.abs.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/idp.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Singleton(dispose: disposeDataSource, order: -2)
class IdpDataSource extends DataSource<IdpModel> {
  String tableName = 'idp';
  String columnIdPrimary = '_id';
  String columnId = 'id';
  String columnCode = 'code';
  String columnName = 'name';

  late Database _db;

  final logger = Logger('idp-datasource');

  IdpDataSource() {
    create();
  }

  void dispose() {
    close();
  }

  @override
  Future close() async {
    await _db.close();
  }

  @override
  Future create() async {
    var databasesPath = await getDatabasesPath();
    _db = await openDatabase(join(databasesPath, DatabaseConstant.dbName));
    await _db.rawDelete('DROP TABLE IF EXISTS $tableName');
    return await _db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        $columnIdPrimary integer primary key autoincrement,
        $columnId text not null,
        $columnCode text not null,
        $columnName text not null
      )
      ''').then((value) {
      logger.fine('$tableName table created');
    }).catchError((e) {
      logger.warning(e.toString());
    });
  }

  @override
  Future<int> delete(int id) {
    return _db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future<List<IdpModel>?> getByFilter(Map<String, dynamic> filters) async {
    try {
      List<Map<String, dynamic>> maps = await _db.query(
        tableName,
        where: filters.keys.map((key) => '$key = ?').join(' AND '),
        whereArgs: filters.values.toList(),
      );
      if (maps.isNotEmpty) {
        return IdpModelPersistence().fromArrayJson(maps);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<IdpModel?> getById(int id) async {
    List<Map> maps = await _db.query(tableName,
        columns: [columnId, columnCode, columnName],
        where: '$columnIdPrimary = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return IdpModelPersistence().fromJson(
        Map<String, dynamic>.from(
          maps.first,
        ),
      );
    }
    return null;
  }

  @override
  Future<IdpModel> insert(IdpModel item) async {
    final id = await _db.insert(tableName, IdpModelPersistence().toJson(item),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // item.setId(id);
    return item;
  }

  @override
  Future<int> update(IdpModel item) {
    return _db.update(tableName, IdpModelPersistence().toJson(item),
        where: '$columnId= ?', whereArgs: [item.id]);
  }

  @override
  Future<List<IdpModel>?> getAll() async {
    List<Map> maps =
        await _db.query(tableName, columns: [columnId, columnCode, columnName]);
    if (maps.isNotEmpty) {
      return IdpModelPersistence().fromArrayJson(
        maps,
      );
    }
    return null;
  }

  Future<void> deleteAll() async {
    _db.delete(tableName);
    return;
  }
}

FutureOr disposeDataSource(IdpDataSource instance) {
  instance.dispose();
}
