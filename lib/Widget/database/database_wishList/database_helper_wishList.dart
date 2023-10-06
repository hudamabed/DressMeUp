// ignore_for_file: unused_local_variable, depend_on_referenced_packages, file_names

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/wishlist_product_model.dart';
import '../../constant.dart';

class WishListDatabase {
  static final WishListDatabase instance = WishListDatabase._init();
  static Database? _database;
  WishListDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'WishListDatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      create table ${Constant.tableProduct} (
        ${Constant.id} INTEGER PRIMARY key, 
        ${Constant.title} text not null,
        ${Constant.price} INTEGER not null,
        ${Constant.description} text not null,
        ${Constant.image} text not null)
      ''');
        await db.execute('''
      create table ${Constant.fav} (
        ${Constant.id} INTEGER PRIMARY key) 
      ''');
      },
    );
  }

  create(WishListProduct wishListProduct, {required bool isFromFav}) async {
    var db = await database;
    var help = await db?.insert(Constant.tableProduct, wishListProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    if (isFromFav) {
      var help2 = await db?.insert(
          Constant.fav, {Constant.id: wishListProduct.id},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<WishListProduct>> getAllProduct() async {
    var db = await database;
    List<Map> maps = await db!.query(Constant.tableProduct);
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
    List<Map<String, Object?>>? maps = await db?.query(Constant.fav,
        where: '${Constant.id} = ?', whereArgs: [productId]);
    if (kDebugMode) {
      print("MSG_LENGHT getProductId in helper = ${maps?.length}");
    }
    return (maps?.length ?? 0) > 0;
  }

  update(WishListProduct wishListProduct) async {
    var db = await database;
    var help = await db?.update(Constant.tableProduct, wishListProduct.toJson(),
        where: '${Constant.id} = ?', whereArgs: [wishListProduct.id]);
    var help2 = await db?.update(
        Constant.fav, {Constant.id: wishListProduct.id},
        where: '${Constant.id} = ?', whereArgs: [wishListProduct.id]);
  }

//   Future<void> update1(WishListProduct wishListProduct) async {
//   final db = await database;
//   final rowsUpdated = await db?.update(
//     Constant.tableProduct,
//     wishListProduct.toJson(),
//     where: '${Constant.id} = ?',
//     whereArgs: [wishListProduct.id],
//   );

//   if (rowsUpdated! > 0) {
//     await db?.update(
//       Constant.fav,
//       {Constant.id: wishListProduct.id},
//       where: '${Constant.id} = ?',
//       whereArgs: [wishListProduct.id],
//     );
//   }
// }

  delete(int id) async {
    var db = await database;
    return await db
        ?.delete(Constant.tableProduct, where: 'id = ?', whereArgs: [id]);
  }

  delete2(int id) async {
    var db = await database;
    return await db?.delete(Constant.fav, where: 'id = ?', whereArgs: [id]);
  }

// delete3(int id) async {
//   var db = await database;

//   if (db != null) {
//     // Delete from Constant.tableProduct
//     await db.delete(Constant.tableProduct, where: 'id = ?', whereArgs: [id]);

//     // Delete from Constant.fav
//     await db.delete(Constant.fav, where: 'id = ?', whereArgs: [id]);

//     return;
//   }

//   throw Exception('Database is null. Unable to delete item.');
// }
}
