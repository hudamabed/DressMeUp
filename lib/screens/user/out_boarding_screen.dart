import 'package:dressmeup/Widget/custom_page_indicator.dart';
import 'package:dressmeup/Widget/out_boarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
                visible: _currentPageIndex != 2,
                child: TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      'skip',
                      style: GoogleFonts.quicksand(
                          color: const Color(0xFF6C8EF2),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ))),
          ),
          Expanded(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (int currentPageIndex) {
                    setState(() => _currentPageIndex = currentPageIndex);
                  },
                  children: const [
                OutBoarding(
                  image1: 'Style',
                    image2: 'Ima1',
                    titile1: 'Originals speckled sweatshirt!',
                    subTitle1:
                        'The comfortable sweatshirt with a large front logo print.',
                ),
                OutBoarding(
                  image1: 'Style 1',
                    image2: 'Ima2',
                    titile1: 'Headphones',
                    subTitle: 'JBL JR300BT\nKids wireless on-ear\n headphones'),
                OutBoarding(
                  image1: "Logo",
                    titile1: 'Welcome!',
                    image2: 'Icon',
                    subTitle:
                        'Join us now and receive a thank you gift when you complete the registration process'),
              ])),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            CustomPageIndicator(
              currentPage: _currentPageIndex == 0,
              marginEnd: 14,
            ),
            CustomPageIndicator(
              currentPage: _currentPageIndex == 1,
              marginEnd: 14,
            ),
            CustomPageIndicator(
              currentPage: _currentPageIndex == 2,
              marginEnd: 14,
            )
          ]),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Visibility(
                visible: _currentPageIndex == 2,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: ElevatedButton(
                  onPressed: (() =>
                      Navigator.pushReplacementNamed(context, "/login_screen")),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: const Color(0xFF5C6AC4),
                      minimumSize: const Size(double.infinity, 50)),
                  child: Text(
                    "Get started",
                    style: GoogleFonts.roboto(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
