// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBrandListTail extends StatelessWidget {
  const CustomBrandListTail(
      {Key? key,
      required this.name,
      required this.image,
      required this.trailing})
      : super(key: key);

  final String name;
  final String image;
  final Function()? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12),
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Color(0xFFF4F5FA),
        ),
        child: Image.asset(
          image,
          color: const Color(0xFF5C6AC4),
        ),
      ),
      title: Text(
        name,
        textAlign: TextAlign.left,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: const Color(0xFF212B36),
        ),
      ),
      trailing: InkWell(
        onTap: trailing,
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF5C6AC4),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: const Color(0xFFFFFFFF),
          ),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF5C6AC4),
            size: 20,
          ),
        ),
      ),
    );
  }
}
