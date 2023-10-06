import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late TextEditingController _textEmailEditingController;


  @override
  void initState() {
    super.initState();
    _textEmailEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
         backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('images/Icon_back.png' , height: 50, width: 50,)),

      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Container(
            height: double.infinity,
            width: double.infinity,
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
                          'Verification',
                          style: GoogleFonts.nunito(
                              fontSize: 34,
                              color: const Color(0xFF23203F)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                                'Please enter your phone number to receive a verification code.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 17,
                                    color: const Color(0xFF454F5B))
                            )),
                        const SizedBox(height: 20,),
                        Row(
                          children:  [
                            Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                                padding: const EdgeInsets.only(right: 15),
                                child: Image.asset('images/im.jpg')),
                             Expanded(
                              child: TextField(
                                controller: _textEmailEditingController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  label: Text("Email"),
                                 // suffixIcon: Icon(Icons.check,color: Colors.green,),
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
                        const SizedBox(height: 25,),
                        ElevatedButton(
                          onPressed: (() async{
                           await  FirebaseAuth.instance.sendPasswordResetEmail(email: _textEmailEditingController.text);
                           // ignore: use_build_context_synchronously
                           ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text('Check your email and rest password')));
                            // ignore: use_build_context_synchronously
                          }),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: const Color(0xFF5C6AC4),
                              minimumSize: const Size(double.infinity, 50)),
                          child: Text(
                            "Continue",
                            style: GoogleFonts.roboto(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
