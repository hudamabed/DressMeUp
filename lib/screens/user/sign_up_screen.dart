import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dressmeup/firebase/firebase_controller.dart';
import '../../model/user.dart';
import '../../shared/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _passwordVisible;

  late TextEditingController _textEmailEditingController;
  late TextEditingController _textPassworedEditingController;
  late TextEditingController _textNameEditingController;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _textEmailEditingController = TextEditingController();
    _textPassworedEditingController = TextEditingController();
    _textNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textPassworedEditingController.dispose();
    _textNameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('images/Ima4.png',
              fit: BoxFit.cover, width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(top: 250),
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
                              'New account',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: const Color(0xFF23203F)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset('images/im.jpg')),
                                Expanded(
                                  child: TextField(
                                    controller: _textNameEditingController,
                                    decoration: const InputDecoration(
                                      label: Text("Full name"),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset('images/im.jpg')),
                                Expanded(
                                  child: TextField(
                                    controller: _textEmailEditingController,
                                    decoration: const InputDecoration(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset('images/im.jpg')),
                                Expanded(
                                  child: TextField(
                                    controller: _textPassworedEditingController,
                                    obscureText: !_passwordVisible,
                                    decoration: InputDecoration(
                                      label: const Text("Password"),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      border: const UnderlineInputBorder(
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
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await performRegister();
                              },
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
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0xFF5C6AC4)),
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

  Future<void> performRegister() async {
    if (check()) {
      await register();
    }
  }

  bool check() {
    if (_textNameEditingController.text.isNotEmpty &&
        _textEmailEditingController.text.isNotEmpty &&
        _textPassworedEditingController.text.isNotEmpty) {
      return true;
    }
    if (_textEmailEditingController.text.isEmpty &&
        _textPassworedEditingController.text.isEmpty &&
        _textNameEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Write the information')));
    } else if (_textPassworedEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Write Password')));
    } else if (_textNameEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Write Your name')));
    } else if (_textEmailEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Write Email ')));
    }
    return false;
  }

  Future<void> register() async {
    bool register = await FirebaseAuthController().createAccount(
        email: _textEmailEditingController.text,
        password: _textPassworedEditingController.text,
        context: context);
    if (register) {
      SharedPref().saveDataSignUp(user: user);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Check your email and verify ')));
      Future.delayed(const Duration(seconds: 5) , (){
        Navigator.pop(context);
      });
    }
  }

  User get user{
    User user = User();
    user.email=_textEmailEditingController.text;
    user.passwored=_textPassworedEditingController.text;
    user.name = _textNameEditingController.text;
    return user;
  }
}
