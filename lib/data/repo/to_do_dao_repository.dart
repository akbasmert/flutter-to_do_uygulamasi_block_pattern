import 'package:to_do_uygulamasi_block_pattern/data/entity/to_do.dart';
import 'package:to_do_uygulamasi_block_pattern/data/sqlite/veritabani.dart';



class ToDoDaoRepo{

  Future<void> kaydet(String name)async{
    var db = await Veritabani.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["name"] = name;

    await db.insert("notlar", bilgiler);

  }

  Future<void> guncelle(int id, String name)async{

    var db = await Veritabani.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["name"] = name;
    await db.update("notlar", bilgiler, where: "id=?",whereArgs: [id]);

  }

  Future<List<ToDo>> NotlariYukle()async{
    var db = await Veritabani.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SElECT * FROM notlar"); //dynamic bütün türleri kapsoyor

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return ToDo(id: satir["id"], name: satir["name"]);

    });
  }

  Future<List<ToDo>> ara(String aramaKelimesi)async{
    var db = await Veritabani.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM notlar Where name like '%$aramaKelimesi'");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return  ToDo(id: satir["id"], name: satir["name"]);
    });
  }
  Future<void>sil(int id)async{
    var db = await Veritabani.veritabaniErisim();
    await db.delete("notlar", where: "id=?",whereArgs: [id]);
  }

}