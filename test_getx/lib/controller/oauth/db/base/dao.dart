import 'dart:async';

import 'package:sqflite/sqflite.dart';

abstract class Dao {
  String getTableName();
  String getCreateTableQuery();

  Future<bool> isTableExists(Database db, String tableName) async {
    var raw = await db.rawQuery(
      'SELECT name FROM sqlite_master WHERE type=\'table\' AND name=\'$tableName\'');
    var completer = Completer<bool>();
    completer.complete(raw.isNotEmpty);
    return completer.future;
  }
}