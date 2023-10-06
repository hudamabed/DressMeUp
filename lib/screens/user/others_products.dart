// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widget/constant.dart';
import '../../Widget/shopping_view-model.dart';
import '../../Widget/wishlist_view_model.dart';
import '../../model/wishlist_product_model.dart';
import '../../network/dio_method_view_model.dart';
import 'details_about_item.dart';

class OthersProductScreen extends StatefulWidget {
  const OthersProductScreen({super.key});
  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final WishListViewModel wishListViewModel =
      Get.put(WishListViewModel(), permanent: true);
      static final ShoppingViewModel shoppingViewModel = Get.put(ShoppingViewModel(),permanent: true);

  @override
  State<OthersProductScreen> createState() => _OthersProductScreenState();
}

class _OthersProductScreenState extends State<OthersProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 0.75),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Color(0xFF000000),
                      size: 25,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Others",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: const Color(0xFF454F5B),
                ),
              ),
              trailing: const SizedBox(
                height: 48,
                width: 48,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8211,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xFFF9FAFB),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      if (OthersProductScreen.dioMethods.others.isEmpty) {
                        return const Center(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (kDebugMode) {
                        print(OthersProductScreen.dioMethods.others.length);
                      }
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailsAboutItem(productData : OthersProductScreen.dioMethods.others
                                                .elementAt(index)));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 275,
                          color: const Color(0xFFFFFFFF),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 190,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: OthersProductScreen.dioMethods.others
                                                .elementAt(index)
                                                .images
                                                .first ==
                                            null
                                        ? Image.network(
                                            "https://demofree.sirv.com/nope-not-here.jpg",
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          )
                                        : Constant.instance.networkImage(
                                            imageUrl: OthersProductScreen.dioMethods.others
                                                .elementAt(index)
                                                .images
                                                .first,
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right:
                                        MediaQuery.of(context).size.width * 0.02,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF5C6AC4),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: const Color(0x00000000),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_outline,
                                        color: Color(0xFF5C6AC4),
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    left:
                                        MediaQuery.of(context).size.width * 0.02,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF5C6AC4),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: const Color(0x00000000),
                                      ),
                                      child: const Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Color(0xFF5C6AC4),
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    child: GetBuilder<WishListViewModel>(
                                      init: WishListViewModel(),
                                      builder: (controller) {
                                        return FutureBuilder<bool>(
                                          future: controller.getProduct(
                                              OthersProductScreen.dioMethods.others
                                                  .elementAt(index)
                                                  .id),
                                          builder: (context, snapshot) {
                                            if (kDebugMode) {
                                              print(
                                                "MSG_SNAPSHOT_DATA ${snapshot.data}");
                                            }
                                            return InkWell(
                                              onTap: () {
                                                if (kDebugMode) {
                                                  print(controller.cart.length);
                                                }
                                                if (snapshot.data ?? false) {
                                                  
                                                  setState(() {
                                                    controller
                                                      .deleteProduct(OthersProductScreen.dioMethods.others
                                                  .elementAt(index)
                                                  .id);
                                                  });
                                                } else {
                                                  
                                                  setState(() {
                                                    controller.addProduct(
                                                    WishListProduct(
                                                      title: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                          .title,
                                                      description: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                          .description,
                                                      image: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                          .images
                                                          .first,
                                                      price: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                          .price,
                                                      id: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                          .id,
                                                    ),
                                                  );
                                                  });
                                                }
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(0xFF5C6AC4),),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                  color:
                                                      Colors.transparent,
                                                ),
                                                child: Icon(
                                                  snapshot.data == true
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                  color:
                                                      const Color(0xFF5C6AC4),
                                                  size: 25,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                        top: 5,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        child: GetBuilder<ShoppingViewModel>(
                                          init: ShoppingViewModel(),
                                          builder: (controller2) {
                                            return FutureBuilder<bool>(
                                              future: controller2.getProduct(
                                                   OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                        .id),
                                              builder: (context, snapshot) {
                                                return InkWell(
                                                      onTap: () {
                                                        if (snapshot.data == true) {
                                                        controller2
                                                            .deleteProduct(
                                                                OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                        .id);
                                                        setState(() {});
                                                      } else {
                                                        controller2.addProduct(
                                                          WishListProduct(
                                                            title: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                                .title,
                                                            description: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                                .description,
                                                            image: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                                .images.first,
                                                            price: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                                .price,
                                                            id: OthersProductScreen
                                                          .dioMethods.others
                                                          .elementAt(index)
                                                                .id,
                                                          ),
                                                        );
                                                        setState(() {});
                                                      }
                                                      },
                                                      child: Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color(0xFF5C6AC4),),
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                            Radius.circular(12),
                                                          ),
                                                          color:
                                                              Colors.transparent,
                                                        ),
                                                        child: Icon(
                                                          snapshot.data == true ? Icons.shopping_cart :
                                                            Icons.shopping_cart_outlined,
                                                          color:
                                                              const Color(0xFF5C6AC4),
                                                          size: 25,
                                                        ),
                                                      ),
                                                    );
                                              }
                                            );
                                          }
                                        )
                                          
                                      ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5, left: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${OthersProductScreen.dioMethods.others.elementAt(index).category.name}',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: const Color(0xFF454F5B)),
                                    ),
                                    Text(
                                      '${OthersProductScreen.dioMethods.others.elementAt(index).price}',
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5, left: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${OthersProductScreen.dioMethods.others.elementAt(index).title}',
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                    ),
                                    Text(
                                      '${OthersProductScreen.dioMethods.others.elementAt(index).price + 56}',
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        decoration: TextDecoration.lineThrough,
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: OthersProductScreen.dioMethods.others.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
