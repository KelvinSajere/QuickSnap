import 'package:flutter/material.dart';
import 'package:quicksnap/database/database.dart';
import 'package:sqflite/sqlite_api.dart';

import 'entity.dart';

class Repository<T extends Entity> {
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

  Future<List<Entity>> retrieve() async {
    Database db = await databaseHelper.database;
    final results = await db.query(_tableName, orderBy: "id DESC");
    final List<Entity> resultsInEntity = results.isNotEmpty
        ? results.map((result) => _entity.fromMap(result)).toList()
        : <Entity>[];
    return List<T>.from(resultsInEntity);
  }
}
