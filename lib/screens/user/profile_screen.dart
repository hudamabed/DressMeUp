import 'dart:io';
import 'package:dressmeup/Widget/row_widget_profile.dart';
import 'package:dressmeup/firebase/firebase_controller.dart';
import 'package:dressmeup/screens/user/stepper_screen.dart';
import 'package:dressmeup/shared/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  uploadImage(ImageSource source) async {
    try {
      var pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      File? img = File(pickedImage.path);
      setState(() {
        image = img;
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFF9FAFB),
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.nunito(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: const Color(0XFF212B36)),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(
                top: 33,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(40)),
                        child: image == null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: const AssetImage(
                                  'images/img_profile.png',
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: 80,
                                backgroundColor: Colors.grey,
                              ),
                      ),
                      Positioned(
                        top: 40,
                        left: 40,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: const Color(0XFFF9FAFB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Profile photo',
                                      style: GoogleFonts.nunito(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Visibility(
                                      visible: image != null,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              image = null;
                                              Navigator.pop(context);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.grey[600],
                                          )),
                                    )
                                  ],
                                ),
                                content: SizedBox(
                                  height: 70,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0XFFE2E4EFFF),
                                        child: IconButton(
                                            onPressed: () {
                                              uploadImage(ImageSource.camera);
                                            },
                                            icon: const Icon(
                                              Icons.camera_alt,
                                              color: Color(0xFF5C6AC4),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0XFFE2E4EFFF),
                                        child: IconButton(
                                            onPressed: () {
                                              uploadImage(ImageSource.gallery);
                                            },
                                            icon: const Icon(
                                              Icons.photo,
                                              color: Color(0xFF5C6AC4),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFF5C6AC4),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    'Baraa Daher',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row_Widget(
                        title: 'Notifications',
                        image: 'images/Icon1_profile.png',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row_Widget(
                        title: 'My orders',
                        image: 'images/Icon3_profile.png',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row_Widget(
                        title: 'Addresses',
                        image: 'images/Icon4_profile.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StepperScreen(activeStep: 0),
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row_Widget(
                        title: 'Payment',
                        image: 'images/Icon5_profile.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StepperScreen(activeStep: 2),
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row_Widget(
                        title: 'Wishlist',
                        image: 'images/Icon6_profile.png',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row_Widget(
                        title: 'Settings',
                        image: 'images/Icon7_profile.png',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0XFFF4F5FA)),
                            child: const Icon(
                              Icons.logout_sharp,
                              color: Color(
                                0XFF5C6AC4,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Logout',
                            style: GoogleFonts.nunito(
                              fontSize: 17,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () async{
                                await FirebaseAuthController().signOut();
                                SharedPref().clear();
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(context, '/sign_in_screen');
                              },
                              child: Image.asset('images/Icon2_profile.png'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
