// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/constant.dart';
import '../../Widget/custom_price_with_line.dart';
import '../../Widget/custom_text.dart';
import '../../Widget/shopping_view-model.dart';
import '../../Widget/wishlist_view_model.dart';
import '../../model/wishlist_product_model.dart';
import '../../network/dio_method_view_model.dart';
import 'details_about_item.dart';

class ManView extends StatefulWidget {
  const ManView({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final WishListViewModel cartViewModel =
      Get.put(WishListViewModel(), permanent: true);
  static final ShoppingViewModel shoppingViewModel = Get.put(ShoppingViewModel(),permanent: true);

  @override
  State<ManView> createState() => _ManViewState();
}

class _ManViewState extends State<ManView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    if (kDebugMode) {
      print(ManView.dioMethods.man.length);
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<DioMethods>(builder: (controller) {
                  if (ManView.dioMethods.man.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GetBuilder<WishListViewModel>(
                      init: WishListViewModel(),
                      builder: (context1) {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 280,
                            childAspectRatio: (itemWidth / itemHeight),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: ManView.dioMethods.man.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => DetailsAboutItem(productData : ManView.dioMethods.man
                                                .elementAt(index)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                ),
                                width: 160,
                                height: 240,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            child: Constant.instance.networkImage(
                                                imageUrl: ManView.dioMethods.man
                                                    .elementAt(index)
                                                    .images
                                                    .first,
                                                fit: BoxFit.fill),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            child: GetBuilder<WishListViewModel>(
                                              init: WishListViewModel(),
                                              builder: (controller) {
                                                return FutureBuilder<bool>(
                                                  future: controller.getProduct(
                                                      ManView.dioMethods.man
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
                                                          print(controller
                                                            .cart.length);
                                                        }
                                                        if (snapshot.data ??
                                                            false) {
                                                          
                                                          setState(() {
                                                            controller.deleteProduct( ManView.dioMethods.man
                                                          .elementAt(index)
                                                          .id);
                                                          });
                                                        } else {
                                                          
                                                          setState(() {
                                                            controller.addProduct(
                                                            WishListProduct(
                                                              title: ManView
                                                                  .dioMethods
                                                                  .man
                                                                  .elementAt(
                                                                      index)
                                                                  .title,
                                                              description: ManView
                                                                  .dioMethods
                                                                  .man
                                                                  .elementAt(
                                                                      index)
                                                                  .description,
                                                              image: ManView
                                                                  .dioMethods
                                                                  .man
                                                                  .elementAt(
                                                                      index)
                                                                  .images
                                                                  .first,
                                                              price: ManView
                                                                  .dioMethods
                                                                  .man
                                                                  .elementAt(
                                                                      index)
                                                                  .price,
                                                              id: ManView
                                                                  .dioMethods
                                                                  .man
                                                                  .elementAt(
                                                                      index)
                                                                  .id,
                                                            ),
                                                          );
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color.fromRGBO(92, 106, 196, 1)),
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                            Radius.circular(12),
                                                          ),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Icon(
                                                          snapshot.data == true
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_outline,
                                                          color: const  Color.fromRGBO(92, 106, 196, 1),
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
                                                   ManView.dioMethods.man
                                                          .elementAt(index)
                                                        .id),
                                              builder: (context, snapshot) {
                                                return InkWell(
                                                      onTap: () {
                                                        if (snapshot.data == true) {
                                                        controller2
                                                            .deleteProduct(
                                                                ManView.dioMethods.man
                                                          .elementAt(index)
                                                        .id);
                                                        setState(() {});
                                                      } else {
                                                        controller2.addProduct(
                                                          WishListProduct(
                                                            title: ManView.dioMethods.man
                                                          .elementAt(index)
                                                                .title,
                                                            description: ManView.dioMethods.man
                                                          .elementAt(index)
                                                                .description,
                                                            image: ManView.dioMethods.man
                                                          .elementAt(index)
                                                                .images.first,
                                                            price: ManView.dioMethods.man
                                                          .elementAt(index)
                                                                .price,
                                                            id: ManView.dioMethods.man
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
                                                              color: const Color.fromRGBO(92, 106, 196, 1)),
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
                                                              const Color.fromRGBO(92, 106, 196, 1),
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
                                      CustomText(
                                        text: ManView.dioMethods.man
                                            .elementAt(index)
                                            .category
                                            .name,
                                        height: 0.0,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontsize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w200,
                                        textAlign: TextAlign.left,
                                      ),
                                      CustomText(
                                        text: ManView.dioMethods.man
                                            .elementAt(index)
                                            .title,
                                        height: 0.0,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontsize: 16,
                                        color: const Color.fromRGBO(99, 115, 129, 1),
                                        fontWeight: FontWeight.w200,
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text:
                                                '\$${ManView.dioMethods.man.elementAt(index).price}',
                                            height: 0.0,
                                            textOverflow: TextOverflow.ellipsis,
                                            fontsize: 16,
                                            color: const Color.fromRGBO(92, 106, 196, 1),
                                            fontWeight: FontWeight.w100,
                                            textAlign: TextAlign.left,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.15,
                                            child: CustomPriceWithLine(
                                              text:
                                                  '\$${ManView.dioMethods.man.elementAt(index).price + 56}',
                                              height: 0.0,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontsize: 16,
                                              color: const Color.fromRGBO(145, 158, 171, 1),
                                              fontWeight: FontWeight.w100,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
