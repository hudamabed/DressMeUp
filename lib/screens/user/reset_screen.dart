import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('images/Ima3.png',
              fit: BoxFit.cover, width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(top: 350),
            child: Container(
                height: double.infinity,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 50, right: 50),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Reset Password',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: const Color(0xFF23203F)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              'Enter your email and we\'ll send you a link to reset your password.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                  color: const Color(0xFF454F5B))
                            )),
                            const SizedBox(height: 20,),
                        Row(
                          children:  [
                            Container(
                                clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                                padding: EdgeInsets.only(right: 15),
                        child: Image.asset('images/im.jpg')),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  label: Text("Email address"),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                          const SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: (() {}),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: (() {}),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xFF5C6AC4)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: const Color(0xFFFFFFFF),
                                  minimumSize: const Size(double.infinity, 50)),
                              child: Text(
                                "Click to sign in",
                                style: GoogleFonts.roboto(
                                    color: const Color(0xFF5C6AC4),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            )



                        ],
                        ),
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
