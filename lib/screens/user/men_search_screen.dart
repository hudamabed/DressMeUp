// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widget/constant.dart';
import '../../Widget/custom_price_with_line.dart';
import '../../Widget/custom_text.dart';
import '../../model/product_data_model.dart';
import '../../network/dio_method_view_model.dart';
import 'details_about_item.dart';

class MenSearchScreen extends StatefulWidget {
  const MenSearchScreen({super.key});
  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static Set<ProductData> displayList = Set.from(dioMethods.man);

  @override
  State<MenSearchScreen> createState() => _MenSearchScreenState();
}

class _MenSearchScreenState extends State<MenSearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<DioMethods>(builder: (controller) {
                  if (MenSearchScreen.displayList.isEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.15),
                            child: SvgPicture.asset(
                              "svgs/searchEmpty.svg",
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
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
                    itemCount: MenSearchScreen.displayList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {});
                          Get.to(() => DetailsAboutItem(
                              productData: MenSearchScreen.displayList.elementAt(index)));
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
                                        imageUrl: MenSearchScreen.displayList
                                            .elementAt(index)
                                            .images
                                            .first,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF5C6AC4),
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255),
                                          ),
                                          child: const Icon(
                                            Icons.favorite_outline,
                                            color: Color(0xFF5C6AC4),
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF5C6AC4),
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255),
                                          ),
                                          child: const Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Color(0xFF5C6AC4),
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: MenSearchScreen.displayList
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
                                  text: MenSearchScreen.displayList.elementAt(index).title,
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
                                          '\$${MenSearchScreen.displayList.elementAt(index).price}',
                                      height: 0.0,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontsize: 16,
                                      color: const Color(0xFF5C6AC4),
                                      fontWeight: FontWeight.w100,
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: CustomPriceWithLine(
                                        text:
                                            '\$${MenSearchScreen.displayList.elementAt(index).price + 56}',
                                        height: 0.0,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontsize: 16,
                                        color: const Color.fromRGBO(
                                            145, 158, 171, 1),
                                        fontWeight: FontWeight.w100,
                                        textAlign: TextAlign.center,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
