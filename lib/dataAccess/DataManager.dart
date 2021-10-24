
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataManager{
  static final String _databaseName = "poliglot.sqlite";

  static Future<Database> getConnection() async{
    String databasaPath = join(await getDatabasesPath(),_databaseName);
    if(await databaseExists(databasaPath)){
      print('Database already exist');
    }else{
      ByteData data = await rootBundle.load("lib/dataAccess/db/poliglot.sqlite");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasaPath).writeAsBytes(bytes,flush: true);
    }
    return openDatabase(databasaPath);
  }
}