import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Row_Widget extends StatelessWidget {
   Row_Widget({
    required this.title,
    required this.image,
     required this.onTap,
    super.key,
  });
  String image;
  String title;
  Function () onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 16,),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 17,
          ),
        ),
        const Spacer(),
        GestureDetector(
            onTap: onTap,
            child: Image.asset('images/Icon2_profile.png'))
      ],
    );
  }
}
