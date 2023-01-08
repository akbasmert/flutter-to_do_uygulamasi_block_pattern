import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class Veritabani{
  static final String veritabaniAdi = "notlar.sqlite";

  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if(await databaseExists(veritabaniYolu)){
      print("veritabanı zaten var");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> byts = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(byts,flush: true);
      print("veri tabani kopyalandı");
    }

    return openDatabase(veritabaniYolu);
  }
}