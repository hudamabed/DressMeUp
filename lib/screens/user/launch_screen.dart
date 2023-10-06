import 'package:dressmeup/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    late String route;
    Future.delayed(const Duration(seconds: 2), () {
      if (SharedPref().loggedIn) {
        route = '/control_screen';
      } else if (SharedPref().loggedInAdmin) {
        route = '/chooseAdmin_admin';
      } else {
        route = '/out_boarding_screen';
      }
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bc.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/Logo.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome!",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: const Color(0xFF23203F))),
                  Text(
                    "We’ve been proud to support people who use our platform to reach for their dreams.!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: const Color(0xFF454F5B)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
