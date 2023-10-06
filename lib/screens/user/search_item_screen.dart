// ignore_for_file: must_be_immutable
import 'package:dressmeup/screens/user/women_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/custom_text.dart';
import '../../Widget/search_view_model.dart';
import 'all_search_screen.dart';
import 'kid_search_screen.dart';
import 'men_search_screen.dart';

class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({Key? key}) : super(key: key);

  @override
  State<SearchItemScreen> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchItemScreen> with TickerProviderStateMixin {
  static SearchViewModel searchViewModel =
      Get.put(SearchViewModel(), permanent: true);
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: const Color.fromRGBO(249, 250, 251, 1),
          child: GetBuilder<SearchViewModel>(
              init: SearchViewModel(),
              builder: (controller) {
                return Column(
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
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      title: CustomText(
                        text: "search",
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: TextFormField(
                          onChanged: (vlaue) {
                            if (tabController!.index == 0) {
                              searchViewModel.onChangeSearch();
                              setState(() {});
                            } else if (tabController!.index == 1) {
                              searchViewModel.onChangeSearchMan();
                              setState(() {});
                            } else if (tabController!.index == 2) {
                              searchViewModel.onChangeSearchWomen();
                              setState(() {});
                            } else if (tabController!.index == 3) {
                              searchViewModel.onChangeSearchKid();
                              setState(() {});
                            }
                          },
                          textAlign: TextAlign.center,
                          cursorColor: const Color.fromRGBO(32, 46, 120, 1),
                          controller: controller.search,
                          obscureText: false,
                          cursorRadius: const Radius.circular(35),
                          decoration: const InputDecoration(
                            hintText: 'Clot hing',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(179, 188, 245, 1),
                              fontSize: 20,
                              height: 1,
                              decorationColor: Colors.transparent,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF5C6AC4),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:  Color(0xFF5C6AC4),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color:  Color(0xFF5C6AC4),
                            fontSize: 20,
                            height: 1,
                            decorationColor: Colors.transparent,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 45,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7893,
                        child: TabBar(
                          controller: tabController,
                          physics: const BouncingScrollPhysics(),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.3),
                              ),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: TabBarView(
                          controller: tabController,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            // first tab bar view widget
                            AllSearchScreen(),
                            // second tab bar viiew widget
                            MenSearchScreen(),
                            // third tab bar view widget
                            WomenSearchScreen(),
                            // forth tab bar view widget
                            KidSearchScreen(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
