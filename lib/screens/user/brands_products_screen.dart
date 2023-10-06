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

class BrandsProductScreen extends StatefulWidget {
  const BrandsProductScreen({super.key});
  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final WishListViewModel wishListViewModel =
      Get.put(WishListViewModel(), permanent: true);
      static final ShoppingViewModel shoppingViewModel = Get.put(ShoppingViewModel(),permanent: true);

  @override
  State<BrandsProductScreen> createState() => _BrandsProductScreenState();
}

class _BrandsProductScreenState extends State<BrandsProductScreen> {
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
                "Brands",
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
                      if (BrandsProductScreen.dioMethods.shoes.isEmpty) {
                        return const Center(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (kDebugMode) {
                        print(BrandsProductScreen.dioMethods.shoes.length);
                      }
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailsAboutItem(productData : BrandsProductScreen.dioMethods.shoes
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
                                    child: BrandsProductScreen.dioMethods.shoes
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
                                            imageUrl: BrandsProductScreen.dioMethods.shoes
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
                                              BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
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
                                                    controller.deleteProduct(BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                  .id);
                                                  });
                                             
                                                } else {
                                                  setState(() {
                                                    controller.addProduct(
                                                    WishListProduct(
                                                      title: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                          .title,
                                                      description:
                                                          BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                              .description,
                                                      image: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                          .images
                                                          .first,
                                                      price: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                          .price,
                                                      id: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
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
                                                      color:const Color(0xFF5C6AC4),),
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
                                                   BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                        .id),
                                              builder: (context, snapshot) {
                                                return InkWell(
                                                      onTap: () {
                                                        if (snapshot.data == true) {
                                                        controller2
                                                            .deleteProduct(
                                                                BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                        .id);
                                                        setState(() {});
                                                      } else {
                                                        controller2.addProduct(
                                                          WishListProduct(
                                                            title: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                                .title,
                                                            description: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                                .description,
                                                            image: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                                .images.first,
                                                            price: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
                                                                .price,
                                                            id: BrandsProductScreen
                                          .dioMethods.shoes.elementAt(index)
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
                                      '${BrandsProductScreen.dioMethods.shoes.elementAt(index).category.name}',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: const Color(0xFF454F5B)),
                                    ),
                                    Text(
                                      '${BrandsProductScreen.dioMethods.shoes.elementAt(index).price}',
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
                                      '${BrandsProductScreen.dioMethods.shoes.elementAt(index).title}',
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                    ),
                                    Text(
                                      '${BrandsProductScreen.dioMethods.shoes.elementAt(index).price + 56}',
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
                    itemCount: BrandsProductScreen.dioMethods.shoes.length,
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
