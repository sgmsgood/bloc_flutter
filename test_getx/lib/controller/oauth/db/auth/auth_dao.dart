import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:test_getx/controller/oauth/db/base/dao.dart';

import 'auth_model.dart';

class AuthDao extends Dao {
  Database _db;

  AuthDao(Database db) : _db = db;

  @override
  String getCreateTableQuery() => '''
    create table if not exists ${getTableName()} (
      userToken text,
      id text primary key,
      email text,
      name text,
      registrationTimestamp integer,
      updateTimestamp integer,
      level integer,
      deviceType int,
      picture text,
      gender text,
      nationCode text default 82,
      dateOfBirth text, 
      mobile text,
      tel text,
      zipCode text,
      bio text,
      state text,
      city text,
      address text
    )
  ''';

  @override
  String getTableName() => 'oauth';

  Future<bool> create(AuthEntity entity) async {
    try {
      var rows = await _db.query(getTableName(), where: 'id = ?', whereArgs: [entity.id]);
      if (rows.isNotEmpty) {
        await _db.update(getTableName(), entity.toMap());
      } else {
        await _db.insert(getTableName(), entity.toMap());
      }

    } catch (e) {
      log('[AuthDao] => ERROR::create $e');
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future update({String name, String picture}) async {
    var user = await read();
    return _db.update(getTableName(), {'name': name, 'photoUrl': picture},
        where: 'id = ?', whereArgs: [user.id]);
  }

  Future<bool> isRegistered() async {
    var map = await _db.query(getTableName());
    return Future.value(map.isNotEmpty);
  }

  Future<AuthEntity> read() async {
    try {
      var map = await _db.query(getTableName());
      var entity = map.map((e) => AuthEntity.fromMap(e));
      if (entity.isEmpty) {
        return Future.value(null);
      }
      log('[AuthDao] => etUser $entity');
      return Future.value(entity.first);

    } catch (e) {
      log('[AuthDao] => ERROR::getUser $e');
    }
    return Future.value(null);
  }

  Future<void> deleteAll() async {
    try {
      log('[AuthDao] => delete all enter !!');
      await _db.rawDelete('delete from ${getTableName()}');
      log('[AuthDao] => delete all leave !!');
    } catch(e) {
      log('[AuthDao] => ERROR::deleteAll $e');
    }
    return Future.value();
  }
}