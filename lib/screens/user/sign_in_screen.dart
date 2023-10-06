import 'package:dressmeup/model/user.dart';
import 'package:dressmeup/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dressmeup/firebase/firebase_controller.dart';

import '../../network/dio_method_view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool _passwordVisible;

  late TextEditingController _textEmailEditingController;
  late TextEditingController _textPassworedEditingController;
  String? value = 'User';

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _textEmailEditingController = TextEditingController();
    _textPassworedEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textPassworedEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('images/Ima5.png',
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Welcome!',
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
                            height: 20,
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
                                          _passwordVisible = !_passwordVisible;
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
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (() =>
                                    Navigator.pushNamed(context, "/verify")),
                                child: Text(
                                  "Forget Your password?",
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: const Color(0xFF5C6AC4)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RadioListTile(
                                    value: 'User',
                                    groupValue: value,
                                    onChanged: (val) {
                                      setState(() {
                                        value = val;
                                      });
                                    }),
                              ),
                              const Text('User'),
                              const Spacer(),
                              Expanded(
                                child: RadioListTile(
                                    value: 'Admin',
                                    groupValue: value,
                                    onChanged: (String? val) {
                                      setState(() {
                                        value = val;
                                      });
                                    }),
                              ),
                              const Text('Admin')
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/control_screen');
                            },
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "or sign in with",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: const Color(0xFF454F5B)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: (() {}),
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
                                    "Facebook",
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
                                  onPressed: (() {}),
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
                                    "Google",
                                    style: GoogleFonts.roboto(
                                        color: const Color(0xFF5C6AC4),
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
            top: 300,
            right: 20,
            child: Image.asset(
              'images/Logo.png',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    if (checkData()) {
      await save();
    }
  }

  Future<void> save() async {
    if (value == 'Admin') {
      if (_textEmailEditingController.text == 'admindressme@gmail.com' &&
          _textPassworedEditingController.text == '12345678') {
        SharedPref().saveDataAdmin(user: user);
        SignInScreen.dioMethods.getData();
        Navigator.pushReplacementNamed(context, '/chooseAdmin_admin');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Write Email and Password for admin ')));
      }
    } else if (value == 'User') {
      bool login = await FirebaseAuthController().login(
          email: _textEmailEditingController.text,
          password: _textPassworedEditingController.text,
          context: context);

      if (login) {
        SharedPref().saveDataLogIn(user: user);
        SignInScreen.dioMethods.getData();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/control_screen');
      }
    }
  }

  bool checkData() {
    if (_textEmailEditingController.text.isNotEmpty &&
        _textPassworedEditingController.text.isNotEmpty) {
      return true;
    }
    if (_textEmailEditingController.text.isEmpty &&
        _textPassworedEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Write Email and Password ')));
    } else if (_textPassworedEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Write Password')));
    } else if (_textEmailEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Write Email')));
    }

    return false;
  }

  User get user {
    User user = User();
    user.email = _textEmailEditingController.text;
    user.passwored = _textPassworedEditingController.text;
    return user;
  }
}
