import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/interfaces/rent.dart';
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
        "status INTEGER,"
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
    return res;
  }

  addImage(String url, String propertie_id) async {
    final db = await database;

    String values = "VALUES";
    int i;
    // for (i = 0; i < medias.length; i++) {
    //   values +=
    //       '(${propertie_id}, "${medias[i]})${i == (medias.length - 1) ? ';' : ','}';
    // }

    var res = await db
        .rawInsert("INSERT Into images (propertie_id, path)" "VALUES ('${propertie_id}', '${url}')");
        print('resposta => $res');
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
      orderBy: "id DESC",
    );

    List<PropertieModel> list = [];
    await Future.wait(res.map((e) => setDataPropertie(e, list)));

    return list.toList();
  }

  Future setDataPropertie(dynamic propertie, List<PropertieModel> list) async {
    try {
      List<dynamic> images = [];
      images = await getMedia(propertie['id']);

      // videos = await getMedia(propertie['id'], 'video', true);

      dynamic data = {
        // ...propertie,'
        'id': propertie['id'].toString(),
        'label': propertie['label'],
        'status': propertie['status'],
        'images': images
            .map(
              (el) => el['path'],
            )
            .toList(),
        'address': {
          'label': propertie['address_label'],
          'cep': propertie['address_cep'],
          'city': propertie['address_city'],
          'public_place': propertie['address_public_place']
        }
      };
      list.add(PropertieModel.fromJson(data));
    } catch (e) {
      print('Erro ao carregar imagem: $e');
    }

    // var videos = [];
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

  Future<List<RentModel>> getRents(String propertie_id) async {
    print('Bateu aqui=============');
    final db = await database;
    List<dynamic> res = [];
    res = await db.query(
      "rents",
      where: 'propertie_id = ?',
      whereArgs: [int.parse(propertie_id)],
      orderBy: "id DESC",
    );

    print('res => $res');
    List<RentModel> list = res
        .map((el) => RentModel.fromJson({
              'id': el['id'].toString(),
              // "propertie_id": int.parse(propertie_id),
              "date_init": el['date_init'],
              "date_end": el['date_end'],
              "status": el['status'],
              "client": {
                "name": el["client_name"],
                "phone": el["client_phone"]
              },
              "total_value": el['total_value'].toDouble(),
              "value_installments": el['value_installments'].toDouble(),
              "installments": el['installments'],
              "mode": el['mode']
            }))
        .toList();
    // await Future.wait(res.map((e) => setDataPropertie(e, list)));

    return list;
  }

  newRent(RentModel rent, String propertie_id) async {
    final db = await database;
    // final created_at = DateTime.now().toString();
    print('rent => $rent');
    var res = await db.rawInsert(
        "INSERT Into rents ( propertie_id, date_init, date_end, status, client_name, client_phone, total_value, value_installments, installments, mode)"
        "VALUES ( ${int.parse(propertie_id)}, '${rent.date_init}', '${rent.date_end}' ,${rentStatusEncode(rent.status)} ,'${rent.client.name}' ,'${rent.client.phone}' ,${rent.total_value} ,${rent.value_installments} ,${rent.installments} ,${rentModelEncode(rent.mode)})  ");
    return res;
  }

  Future<int> updateRent(RentModel rent, String propertie_id) async {
    final db = await database;
    dynamic rentToMat = rent.toMap();
    dynamic data = {
      "date_init": rentToMat['date_init'],
      "date_end": rentToMat['date_end'],
      "status": rentToMat['status'],
      "client_name": rent.client.name,
      "client_phone": rent.client.phone,
      "total_value": rent.total_value,
      "value_installments": rent.value_installments,
      "installments": rent.installments,
      "mode": rentToMat['mode'] // "propertie_id": int.parse(propertie_id),
    };

    print('data $data');

    return await db.update('rents', data,
        where: '$propertie_id = ?', whereArgs: [int.parse(propertie_id)]);
  }
}
