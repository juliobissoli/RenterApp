import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:renter_app/interfaces/status.dart';
import 'package:sqflite/sqflite.dart';

import '../models/propertie-model.dart';
import '../models/propertie-model.dart';

class DBProvider {
  // DBProvider._();
  // static final DBProvider db = DBProvider._internal();
  // DBProvider._internal();

  // static Database get singleton => _database;

  // DBProvider._privateConstructor();
  // static final DBProvider instance = DBProvider._privateConstructor();

  // only have a single app-wide reference to the database
  // static Database _database = initDB();

  int _user_id = -1;

  setUserId(int id) {
    this._user_id = id;
  }

  // static DBProvider get singleton =>
  Future<Database> get database async {
    // if (_database != null) return _database;

    // if _database is null we instantiate it
    // _database = await initDB();
    return await initDB();
  }

  Future<Database> initDB() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "RenterDB.db");
    return await openDatabase(path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async => await _createTables(db));
  }

  _createTables(Database db) async {
    await db.execute("CREATE TABLE properties ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "address_label TEXT,"
        "address_cep TEXT,"
        "address_city TEXT,"
        "address_public_place TEXT,"
        "status NUMERIC,"
        "label TEXT"
        ")");

    await db.execute("CREATE TABLE images ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "propertie_id INTEGER,"
        "path TEXT"
        ")");

    await db.execute("CREATE TABLE rents ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "propertie_id INTEGER,"
        "date_init TEXT,"
        "date_end TEXT,"
        "status TEXT,"
        "client_name TEXT,"
        "client_phone TEXT,"
        "total_value NUMERIC,"
        "value_installments NUMERIC,"
        "installments INTEGER,"
        "mode INTEGER"
        ")");

    // await db.execute("CREATE TABLE medias ("
    //     "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    //     "propertie_id INTEGER,"
    //     "path TEXT,"
    //     "type TEXT," //IMAGE OU VIDEO
    //     "is_favorite NUMERIC," // BOOL
    //     "FOREIGN KEY(stone_id) REFERENCES stones(id)"
    //     ")");
  }

  newProperties(PropertieModel propertie) async {
    final db = await database;
    // final created_at = DateTime.now().toString();

    var res = await db.rawInsert(
        "INSERT Into properties (address_label, address_cep, address_city, address_public_place, status, label)"
        "VALUES ('${propertie.address.label}', '${propertie.address.cep}', '${propertie.address.city}', '${propertie.address.public_place}', ${propertiStatusDecode(propertie.status)}, '${propertie.label}')");

    // var res = await db.rawInsert(
    //     "INSERT Into stones (address_label, address_cep, address_city, address_public_place, status, label)"
    //     "VALUES ( ${propertie.address.label}, '${propertie.name}', '${propertie.type}', ${propertie.number}, ${propertie.height}, ${propertie.width}, ${propertie.weight}, ${propertie.length}, '${created_at}' ,'saved')");
    return res;
  }

  addImage(List<String> medias, int propertie_id) async {
    final db = await database;

    String values = "VALUES";
    int i;
    for (i = 0; i < medias.length; i++) {
      values +=
          '(${propertie_id}, "${medias[i]})${i == (medias.length - 1) ? ';' : ','}';
    }

    var res = await db
        .rawInsert("INSERT Into images (propertie_id, path)" "${values}");
    return res;
  }

  // addMedias(List<StoneMediaModel> medias, int stone_id, String type) async {
  //   final db = await database;
  //   String values = "VALUES";
  //   int i;
  //   for (i = 0; i < medias.length; i++) {
  //     values +=
  //         '(${stone_id}, "${medias[i].path}", ${medias[i].is_favoryt ? 1 : 0}, "${type}")${i == (medias.length - 1) ? ';' : ','}';
  //   }

  //   var res = await db.rawInsert(
  //       "INSERT Into medias (stone_id, path, is_favorite, type)" "${values}");
  //   return res;
  // }

  Future<List<PropertieModel>> getProperties() async {
    print('Bateu aqui=============');
    final db = await database;
    var res = [];
    res = await db.query(
      "properties",
      // where: 'user_id = ?',
      // whereArgs: [this._user_id],
    );

    List<PropertieModel> list = [];
    print('No db ==> $res');

    await Future.wait(res.map((e) => setDataPropertie(e, list)));
    print('No db ==> $res');

    return list.toList();
  }

  Future setDataPropertie(dynamic propertie, List<dynamic> list) async {
    var images = [];

    print('Data q cgego ==> $propertie');
    // var videos = [];

    images = await getMedia(propertie['id']);
    // videos = await getMedia(propertie['id'], 'video', true);

    list.add(PropertieModel.fromJson({
      ...propertie,
      'images': images,
      'address': {
        'label': propertie['address_label'],
        'cep': propertie['address_cep'],
        'city': propertie['address_city'],
        'public_place': propertie['address_public_place']
      }
    }));
  }

  Future<List<dynamic>> getMedia(int id) async {
    final db = await database;
    List<Map> res =
        await db.rawQuery('SELECT * FROM images WHERE propertie_id = $id');

    return res;
  }

  deleteProperties(int propertie_id) async {
    final db = await database;

    try {
      await db.delete(
        'properties',
        where: 'id = ?',
        whereArgs: [propertie_id],
      );
      List<Map> medias = await db
          .rawQuery('SELECT * FROM images WHERE propertie_id = $propertie_id');

      // Future.wait(medias.map((e) => deleteMedia(e['id'], e['path'])));
    } catch (error) {
      print("Algo de errado na deleção do bloco -> $error");
    }
  }

  deleteMedia(int images_id, String path) async {
    final db = await database;
    File file = File(path);
    try {
      if (await file.exists()) {
        await file.delete();
        await db.delete(
          'images',
          where: 'id = ?',
          whereArgs: [images_id],
        );
      }
    } catch (e) {
      print('Delete media erro -> $e');
      // Error in getting access to the file.
    }
  }
}
