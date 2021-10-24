import 'package:flutter/material.dart';
import 'package:poliglot_translater/dataAccess/DataManager.dart';
import 'package:poliglot_translater/entities/Word.dart';
import 'package:sqflite/sqflite.dart';
class TranslaterManager{
  final String tableName = "vocabulary";

  Future<List<Word>> getAllWords() async {
    var connection = await DataManager.getConnection();
    List<Map<String,dynamic>> maps = await connection.rawQuery("SELECT * FROM vocabulary");
    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Word(id: row['id'], en: row['english'], az: row['azerbaijan']);
    });
  }

  Future<void> save(Word word) async{
    var connection = await DataManager.getConnection();
    var data = Map<String,dynamic>();
    data['english'] = word.en;
    data['azerbaijan'] = word.az;
    await connection.insert(tableName, data,conflictAlgorithm: ConflictAlgorithm.replace);
  }
  
  Future<void> delete(Word word) async{
    var connection = await DataManager.getConnection();
    await connection.delete(tableName,where: "id = ?",whereArgs: [word.id]);
  }

  Future<void> update(Word word) async{
    var connection = await DataManager.getConnection();
    var data = Map<String,dynamic>();
    data['english'] = word.en;
    data['azerbaijan'] = word.az;
    await connection.update(tableName, data,conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> truncate() async{
    var connection = await DataManager.getConnection();
    await connection.rawQuery("DELETE FROM $tableName");
  }




}
