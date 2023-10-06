import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Widget/constant.dart';
import '../../Widget/custom_price_with_line.dart';
import '../../Widget/custom_text.dart';
import '../../Widget/shopping_view-model.dart';
import '../../Widget/wishlist_view_model.dart';
import '../../model/product_data_model.dart';
import '../../model/wishlist_product_model.dart';
import '../../network/dio_method_view_model.dart';
import 'details_about_item.dart';

class AllView extends StatefulWidget {
  const AllView({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final WishListViewModel cartViewModel =
      Get.put(WishListViewModel(), permanent: true);

  static final ShoppingViewModel shoppingViewModel =
      Get.put(ShoppingViewModel(), permanent: true);

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  @override
  void initState() {
    super.initState();
    AllView.dioMethods.getData();
  }

  IconData favoriteSelect = Icons.favorite_outline;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 220,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  "images/Slider.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              trailing: InkWell(
                onTap: () {},
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(92, 106, 196, 1)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromRGBO(92, 106, 196, 1),
                    size: 20,
                  ),
                ),
              ),
              title: CustomText(
                text: "New arrivals",
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
                child: SvgPicture.asset(
                  "svgs/Fire.svg",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GetBuilder<DioMethods>(builder: (context) {
                if (AllView.dioMethods.products.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    for (int i = 0; i < 9; i++) getGridView(index: i),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              trailing: InkWell(
                onTap: () {},
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(92, 106, 196, 1)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromRGBO(92, 106, 196, 1),
                    size: 20,
                  ),
                ),
              ),
              title: CustomText(
                text: "Most popular",
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
                child: SvgPicture.asset(
                  "svgs/Star.svg",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GetBuilder<DioMethods>(builder: (controller) {
                if (AllView.dioMethods.products.isEmpty) {
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 280,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: AllView.dioMethods.products.length > 2
                            ? 2
                            : AllView.dioMethods.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailsAboutItem(
                                  productData: AllView.dioMethods.products
                                      .elementAt(index + 1)));
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(children: [
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
                                            imageUrl: AllView
                                                .dioMethods.products
                                                .elementAt(index + 1)
                                                .images
                                                .first,
                                            fit: BoxFit.fill),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        child: GetBuilder<WishListViewModel>(
                                            init: WishListViewModel(),
                                            builder: (controller1) {
                                              return FutureBuilder<bool>(
                                                future: controller1.getProduct(
                                                    AllView.dioMethods.products
                                                        .elementAt(index + 1)
                                                        .id),
                                                builder: (context, snapshot) {
                                                  if (kDebugMode) {
                                                    print(
                                                      "MSG_SNAPSHOT_DATA ${snapshot.data}");
                                                  }
                                                  return InkWell(
                                                    onTap: () {
                                                      if (snapshot.data ==
                                                          true) {
                                                        controller1
                                                            .deleteProduct(
                                                                AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .id);
                                                        setState(() {});
                                                      } else {
                                                        controller1.addProduct(
                                                          WishListProduct(
                                                            title: AllView
                                                                .dioMethods
                                                                .products
                                                                .elementAt(
                                                                    index + 1)
                                                                .title,
                                                            description: AllView
                                                                .dioMethods
                                                                .products
                                                                .elementAt(
                                                                    index + 1)
                                                                .description,
                                                            image: AllView
                                                                .dioMethods
                                                                .products
                                                                .elementAt(
                                                                    index + 1)
                                                                .images
                                                                .first,
                                                            price: AllView
                                                                .dioMethods
                                                                .products
                                                                .elementAt(
                                                                    index + 1)
                                                                .price,
                                                            id: AllView
                                                                .dioMethods
                                                                .products
                                                                .elementAt(
                                                                    index + 1)
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
                                                        color: Colors
                                                            .transparent,
                                                      ),
                                                      child: Icon(
                                                        snapshot.data == true
                                                            ? Icons.favorite
                                                            : favoriteSelect,
                                                        color: const Color.fromRGBO(92, 106, 196, 1),
                                                        size: 25,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                      ),
                                      Positioned(
                                          top: 5,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          child: GetBuilder<ShoppingViewModel>(
                                              init: ShoppingViewModel(),
                                              builder: (controller2) {
                                                return FutureBuilder<bool>(
                                                    future: controller2
                                                        .getProduct(AllView
                                                            .dioMethods.products
                                                            .elementAt(
                                                                index + 1)
                                                            .id),
                                                    builder:
                                                        (context, snapshot) {
                                                      return InkWell(
                                                        onTap: () {
                                                          if (snapshot.data ==
                                                              true) {
                                                            controller2.deleteProduct(
                                                                AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .id);
                                                            setState(() {});
                                                          } else {
                                                            controller2
                                                                .addProduct(
                                                              WishListProduct(
                                                                title: AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .title,
                                                                description: AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .description,
                                                                image: AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .images
                                                                    .first,
                                                                price: AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .price,
                                                                id: AllView
                                                                    .dioMethods
                                                                    .products
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .id,
                                                              ),
                                                            );
                                                            setState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color.fromRGBO(92, 106, 196, 1),),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  12),
                                                            ),
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                          child: Icon(
                                                            snapshot.data ==
                                                                    true
                                                                ? Icons
                                                                    .shopping_cart
                                                                : Icons
                                                                    .shopping_cart_outlined,
                                                            color: const Color.fromRGBO(92, 106, 196, 1),
                                                            size: 25,
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              })),
                                    ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text: AllView.dioMethods.products
                                          .elementAt(index + 1)
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
                                      text: AllView.dioMethods.products
                                          .elementAt(index + 1)
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
                                              '\$${AllView.dioMethods.products.elementAt(index + 1).price}',
                                          height: 0.0,
                                          textOverflow: TextOverflow.ellipsis,
                                          fontsize: 16,
                                          color: const Color.fromRGBO(92, 106, 196, 1),
                                          fontWeight: FontWeight.w100,
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          child: CustomPriceWithLine(
                                            text:
                                                '\$${AllView.dioMethods.products.elementAt(index + 1).price + 56}',
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
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget getGridView({required int index}) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    List<ProductData> data = [];
    if (index % 4 == 0) {
      data = AllView.dioMethods.products
          .toList()
          .sublist(index, index % 4 == 0 ? index + 2 : 0);
    }

    return data.isNotEmpty
        ? Column(
            children: [
              GetBuilder<WishListViewModel>(
                  init: WishListViewModel(),
                  builder: (controller) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 280,
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int idx) {
                        return InkWell(
                          onTap: () {
                            Get.to(() =>
                                DetailsAboutItem(productData: data[idx]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                            ),
                            width: 160,
                            height: 240,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          imageUrl: data[idx].images.first,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        child: FutureBuilder<bool>(
                                          future: controller
                                              .getProduct(data[idx].id),
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
                                                if (snapshot.data == true) {
                                                  setState(() {
                                                    controller.deleteProduct(
                                                        data[idx].id);
                                                  });
                                                } else {
                                                  setState(() {
                                                    controller.addProduct(
                                                      WishListProduct(
                                                        title: data[idx].title,
                                                        description: data[idx]
                                                            .description,
                                                        image: data[idx]
                                                            .images
                                                            .first,
                                                        price: data[idx].price,
                                                        id: data[idx].id,
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
                                                      color: const Color.fromRGBO(92, 106, 196, 1),),
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
                                                      : favoriteSelect,
                                                  color:
                                                      const Color.fromRGBO(92, 106, 196, 1),
                                                  size: 25,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                          top: 5,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          child: GetBuilder<ShoppingViewModel>(
                                              init: ShoppingViewModel(),
                                              builder: (controller2) {
                                                return FutureBuilder<bool>(
                                                    future:
                                                        controller2.getProduct(
                                                            data[idx].id),
                                                    builder:
                                                        (context, snapshot) {
                                                      return InkWell(
                                                        onTap: () {
                                                          if (snapshot.data ==
                                                              true) {
                                                            controller2
                                                                .deleteProduct(
                                                                    data[idx]
                                                                        .id);
                                                            setState(() {});
                                                          } else {
                                                            controller2
                                                                .addProduct(
                                                              WishListProduct(
                                                                title: data[idx]
                                                                    .title,
                                                                description: data[
                                                                        idx]
                                                                    .description,
                                                                image: data[idx]
                                                                    .images
                                                                    .first,
                                                                price: data[idx]
                                                                    .price,
                                                                id: data[idx]
                                                                    .id,
                                                              ),
                                                            );
                                                            setState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color.fromRGBO(92, 106, 196, 1),),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  12),
                                                            ),
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                          child: Icon(
                                                            snapshot.data ==
                                                                    true
                                                                ? Icons
                                                                    .shopping_cart
                                                                : Icons
                                                                    .shopping_cart_outlined,
                                                            color: const Color.fromRGBO(92, 106, 196, 1),
                                                            size: 25,
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              })),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: data[idx].category.name,
                                    height: 0.0,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontsize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    textAlign: TextAlign.left,
                                  ),
                                  CustomText(
                                    text: data[idx].title,
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
                                        text: '\$${data[idx].price}',
                                        height: 0.0,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontsize: 16,
                                        color: const Color.fromRGBO(92, 106, 196, 1),
                                        fontWeight: FontWeight.w100,
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: CustomPriceWithLine(
                                          text: '\$${data[idx].price + 56}',
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
                  }),
              index % 3 == 1
                  ? Container(
                      height: 90,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 242, 218, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/Gift.png",
                              height: 22,
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Free Shipping over \$49',
                                  color: const Color.fromRGBO(186, 116, 76, 1),
                                  fontsize: 17,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                CustomText(
                                  text: 'free returns and exchange',
                                  color: const Color.fromRGBO(222, 144, 78, 1),
                                  fontsize: 13,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/Gift.png",
                              height: 22,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          )
        : const SizedBox();
  }
}
