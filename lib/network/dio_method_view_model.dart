import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';
import '../Widget/constant.dart';
import '../model/product_data_model.dart';
import 'constant_network.dart';
import 'dio_manage_class.dart';

class DioMethods extends GetxController {
  Set<ProductData> products = {};
  Set<ProductData> shoes = {};
  Set<ProductData> clothes = {};
  Set<ProductData> furniture = {};
  Set<ProductData> electronics = {};
  Set<ProductData> others = {};
  Set<ProductData> man = {};
  Set<ProductData> women = {};
  Set<ProductData> kid = {};
  Set<ProductData> supman = {};
  Set<ProductData> supwomen = {};
  Set<ProductData> supkid = {};

  void getData() async {
    dio.Response<dynamic> res =
        await DioManagerClass.getInstance.dioGetMethod(url: 'products');
    if (res.statusCode == 200) {
      List data = res.data;
      Set<ProductData> productsList =
          data.map((e) => ProductData.fromJson(e)).toSet();

      products = productsList;
      if (productsList.isNotEmpty) {
        for (int i = 0; i < products.length; i++) {
          if (i <= 20) {
            shoes.add(products.elementAt(i));
          } else if (i > 20 && i <= 40) {
            clothes.add(products.elementAt(i));
          } else if (i > 40 && i <= 60) {
            furniture.add(products.elementAt(i));
          } else if (i > 60 && i <= 85) {
            electronics.add(products.elementAt(i));
          } else if (i > 85 && i <= 100) {
            others.add(products.elementAt(i));
          }
        }
      }
      int num1= 0;
      int num2= 0;
      int num3= 0;
      int num4= 0;
      int num5= 0;
      if (productsList.isNotEmpty) {
        for (int i = 0; i < products.length; i++) {
          if (i <= 20) {
            if(num1 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num1++;
            }else if (num1 >= 5 && num1 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num1++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num1++;
            }
          } else if (i > 20 && i <= 40) {
            if(num2 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num2++;
            }else if (num2 >= 5 && num2 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num2++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num2++;
            }
          } else if (i > 40 && i <= 60) {
            if(num3 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num3++;
            }else if (num3 >= 5 && num3 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num3++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num3++;
            }
          } else if (i > 60 && i <= 85) {
            if(num4 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num4++;
            }else if (num4 >= 5 && num4 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num4++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num4++;
            }
          } else if (i > 85 && i <= 100) {
            if(num5 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num5++;
            }else if (num5 >= 5 && num5 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num5++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num5++;
            }
          }
        }
      }

    }
    update();
  }


  Future<dynamic> postProduct({required String title , required int price , required String description , required int categoryId , required List<dynamic> images}) async {
    try {
      dio.Response<dynamic> res =
        await DioManagerClass.getInstance.dioPostMethod(
      url: 'products/',
      body: {
      'title': title,
      'price': price,
      'description': description,
      "categoryId": categoryId,
      "images": images,
    },
      header: ConstantNetwork.header(TypeToken.authorizationContentType),
    ).then((value)  {
      if(value.statusCode == 200 || value.statusCode == 201){
        return Constant.instance.snackSuccess(body: value.statusMessage ?? 'Done');
      }else{
        return Constant.instance.snackError(body:value.statusMessage ?? 'Error');
      }
      });
    return res.data;
    } catch (e) {
      Logger().e("catch error :  $e");
    }
    update();
  }


}
