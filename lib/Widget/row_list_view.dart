import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RowListViewShow extends StatelessWidget {
   RowListViewShow({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
     required this.text5,
    super.key,
  });
  String text1;
  String text2;
  String text3;
  String text4;
  String text5;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(text1),
        const SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              text2,
              style:  GoogleFonts.nunito(
                color: const Color(0XFF212B36),
                fontSize: 17,
              ),
            ),
            Text(text3,
              style:  GoogleFonts.nunito(
                color: const Color(0XFF637381),
                fontSize: 16,
              ),),
            Text(text4, style:  GoogleFonts.nunito(
              color: const Color(0XFF5C6AC4),
              fontSize: 16,
            ),),
          ],
        ),
        const Spacer(),
         Align(
            alignment: Alignment.topRight,
            child: Text(text5))
      ],
    );
  }
}
