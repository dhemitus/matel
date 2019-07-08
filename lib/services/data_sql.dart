import 'package:flutter_mata_elang/model/profile.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataSql {
  final String table = 'case_db';
  final String bulk = 'data_db';
  final String id = 'id';
  final String name = 'name';
  final String plate = 'plate';
  final String vehicle = 'vehicle';
  final String frame = 'frame';
  final String engine = 'engine';
  final String ovd = 'ovd';
  final String saldo = 'saldo';
  final String finance = 'finance';
  final String address = 'address';
  final String number = 'number';
  final String note = 'note';
  final String phone = 'phone';
  final String date = 'date';

  static Database _database;
  static Database _databulk;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }

    return _database;
  }

  Future<Database> get databulk async {
    if (_databulk == null) {
      _databulk = await initBL();
    }

    return _databulk;
  }

  Future<Database> initDB() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String _path = _directory.path + 'case.db';

    Database _db = await openDatabase(_path, version: 1, onCreate:_createDB);
    return _db;
  }

  Future<Database> initBL() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String _path = _directory.path + 'bulk.db';

    Database _db = await openDatabase(_path, version: 1, onCreate:_createBL);
    return _db;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $table($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, '
      '$plate TEXT, $vehicle TEXT, $frame TEXT, $engine TEXT, $ovd TEXT, $saldo TEXT, '
      '$finance TEXT, $address TEXT, $number TEXT, $phone TEXT, $date TEXT, $note TEXT)');
  }

  void _createBL(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $bulk($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, '
      '$plate TEXT, $vehicle TEXT, $frame TEXT, $engine TEXT, $ovd TEXT, $saldo TEXT, '
      '$finance TEXT, $address TEXT, $number TEXT, $phone TEXT, $date TEXT, $note TEXT)');
  }




  Future<List<dynamic>> insertCases(List<Profile> profiles) async {
    Database _db = await database;

    await _db.execute('DELETE FROM $table');

    Batch _batch = _db.batch();

    for(int _i = 0; _i < profiles.length; _i++) {
      _batch.insert(table, profiles[_i].toMap());
    }

    List<dynamic> _result = await _batch.commit();

    return _result;
  }

  Future<int> updateCase(Profile profile) async {
    Database _db = await database;
    int _result = await _db.update(table, profile.toMap(), where: '$id = ?', whereArgs: [profile.id]);
    print(_result);
    return _result;
  }

  Future<Profile> selectCase(Profile profile) async {
    Database _db = await database;

    List<dynamic> _result = await _db.query(table, where: '$id = ?', whereArgs: [profile.id]);
    return Profile.fromMap(_result.first);
  }

  Future<List<dynamic>> searchCases(List<String> data) async {
    Database _db = await database;

    String _que = plate;
    String _data = data[0];
    if(data[1] == 'nopol') {
      _que = plate;
    } else if(data[1] == 'noka') {
      _que = frame;
    } else if(data[1] == 'nosin') {
      _que = engine;
    }
    print('$_que $_data');
    List<dynamic> _result = await _db.query(table, where: '$_que LIKE ?', whereArgs: ['%$_data%'], orderBy: '${plate} ASC');
    return _result;
  }

  Future<List<dynamic>> searchNotes() async {
    Database _db = await database;

    List<dynamic> _result = await _db.query(table, where: '$note != ?', whereArgs: ['']);
    return _result;
  }

  Future<int> getCount() async {
    Database _db = await database;

    List<Map<String, dynamic>> _x = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    int _result = Sqflite.firstIntValue(_x);
    return _result;
  }



  Future<List<dynamic>> insertBulks(List<Profile> profiles) async {
    Database _db = await databulk;

    Batch _batch = _db.batch();

    for(int _i = 0; _i < profiles.length; _i++) {
      _batch.insert(bulk, profiles[_i].toMap());
    }

    List<dynamic> _result = await _batch.commit();

    return _result;
  }

  Future<int> updateBulk(Profile profile) async {
    Database _db = await databulk;
    int _result = await _db.update(bulk, profile.toMap(), where: '$id = ?', whereArgs: [profile.id]);

    return _result;
  }

  Future<Profile> selectBulk(Profile profile) async {
    Database _db = await databulk;

    List<dynamic> _result = await _db.query(bulk, where: '$id = ?', whereArgs: [profile.id]);
    return Profile.fromMap(_result.first);
  }

  Future<List<dynamic>> searchBulks(String data) async {
    Database _db = await databulk;

    List<dynamic> _result = await _db.query(bulk, where: '$plate LIKE ?', whereArgs: ['%$data%'], orderBy: '${plate} ASC');
    return _result;
  }

}