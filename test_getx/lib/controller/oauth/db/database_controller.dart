import 'package:get/get.dart';

import 'dart:async';
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'auth/auth_dao.dart';
import 'base/dao.dart';

final dbName = "aai.db";

Type typeOf<T>() => T;

class DatabaseController extends GetxController{
  Database db;

  Map<String, Dao> daoList;

  DatabaseController.create();

  Future<void> init() async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, dbName);

      db = await openDatabase(path, version: 1,
          onUpgrade: (db, oldVersion, newVersion) async {
            var batch = db.batch();
          });

      /// 이부분에 dao를 추가
      this.daoList = {
        'auth': AuthDao(db),
      };

      for (var dao in daoList.entries) {
        await db.execute(dao.value.getCreateTableQuery());
      }
    } catch (e) {
      log('[DatabaseProvider] => ERROR::init $e');
    }
    return Future.value();
  }

  T getDao<T extends Dao>() {
    return daoList.entries
        .firstWhere((element) => element.value is T)
        .value;
  }

  Future<void> createTable<T extends Dao>() async {
    try {
      Dao dao = getDao<T>();
      await db.execute(dao.getCreateTableQuery());
    } catch (e) {
      log('[DatabaseProvider] => ERROR::createTable $e');
    }
    return Future.value();
  }

  Future<void> deleteTable<T extends Dao>() async {
    try {
      if (!db.isOpen) {
        log('[DatabaseProvider] => ERROR::deleteTable db closed.');
        return Future.value();
      }
      var dao = getDao<T>();
      await db.execute('DROP TABLE ${dao.getTableName()}');

    } catch (e) {
      log('[DatabaseProvider] => ERROR::deleteTable $e');
    }
    return Future.value();
  }

  Future<void> deleteAllTable() async {
    if (!db.isOpen) {
      log('[DatabaseProvider] => ERROR::deleteTable db closed.');
      return Future.value();
    }
    try {
      var query = daoList.entries.map((e) => e.value).map(
              (value) async => await db.execute('DROP TABLE ${value.getTableName()}'));
      await Future.wait(query);

    } catch (e) {
      log('[DatabaseProvider] => ERROR::deleteAllTable $e');
    }
    return Future.value();
  }

  Dao getDaoByName(String name) => daoList[name];
}
