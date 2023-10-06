
import 'package:dressmeup/screens/admin/show_product_list.dart';
import 'package:dressmeup/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'admin.dart';

class ChooseAdmin extends StatelessWidget {
  const ChooseAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Admin Panel',
          style: GoogleFonts.nunito(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ShowProductListScreen());
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF5C6AC4),
                  minimumSize: const Size(double.infinity, 50)),
              child: Text(
                "Show Product List",
                style: GoogleFonts.roboto(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AdminScreen());
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF5C6AC4),
                  minimumSize: const Size(double.infinity, 50)),
              child: Text(
                "Add Product",
                style: GoogleFonts.roboto(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                SharedPref().clear();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, '/sign_in_screen');
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF5C6AC4),
                  minimumSize: const Size(double.infinity, 50)),
              child: Text(
                "Logout",
                style: GoogleFonts.roboto(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
