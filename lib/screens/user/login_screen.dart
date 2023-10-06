import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(children: [
        Image.asset('images/Image.png',
            fit: BoxFit.fitHeight, width: double.infinity),

        Padding(
          padding: const EdgeInsets.only(top: 450),
          child: Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Create your unique project',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: const Color(0xFF23203F)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            'We have been proud to support people who use our platform to reach for their dreams.',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: const Color(0xFF454F5B))),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (() {Navigator.pushNamed(context, "/sign_up_screen");}),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFF5C6AC4)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: const Color(0xFFFFFFFF),
                                    minimumSize:
                                    const Size(double.infinity, 45)),
                                child: Text(
                                  "sign up",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF5C6AC4),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (() {Navigator.pushNamed(context, "/sign_in_screen");}),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: const Color(0xFF5C6AC4),
                                    minimumSize:
                                    const Size(double.infinity, 45)),
                                child: Text(
                                  "sign in",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
          top: 400,
          right: 20,
          child: Image.asset(
            'images/Logo.png',
          ),
        ),
      ]));
  }
}