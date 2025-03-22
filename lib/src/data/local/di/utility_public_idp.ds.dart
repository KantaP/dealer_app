import 'dart:async';

import 'package:aconnec_1109_x/src/constants/db.dart';
import 'package:aconnec_1109_x/src/data/local/datasource.abs.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Singleton(dispose: disposeDataSource, order: -2)
class UtilityPublicIdpDatasource extends DataSource<UtilityIdpIdentifierModel> {
  String tableName = 'utility_public_idp';
  String columnIdPrimary = '_id';
  String columnNodeId = 'node_id';
  String columnNodeDetail = 'node_name';
  String columnOnTheFlySupport = 'on_the_fly_support';

  late Database _db;

  final logger = Logger('utility-public-idp-as-datasource');

  UtilityPublicIdpDatasource() {
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
        $columnNodeDetail text not null,
        $columnOnTheFlySupport boolean not null
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
  Future<List<UtilityIdpIdentifierModel>?> getByFilter(
      Map<String, dynamic> filters) async {
    try {
      List<Map<String, dynamic>> maps = await _db.query(
        tableName,
        where: filters.keys.map((key) => '$key = ?').join(' AND '),
        whereArgs: filters.values.toList(),
      );
      if (maps.isNotEmpty) {
        return UtilityIdpIdentifierModelPersistence().fromArrayLocalData(maps);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UtilityIdpIdentifierModel?> getById(int id) async {
    List<Map> maps = await _db.query(tableName,
        columns: [columnNodeId, columnNodeDetail, columnOnTheFlySupport],
        where: '$columnIdPrimary = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UtilityIdpIdentifierModelPersistence().fromLocalData(
        Map<String, dynamic>.from(
          maps.first,
        ),
      );
    }
    return null;
  }

  @override
  Future<UtilityIdpIdentifierModel> insert(
      UtilityIdpIdentifierModel item) async {
    try {
      final data = UtilityIdpIdentifierModelPersistence().toLocalData(item);
      // print(data);
      final id = await _db.insert(tableName, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      // item.setId(id);
      return item;
    } catch (e) {
      // print(e);
      throw Exception(e);
    }
  }

  @override
  Future<int> update(UtilityIdpIdentifierModel item) {
    return _db.update(
        tableName, UtilityIdpIdentifierModelPersistence().toJson(item),
        where: '$columnNodeId= ?', whereArgs: [item.nodeId]);
  }

  @override
  Future<List<UtilityIdpIdentifierModel>?> getAll() async {
    List<Map> maps = await _db.query(tableName,
        columns: [columnNodeId, columnNodeDetail, columnOnTheFlySupport]);
    if (maps.isNotEmpty) {
      return UtilityIdpIdentifierModelPersistence().fromArrayLocalData(
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

FutureOr disposeDataSource(UtilityPublicIdpDatasource instance) {
  instance.dispose();
}
