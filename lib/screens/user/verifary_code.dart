import 'package:dressmeup/Widget/_textFieldOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: const Color(0xFFF9FAFB),
          ),
          preferredSize: Size.fromHeight(100)),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Verification code',
                            style: GoogleFonts.nunito(
                                fontSize: 34, color: const Color(0xFF23203F)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                                  'Please enter the verification code we sent to your phone number',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17,
                                      color: const Color(0xFF454F5B)))),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textFieldOTP(
                                  context: context,
                                  context1: context,
                                  first: true,
                                  last: false),
                              textFieldOTP(
                                  context: context,
                                  context1: context,
                                  first: false,
                                  last: false),
                              textFieldOTP(
                                  context: context,
                                  context1: context,
                                  first: false,
                                  last: false),
                              textFieldOTP(
                                  context: context,
                                  context1: context,
                                  first: false,
                                  last: false),
                              textFieldOTP(
                                  context: context,
                                  context1: context,
                                  first: false,
                                  last: true),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: (() {}),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: const Color(0xFF5C6AC4),
                                minimumSize: const Size(double.infinity, 50)),
                            child: Text(
                              "Done",
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Didn't you receive any code?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Resend New Code",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF5C6AC4),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
