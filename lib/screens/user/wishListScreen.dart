// ignore_for_file: must_be_immutable, camel_case_types, file_names
import 'package:dressmeup/Widget/wishlist_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Widget/constant.dart';
import '../../Widget/custom_text.dart';
import '../../model/product_data_model.dart';
import '../../network/dio_method_view_model.dart';
import 'details_about_item.dart';

class wishListScreen extends StatefulWidget {
  const wishListScreen({Key? key}) : super(key: key);
  static final WishListViewModel wishListViewModel =
      Get.put(WishListViewModel(), permanent: true);
  static final DioMethods dioMethods = Get.find<DioMethods>();

  @override
  State<wishListScreen> createState() => _wishListScreenState();
}

class _wishListScreenState extends State<wishListScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListViewModel>(
        init: WishListViewModel(),
        builder: (controller) => controller.cart.isEmpty
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color.fromRGBO(249, 250, 251, 1),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ListTile(
                      leading: const SizedBox(
                        height: 48,
                        width: 48,
                      ),
                      title: CustomText(
                        text: 'Wishlist',
                        color: const Color.fromRGBO(33, 43, 54, 1),
                        fontsize: 17,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        textOverflow: TextOverflow.clip,
                        height: 0.0,
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
                        height: double.infinity,
                        width: double.infinity,
                        color: const Color.fromRGBO(249, 250, 251, 1),
                        child: Center(
                          child: SvgPicture.asset(
                            'svgs/empty_cart.svg',
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Scaffold(
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: const Color.fromRGBO(249, 250, 251, 1),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        leading: const SizedBox(
                          height: 48,
                          width: 48,
                        ),
                        title: CustomText(
                          text: 'Wishlist',
                          color: const Color.fromRGBO(33, 43, 54, 1),
                          fontsize: 17,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          textOverflow: TextOverflow.clip,
                          height: 0.0,
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
                          height: MediaQuery.of(context).size.height * 0.9049,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  trailing: CustomText(
                                    text: '${controller.cart.length}',
                                    color: const Color.fromRGBO(33, 43, 54, 1),
                                    fontsize: 17,
                                    textAlign: TextAlign.right,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  ),
                                  title: CustomText(
                                    text: 'Products',
                                    color: const Color.fromRGBO(33, 43, 54, 1),
                                    fontsize: 17,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  ),
                                  leading: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: Color.fromRGBO(244, 245, 250, 1),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_outlined,
                                        color: Color.fromRGBO(92, 106, 196, 1),
                                      )),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (kDebugMode) {
                                        print(controller.cart.length);
                                      }
                                      return InkWell(
                                        onTap: () {
                                          int? productId = wishListScreen
                                              .wishListViewModel.cart[index].id;
                                          ProductData productData =
                                              wishListScreen.dioMethods.products
                                                  .where((element) =>
                                                      element.id == productId)
                                                  .first;

                                          Get.to(() => DetailsAboutItem(
                                                productData: productData,
                                              ));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 150,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                                child: Constant.instance
                                                    .networkImage(
                                                  imageUrl: controller.cart
                                                      .elementAt(index)
                                                      .image as String,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text:
                                                          '${controller.cart.elementAt(index).title}',
                                                      color:
                                                          const Color.fromRGBO(
                                                              33, 43, 54, 1),
                                                      fontsize: 16,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                      height: 0.0,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          ' ${controller.cart.elementAt(index).description}',
                                                      color:
                                                          const Color.fromRGBO(
                                                              99, 115, 129, 1),
                                                      fontsize: 16,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      height: 0.0,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '\$${controller.cart.elementAt(index).price}',
                                                      color:
                                                          const Color.fromRGBO(
                                                              92, 106, 196, 1),
                                                      fontsize: 16,
                                                      textAlign:
                                                          TextAlign.right,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                      height: 0.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    controller.deleteProduct(
                                                        controller.cart
                                                                .elementAt(
                                                                    index)
                                                                .id ??
                                                            0);
                                                  });
                                                },
                                                child: Container(
                                                  height: 48,
                                                  width: 48,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                    color: Color.fromRGBO(
                                                        244, 245, 250, 1),
                                                  ),
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Color.fromRGBO(
                                                        92, 106, 196, 1),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: controller.cart.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 20,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
