// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_text.dart';

// ignore: must_be_immutable
class CustomAddCart extends StatelessWidget {
  const CustomAddCart(
      {required this.text,
      required this.image,
      required this.width,
      required this.height,
      required this.fontWeight,
      required this.function,
      required this.color,
      required this.backgroundcolor,
      required this.textAlign,
      required this.fontsize,
      Key? key})
      : super(key: key);
  final String text;
  final Color color;
  final Color backgroundcolor;
  final double fontsize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double width;
  final double height;
  final String image;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF5C6AC4)),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        color: const Color(0xFF5C6AC4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: ElevatedButton(
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                color: color,
                fit: BoxFit.cover,
                width: 28,
                height: 28,
              ),
              const SizedBox(
                width: 11,
              ),
              CustomText(
                height: 1,
                color: color,
                fontWeight: fontWeight,
                text: text,
                textOverflow: TextOverflow.clip,
                fontsize: fontsize,
                textAlign: textAlign,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
