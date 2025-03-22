import 'dart:async';

import 'package:aconnec_1109_x/src/constants/db.dart';
import 'package:aconnec_1109_x/src/data/local/datasource.abs.dart';
import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Singleton(dispose: disposeDataSource , order: -2)
class AgentAsDatasource extends DataSource<IdpAsModel> {
  String tableName = 'agent_as';
  String columnIdPrimary = '_id';
  String columnNodeId = 'node_id';
  String columnNodeDetail = 'node_name';

  late Database _db;

  final logger = Logger('agent-as-datasource');

  AgentAsDatasource() {
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
        $columnNodeId text not null,
        $columnNodeDetail text not null
      )
      ''').then((value) {
      logger.fine('$tableName table created');
    }).catchError((e) {
      logger.warning(e.toString());
    });
  }

  @override
  Future<int> delete(int id) {
    return _db
        .delete(tableName, where: '$columnIdPrimary = ?', whereArgs: [id]);
  }

  @override
  Future<List<IdpAsModel>?> getByFilter(Map<String, dynamic> filters) async {
    try {
      List<Map<String, dynamic>> maps = await _db.query(
        tableName,
        where: filters.keys.map((key) => '$key = ?').join(' AND '),
        whereArgs: filters.values.toList(),
      );
      if (maps.isNotEmpty) {
        return IdpAsModelPersistence().fromArrayLocalData(maps);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<IdpAsModel?> getById(int id) async {
    List<Map> maps = await _db.query(tableName,
        columns: [columnNodeId, columnNodeDetail],
        where: '$columnIdPrimary = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return IdpAsModelPersistence().fromLocalData(
        Map<String, dynamic>.from(
          maps.first,
        ),
      );
    }
    return null;
  }

  @override
  Future<IdpAsModel> insert(IdpAsModel item) async {
    try {
      final data = IdpAsModelPersistence().toLocalData(item);
      final id = await _db.insert(
          tableName, IdpAsModelPersistence().toLocalData(item),
          conflictAlgorithm: ConflictAlgorithm.replace);
      // item.setId(id);
      return item;
    } catch (e) {
      // print(e);
      throw Exception(e);
    }
  }

  @override
  Future<int> update(IdpAsModel item) {
    return _db.update(tableName, IdpAsModelPersistence().toJson(item),
        where: '$columnNodeId= ?', whereArgs: [item.nodeId]);
  }

  @override
  Future<List<IdpAsModel>?> getAll() async {
    List<Map> maps =
        await _db.query(tableName, columns: [columnNodeId, columnNodeDetail]);
    if (maps.isNotEmpty) {
      return IdpAsModelPersistence().fromArrayLocalData(
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

FutureOr disposeDataSource(AgentAsDatasource instance) {
  instance.dispose();
}
