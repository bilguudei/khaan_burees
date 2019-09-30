import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DB{

  DB._privateConstructor();
  static final DB instance = DB._privateConstructor();
  static Database _db;

  Future<Database> get db async{
    if(_db != null)
      return _db;
    _db = await create();
    return _db;
  }

  Future create() async{
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, "haan.db");
    return _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: this._create,
    );
  }

  Future _create(Database db, int version) async{
    await db.execute("create table items("
        "id integer primary key autoincrement,"
        "img text not null,"
        "material text not null,"
        "active integer default 1,"
        "priceCarMain integer default 0,"
        "priceCarSide integer default 0,"
        "priceCarMainPlus integer default 0,"
        "priceCarSidePlus integer default 0,"
        "priceJeepMain integer default 0,"
        "priceJeepSide integer default 0,"
        "priceJeepMainPlus integer default 0,"
        "priceJeepSidePlus integer default 0,"
        "priceMicroMain integer default 0,"
        "priceMicroSide integer default 0,"
        "priceMicroMainPlus integer default 0,"
        "priceMicroSidePlus integer default 0,"
        "priceBusMain integer default 0,"
        "priceBusSide integer default 0,"
        "priceBusMainPlus integer default 0,"
        "priceBusSidePlus integer default 0"
        ")");
  }

  Future<Map> bookUpsert(Map map) async{
    var count = Sqflite.firstIntValue(await _db.rawQuery("select count(*) from books"));
    if(count == 0){
      map["id"] = await _db.insert("books", map);
    }else{
      await _db.update("book", map, where: "id = ?", whereArgs: map["id"]);
    }
  }

  Future<bool> bookDownloaded(int id) async{
    await _db.rawQuery("update books set downloaded = 1 where id = $id").then((status){
      print(status.toString());
      return true;
    }).catchError((err){
      print(err.toString());
      return false;
    });
  }

  Future<List> bookList(int angi) async{
    List datas = await _db.query("books", where: "grade = $angi");
    return datas;
  }

  Future bookInsert(List datas) async{
    datas.forEach((d) async {
      print("________________db -> $d");
      int audio = 0;
      if(d["dataHasAudio"].toString().toUpperCase() == "Y")
        audio = 1;

      var count = Sqflite.firstIntValue(await _db.rawQuery("SELECT COUNT(*) FROM books WHERE id = ${d["dataId"]}"));
      if(count == 0){
        _db.rawQuery("insert into books  values("
            "${d["dataId"]}, "
            "'${d["dataName"]}', "
            "'${d["dataOnlineURL"]}', "
            "${d["dataGrade"]}, "
            "'${d["dataThumbnailName"]}', "
            "$audio, "
            "0, "
            "${d["total_pages"]}, "
            "'${d["downloadURL"]}', "
            "'${d["dataDownload"]}', "
            "0, "
            "${d["dataVersion"]},"
            "${d["dataVersion"]})");
      }else{
        print("_______update  $d");
        _db.rawQuery("update books set book_version = ${d["dataVersion"]} where id = ${d["dataId"]}");
//        db.rawQuery("alter table book add column book_version integer default 0, downloaded_version integer default 0");
      }
//      _db.rawQuery("insert into book(id, book_name, readingUrl, grade, img, audio, pages, downloadUrl, zipUrl) values(${d["dataId"]}, '${d["dataName"]}', '${d["dataOnlineURL"]}', ${d["dataGrade"]}, '${d["dataThumbnailName"]}', $audio, 0, ${d["total_pages"]}, '${d["downloadURL"]}', '${d["dataDownload"]}', 0, ${d["dataVersion"]})");
    });
  }
}

Future<int> itemCount() async{
  Database db = await DB.instance.db;
  return Sqflite.firstIntValue(await db.rawQuery("select count(*) from items"));
}

Future<List> getItems() async{
  Database db = await DB.instance.db;
  List datas = await db.query("items");
  return datas;
}

Future insertItem(Map d) async{
  Database db = await DB.instance.db;
  db.rawQuery("insert into items("
      "img, "
      "material, "
      "priceCarMain, "
      "priceCarSide, "
      "priceCarMainPlus, "
      "priceCarSidePlus, "
      "priceJeepMain, "
      "priceJeepSide, "
      "priceJeepMainPlus, "
      "priceJeepSidePlus, "
      "priceMicroMain, "
      "priceMicroSide, "
      "priceMicroMainPlus, "
      "priceMicroSidePlus, "
      "priceBusMain, "
      "priceBusSide, "
      "priceBusMainPlus, "
      "priceBusSidePlus) values ("
      "'${d["img"]}', "
      "'${d["material"]}', "

      "${d["carMain"]}, "
      "${d["carSide"]}, "
      "${d["carMainPlus"]}, "
      "${d["carSidePlus"]}, "

      "${d["jeepMain"]}, "
      "${d["jeepSide"]}, "
      "${d["jeepMainPlus"]}, "
      "${d["jeepSidePlus"]}, "

      "${d["microMain"]}, "
      "${d["microSide"]}, "
      "${d["microMainPlus"]}, "
      "${d["microSidePlus"]}, "

      "${d["busMain"]}, "
      "${d["busSide"]}, "
      "${d["busMainPlus"]}, "
      "${d["busSidePlus"]}"
      ")");
}

Future<String> updateField(String name, int value, int id) async{
  Database db = await DB.instance.db;
  List str = await db.rawQuery("update items set $name = $value where id = $id");
  return "$str";
}

Future updateItem(Map d) async{
  Database db = await DB.instance.db;
  db.rawQuery("update items set "
      "img = '${d["img"]}', "
      "material = '${d["material"]}', "

      "priceCarMain = ${d["carMain"]}, "
      "priceCarSide = ${d["carSide"]}, "
      "priceCarMainPlus = ${d["carMainPlus"]}, "
      "priceCarSidePlus = ${d["carSidePlus"]}, "

      "priceJeepMain = ${d["jeepMain"]}, "
      "priceJeepSide = ${d["jeepSide"]}, "
      "priceJeepMainPlus = ${d["jeepMainPlus"]}, "
      "priceJeepSidePlus = ${d["jeepSidePlus"]}, "

      "priceMicroMain = ${d["microMain"]}, "
      "priceMicroSide = ${d["microSide"]}, "
      "priceMicroMainPlus = ${d["microMainPlus"]}, "
      "priceMicroSidePlus = ${d["microSidePlus"]}, "

      "priceBusMain = ${d["busMain"]}, "
      "priceBusSide = ${d["busSide"]}, "
      "priceBusMainPlus = ${d["busMainPlus"]}, "
      "priceBusSidePlus = ${d["busSidePlus"]}"
      ")");
}