import 'package:flutter/material.dart';
import 'package:quicksnap/models/abstract_entity/entity.dart';
import 'package:sqflite/sqlite_api.dart';

import 'database.dart';

class Repository<T extends AbstractEntity> {
  final T _entity;
  final String _tableName;

  Repository({@required T entity, @required String tableName})
      : _entity = entity,
        _tableName = tableName;

  // Database helper methods:
  DataBaseProvider databaseHelper = DataBaseProvider();

  Future<int> create(T entity) async {
    Database db = await databaseHelper.database;
    int id = await db.insert(_tableName, entity.toMap());
    return id;
  }

  Future<List<AbstractEntity>> retrieve() async {
    Database db = await databaseHelper.database;
    final results = await db.query(_tableName, orderBy: "id DESC");
    final List<AbstractEntity> resultsInEntity = results.isNotEmpty
        ? results.map((result) => _entity.fromMap(result)).toList()
        : <AbstractEntity>[];
    return List<T>.from(resultsInEntity);
  }
}
