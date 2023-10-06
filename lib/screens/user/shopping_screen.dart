import 'package:dressmeup/screens/user/stepper_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Widget/constant.dart';
import '../../Widget/custom_button.dart';
import '../../Widget/custom_text.dart';
import '../../Widget/shopping_view-model.dart';
import '../../model/product_data_model.dart';
import '../../network/dio_method_view_model.dart';
import 'details_about_item.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  static final ShoppingViewModel shoppingViewModel =
      Get.put(ShoppingViewModel(), permanent: true);
  static final DioMethods homeViewModel = Get.find<DioMethods>();

  @override
  State<ShoppingScreen> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingViewModel>(
      init: ShoppingViewModel(),
      builder: (controller) => controller.cart.isEmpty
          ? Scaffold(
              body: OrientationBuilder(
                builder: ((context, orientation) {
                  return portraitModeEmpty(context);
                }),
              ),
            )
          : Scaffold(
              body: OrientationBuilder(
                builder: ((context, orientation) {
                  return portraitMode(context);
                }),
              ),
            ),
    );
  }

  Widget portraitMode(context) {
    return GetBuilder<ShoppingViewModel>(
        init: ShoppingViewModel(),
        builder: (controller) {
          return Container(
            // width: double.infinity,
            // height: double.infinity,
            color: const Color.fromRGBO(244, 245, 250, 1),
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
                    text: "Shopping cart",
                    color: const Color.fromRGBO(33, 43, 54, 1),
                    fontsize: 17,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                  trailing: InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, "/men_product_screen"),
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
                      child: const Icon(
                        Icons.add_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        height: MediaQuery.of(context).size.height * 0.715,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45)),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              ListTile(
                                trailing: CustomText(
                                  text: '${controller.cart.length}',
                                  color: const Color(0xFF5C6AC4),
                                  fontsize: 17,
                                  textAlign: TextAlign.right,
                                  fontWeight: FontWeight.w600,
                                  textOverflow: TextOverflow.ellipsis,
                                  height: 0.0,
                                ),
                                title: CustomText(
                                  text: "In your cart",
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
                                    "svgs/Cart.svg",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  if (kDebugMode) {
                                    print(controller.cart.length);
                                  }
                                  return InkWell(
                                    onTap: () {
                                      int? productId = ShoppingScreen
                                          .shoppingViewModel.cart[index].id;
                                      ProductData productData = ShoppingScreen
                                          .homeViewModel.products
                                          .where((element) =>
                                              element.id == productId)
                                          .first;

                                      Get.to(() => DetailsAboutItem(
                                            productData: productData,
                                          ));
                                    },
                                    child: Container(
                                      ///////////////////////////
                                      width: double.infinity,
                                      height: 150,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 150,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                            ),
                                            child:
                                                Constant.instance.networkImage(
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
                                                  color: const Color.fromRGBO(
                                                      33, 43, 54, 1),
                                                  fontsize: 16,
                                                  textAlign: TextAlign.left,
                                                  fontWeight: FontWeight.w400,
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
                                                  color: const Color.fromRGBO(
                                                      99, 115, 129, 1),
                                                  fontsize: 16,
                                                  textAlign: TextAlign.left,
                                                  fontWeight: FontWeight.w400,
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
                                                      const Color(0xFF5C6AC4),
                                                  fontsize: 16,
                                                  textAlign: TextAlign.right,
                                                  fontWeight: FontWeight.w400,
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
                                                            .elementAt(index)
                                                            .id ??
                                                        0);
                                              });
                                            },
                                            child: Container(
                                              height: 48,
                                              width: 48,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                                color: Color.fromRGBO(
                                                    244, 245, 250, 1),
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color(0xFF5C6AC4),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: controller.cart.length,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.12,
                        color: Colors.white,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                            color: Color.fromRGBO(244, 245, 250, 1),
                          ),
                          child: CustomBotton(
                            text:
                                'Go to Checkout  - \$${controller.totalPrice}',
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: 48,
                            fontWeight: FontWeight.w600,
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StepperScreen(activeStep: 0),
                                  ));
                            },
                            color: Colors.white,
                            backgroundcolor: const Color(0xFF5C6AC4),
                            textAlign: TextAlign.center,
                            fontsize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget portraitModeEmpty(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      color: const Color.fromRGBO(244, 245, 250, 1),
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
              text: "Shopping Cart",
              color: const Color.fromRGBO(33, 43, 54, 1),
              fontsize: 17,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              textOverflow: TextOverflow.clip,
              height: 0.0,
            ),
            trailing: InkWell(
              onTap: () => Navigator.pushReplacementNamed(
                  context, "/men_product_screen"),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                child: const Icon(
                  Icons.add_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.715,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "svgs/empty_cart.svg",
                            width: 200,
                            height: 200,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                height: 0.0,
                                text: "Cart Shopping Empty",
                                textOverflow: TextOverflow.clip,
                                fontsize: 20,
                                color: const Color(0xFF5C6AC4),
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: GetBuilder<ShoppingViewModel>(
                    init: ShoppingViewModel(),
                    builder: (controller) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.12,
                        color: Colors.white,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                            color: Color.fromRGBO(244, 245, 250, 1),
                          ),
                          child: CustomBotton(
                            text:
                                'Go to checkout  - \$${controller.totalPrice} ',
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: 48,
                            fontWeight: FontWeight.w600,
                            function: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StepperScreen(activeStep: 0),
                                )),
                            color: Colors.white,
                            backgroundcolor: const Color(0xFF5C6AC4),
                            textAlign: TextAlign.center,
                            fontsize: 17,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
