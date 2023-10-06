// ignore_for_file: unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widget/constant.dart';
import '../../Widget/custom_add_cart.dart';
import '../../Widget/custom_text.dart';
import '../../Widget/details_size_item_view_model.dart';
import '../../Widget/shopping_view-model.dart';
import '../../Widget/wishlist_view_model.dart';
import '../../model/product_data_model.dart';
import '../../model/wishlist_product_model.dart';

class DetailsAboutItem extends StatefulWidget {
  DetailsAboutItem({super.key, required this.productData});

  static final DetailsSizeItemViewModel detailsSizeItemViewModel =
      Get.put(DetailsSizeItemViewModel(), permanent: true);
  static final WishListViewModel wishListViewModel =
      Get.put(WishListViewModel(), permanent: true);
  static final ShoppingViewModel shoppingViewModel =
      Get.put(ShoppingViewModel(), permanent: true);
  ProductData productData;

  @override
  State<DetailsAboutItem> createState() => _DetailsAboutItemState();
}

class _DetailsAboutItemState extends State<DetailsAboutItem> {
  int item = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailsSizeItemViewModel>(
        init: DetailsSizeItemViewModel(),
        builder: (controller) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromRGBO(249, 250, 251, 1),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ListTile(
                  leading: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.white,
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
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Color(0xFF5C6AC4),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '${widget.productData.title}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: const Color.fromRGBO(33, 43, 54, 1),
                    ),
                  ),
                  trailing: GetBuilder<WishListViewModel>(
                        init: WishListViewModel(),
                        builder: (controller2) {
                          return FutureBuilder<bool>(
                              future:
                                  controller2.getProduct(widget.productData.id),
                              builder: (context, snapshot) {
                                return InkWell(
                                  onTap: () {
                                    if (snapshot.data == true) {
                                      controller2
                                          .deleteProduct(widget.productData.id);
                                      setState(() {});
                                    } else {
                                      controller2.addProduct(
                                        WishListProduct(
                                          title: widget.productData.title,
                                          description:
                                              widget.productData.description,
                                          image:
                                              widget.productData.images.first,
                                          price: widget.productData.price,
                                          id: widget.productData.id,
                                        ),
                                      );
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(12)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.15),
                                          spreadRadius: 0,
                                          blurRadius: 10,
                                          offset: const Offset(0, 0.75),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      snapshot.data == true
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: const Color(0xFF5C6AC4),
                                      size: 30,
                                    ),
                                  ),
                                );
                              });
                        }),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8810,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            width: double.infinity,
                            height: 340,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Constant.instance.networkImage(
                              imageUrl: controller.size == 1
                                  ? widget.productData.images.first
                                  : controller.size == 2
                                      ? widget.productData.images[1]
                                      : controller.size == 3
                                          ? widget.productData.images[2]
                                          : "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.productData.category.name}',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: const Color.fromRGBO(33, 43, 54, 1),
                                ),
                              ),
                              Text(
                                '${widget.productData.price}',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: const Color(0xFF5C6AC4),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.productData.title}',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: const Color.fromRGBO(33, 43, 54, 1),
                                ),
                              ),
                              Text(
                                '${widget.productData.price + 56}',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color.fromRGBO(145, 158, 171, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Visibility(
                            visible:
                                widget.productData.category.name == 'Clothes',
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    item = 1;
                                    controller.changeSize(lenght: item);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: controller.size == 1
                                          ? const Color(0xFF5C6AC4)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'S',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: controller.size == 1
                                                ? Colors.white
                                                : const Color(0xFF5C6AC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    item = 2;
                                    controller.changeSize(lenght: item);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: controller.size == 2
                                          ? const Color(0xFF5C6AC4)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'M',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: controller.size == 2
                                                ? Colors.white
                                                : const Color(0xFF5C6AC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    item = 3;
                                    controller.changeSize(lenght: item);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: controller.size == 3
                                          ? const Color(0xFF5C6AC4)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'L',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: controller.size == 3
                                                ? Colors.white
                                                : const Color(0xFF5C6AC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible:
                                widget.productData.category.name == 'Shoes',
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    item = 1;
                                    controller.changeSize(lenght: item);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF5C6AC4),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: controller.size == 1
                                          ? const Color(0xFF5C6AC4)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '38',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: controller.size == 1
                                                ? Colors.white
                                                : const Color(0xFF5C6AC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    item = 2;
                                    controller.changeSize(lenght: item);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFF5C6AC4)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: controller.size == 2
                                          ? const Color(0xFF5C6AC4)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '42',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: controller.size == 2
                                                ? Colors.white
                                                : const Color(0xFF5C6AC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    item = 3;
                                    controller.changeSize(lenght: item);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFF5C6AC4)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: controller.size == 3
                                          ? const Color(0xFF5C6AC4)
                                          : Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '45',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: controller.size == 3
                                                ? Colors.white
                                                : const Color(0xFF5C6AC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          
                          GetBuilder<ShoppingViewModel>(
                                  init: ShoppingViewModel(),
                                  builder: (controller) {
                                    return FutureBuilder<bool>(
                                        future: controller
                                            .getProduct(widget.productData.id),
                                        builder: (context, snapshot) {
                                          return CustomAddCart(
                                            text: "Add to Cart",
                                            image: "svgs/Cart.svg",
                                            width: double.infinity,
                                            height: 48,
                                            fontWeight: FontWeight.w600,
                                            function: () {
                                              controller.addProduct(
                                                WishListProduct(
                                                  title:
                                                      widget.productData.title,
                                                  description: widget
                                                      .productData.description,
                                                  image: widget
                                                      .productData.images.first,
                                                  price:
                                                      widget.productData.price,
                                                  id: widget.productData.id,
                                                ),
                                              );
                                              setState(() {});
                                            },
                                            color: Colors.white,
                                            backgroundcolor:
                                                const Color(0xFF5C6AC4),
                                            textAlign: TextAlign.center,
                                            fontsize: 17,
                                          );
                                        });
                                  }),
                          const SizedBox(
                            height: 28,
                          ),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(12),
                              height: 48,
                              width: 48,
                              alignment: Alignment.topLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromRGBO(244, 245, 250, 1),
                              ),
                              child: SvgPicture.asset(
                                "svgs/Star.svg",
                                color: const Color(0xFF5C6AC4),
                              ),
                            ),
                            title: CustomText(
                              text: '5.0',
                              color: const Color.fromRGBO(33, 43, 54, 1),
                              fontsize: 17,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              height: 0.0,
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          ExpansionTile(
                            leading: Container(
                              padding: const EdgeInsets.all(12),
                              height: 48,
                              width: 48,
                              alignment: Alignment.topLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromRGBO(244, 245, 250, 1),
                              ),
                              child: SvgPicture.asset(
                                "svgs/Books.svg",
                                color: const Color(0xFF5C6AC4),
                              ),
                            ),
                            title: CustomText(
                              text: "About brand",
                              color: const Color.fromRGBO(33, 43, 54, 1),
                              fontsize: 17,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              height: 0.0,
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.all(12),
                              height: 48,
                              width: 48,
                              alignment: Alignment.topLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromRGBO(244, 245, 250, 1),
                              ),
                              child: Center(
                                child: Icon(
                                  controller.customTileExpanded
                                      ? Icons.remove
                                      : Icons.add,
                                  color: const Color(0xFF5C6AC4),
                                  size: 25,
                                ),
                              ),
                            ),
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomText(
                                  text: widget.productData.description,
                                  color: const Color.fromRGBO(99, 115, 129, 1),
                                  fontsize: 17,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w300,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ),
                            ],
                            onExpansionChanged: (bool expanded) {
                              controller.changeStateExpanded(expanded);
                            },
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          ExpansionTile(
                            leading: Container(
                              padding: const EdgeInsets.all(12),
                              height: 48,
                              width: 48,
                              alignment: Alignment.topLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromRGBO(244, 245, 250, 1),
                              ),
                              child: SvgPicture.asset(
                                "svgs/Shipping.svg",
                                color: const Color(0xFF5C6AC4),
                              ),
                            ),
                            title: CustomText(
                              text: "shipping",
                              color: const Color.fromRGBO(33, 43, 54, 1),
                              fontsize: 17,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              height: 0.0,
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.all(12),
                              height: 48,
                              width: 48,
                              alignment: Alignment.topLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromRGBO(244, 245, 250, 1),
                              ),
                              child: Center(
                                child: Icon(
                                  controller.customTileExpanded2
                                      ? Icons.remove
                                      : Icons.add,
                                  color: const Color(0xFF5C6AC4),
                                  size: 25,
                                ),
                              ),
                            ),
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomText(
                                  text:
                                      'Orders are delivered on business days excluding public holidays. We do not deliver on Sundays or holidays.',
                                  color: const Color.fromRGBO(99, 115, 129, 1),
                                  fontsize: 17,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w300,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ),
                            ],
                            onExpansionChanged: (bool expanded) {
                              controller.changeStateExpanded2(expanded);
                            },
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
