import 'package:dressmeup/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../network/dio_method_view_model.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  static ControlViewModel controlViewModel =
      Get.put(ControlViewModel(), permanent: true);
  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  void initState() {
    ControlScreen.dioMethods.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: controller.currentScrren,
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: -5,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: GetBuilder<ControlViewModel>(
            init: ControlViewModel(),
            builder: (controller) => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.5,
              backgroundColor: const Color(0xFFFFFFFF),
              currentIndex: controller.navigator,
              onTap: (index) {
                controller.ChangeNavigatorValue(index);
              },
              items: [
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'images/Home.png',
                        color: controller.navigator == 0
                            ? const Color(0xFF5C6AC4)
                            : const Color(0xFFB3BCF5),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'images/Categories.png',
                        fit: BoxFit.contain,
                        color: controller.navigator == 1
                            ? const Color(0xFF5C6AC4)
                            : const Color(0xFFB3BCF5),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'images/Cart.png',
                        fit: BoxFit.contain,
                        color: controller.navigator == 2
                            ? const Color(0xFF5C6AC4)
                            : const Color(0xFFB3BCF5),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'images/Love.png',
                        fit: BoxFit.contain,
                        color: controller.navigator == 3
                            ? const Color(0xFF5C6AC4)
                            : const Color(0xFFB3BCF5),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'images/Person.png',
                        fit: BoxFit.contain,
                        color: controller.navigator == 4
                            ? const Color(0xFF5C6AC4)
                            : const Color(0xFFB3BCF5),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
