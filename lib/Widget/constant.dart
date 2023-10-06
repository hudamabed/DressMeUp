import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constant {
  Constant._();
  static Constant instance = Constant._();

  static String tableProduct = 'WishListDatabase';
  static String id = 'id';
  static String title = 'title';
  static String price = 'price';
  static String description = 'description';
  static String image = 'image';
  static var fav = "Fav";
  
  static String tableProductShop = 'ShoppingDatabase';
  static String idShop = 'id';
  static String titleShop = 'title';
  static String priceShop = 'price';
  static String descriptionShop = 'description';
  static String imageShop = 'image';
  static var favShop = "Fav";

  Widget networkImage(
      {required String imageUrl,
      double? width,
      double? height,
      BoxFit fit = BoxFit.cover}) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: fit,
            ),
          ),
        );
      },
      imageUrl: 'https://demofree.sirv.com/nope-not-here.jpg',
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      fit: BoxFit.cover,
      placeholder: (context, String? url) {
        return const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Color(0xFF5C6AC4),
              strokeWidth: 2,
            ),
          ),
          // ),
        );
      },
    );
  }


  mainSnack({String? title, required String body, Color? backgroundColor}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: backgroundColor ?? const Color(0xFF303030),
        message: body,
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }

  snackSuccess({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: Colors.green);
  }

  snackError({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: Colors.red);
  }
  
}
