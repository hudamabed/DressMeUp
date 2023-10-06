// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widget/constant.dart';
import '../../Widget/custom_price_with_line.dart';
import '../../Widget/custom_text.dart';
import '../../network/dio_method_view_model.dart';
import '../user/details_about_item.dart';

class ShowProductListScreen extends StatefulWidget {
  const ShowProductListScreen({super.key});
  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);

  @override
  State<ShowProductListScreen> createState() => _ShowProductListScreenState();
}

class _ShowProductListScreenState extends State<ShowProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ShowProductListScreen.dioMethods.getData();
    super.initState();
  }
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
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'All Product',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color(0xFF5C6AC4),
                  ),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 280,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: ShowProductListScreen.dioMethods.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => DetailsAboutItem(
                            productData: ShowProductListScreen.dioMethods.products.elementAt(index)));
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
                                      imageUrl: ShowProductListScreen.dioMethods.products
                                          .elementAt(index)
                                          .images
                                          .first,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  
                                  
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text:
                                    ShowProductListScreen.dioMethods.products.elementAt(index).category.name,
                                height: 0.0,
                                textOverflow: TextOverflow.ellipsis,
                                fontsize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                textAlign: TextAlign.left,
                              ),
                              CustomText(
                                text: ShowProductListScreen.dioMethods.products.elementAt(index).title,
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
                                        '\$${ShowProductListScreen.dioMethods.products.elementAt(index).price}',
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
                                          '\$${ShowProductListScreen.dioMethods.products.elementAt(index).price + 56}',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
