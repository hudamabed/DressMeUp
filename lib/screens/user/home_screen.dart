// ignore_for_file: sized_box_for_whitespace
import 'package:dressmeup/screens/user/search_item_screen.dart';
import 'package:dressmeup/screens/user/woman_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/custom_text.dart';
import 'all_view.dart';
import 'kid_view.dart';
import 'man_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                        text:
                            'Hi, Baraa Daher!',
                        color: const Color.fromRGBO(33, 43, 54, 1),
                        fontsize: 17,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        textOverflow: TextOverflow.clip,
                        height: 0.0,
                      ),
                      trailing: InkWell(
                        onTap: () => Get.to(() => const SearchItemScreen()),
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
                            Icons.search_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7893,
                        child: TabBar(
                          physics: const BouncingScrollPhysics(),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  color:
                                      Colors.black.withOpacity(0.3))
                            ],
                          ),
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: CustomText(
                                text: "all",
                                color: Colors.black,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: "men",
                                color: Colors.black,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: "women",
                                color: Colors.black,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: "kid",
                                color: Colors.black,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(top: 24),
                        child: TabBarView(
                          physics:  BouncingScrollPhysics(),
                          children: [
                            // first tab bar view widget
                            AllView(), 
                            // second tab bar viiew widget
                            ManView(),
                            // third tab bar view widget
                            WomenView(),
                            // forth tab bar view widget
                            KidView(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
      ),
    );
  }

}
