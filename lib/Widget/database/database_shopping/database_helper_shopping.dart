// ignore_for_file: unused_local_variable, depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/wishlist_product_model.dart';
import '../../constant.dart';

class ShoppingDatabase {
  static final ShoppingDatabase instance = ShoppingDatabase._init();
  static Database? _database;
  ShoppingDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'ShoppingDatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      create table ${Constant.tableProductShop} (
        ${Constant.idShop} INTEGER PRIMARY key, 
        ${Constant.titleShop} text not null,
        ${Constant.priceShop} INTEGER not null,
        ${Constant.descriptionShop} text not null,
        ${Constant.imageShop} text not null)
      ''');
        await db.execute('''
      create table ${Constant.favShop} (
        ${Constant.idShop} INTEGER PRIMARY key) 
      ''');
      },
    );
  }

  create(WishListProduct cartProduct, {required bool isFromFav}) async {
    var db = await database;
    var help = await db?.insert(Constant.tableProductShop, cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    if (isFromFav) {
      var help2 = await db?.insert(
          Constant.favShop, {Constant.idShop: cartProduct.id},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<WishListProduct>> getAllProduct() async {
    var db = await database;
    List<Map> maps = await db!.query(Constant.tableProductShop);
    if (kDebugMode) {
      print(maps.toList());
    }
    List<WishListProduct> list = [];
    list = maps
        .map(
          (item) => WishListProduct(
            id: item['id'],
            image: item['image'],
            title: item['title'],
            description: item['description'],
            price: item['price'],
          ),
        )
        .toList();
    return list;
  }

  Future<bool> getProductId(int productId) async {
    var db = await database;
    List<Map<String, Object?>>? maps = await db?.query(Constant.favShop,
        where: '${Constant.idShop} = ?', whereArgs: [productId]);
    if (kDebugMode) {
      print("MSG_LENGHT getProductId in helper = ${maps?.length}");
    }
    return (maps?.length ?? 0) > 0;
  }

  update(WishListProduct wishListProduct) async {
    var db = await database;
    var help = await db?.update(
        Constant.tableProductShop, wishListProduct.toJson(),
        where: '${Constant.idShop} = ?', whereArgs: [wishListProduct.id]);
    var help2 = await db?.update(
        Constant.favShop, {Constant.id: wishListProduct.id},
        where: '${Constant.idShop} = ?', whereArgs: [wishListProduct.id]);
  }

  delete(int id) async {
    var db = await database;
    return await db
        ?.delete(Constant.tableProductShop, where: 'id = ?', whereArgs: [id]);
  }

  delete2(int id) async {
    var db = await database;
    return await db?.delete(Constant.favShop, where: 'id = ?', whereArgs: [id]);
  }
}
