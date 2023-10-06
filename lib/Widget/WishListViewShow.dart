import 'package:flutter/material.dart';

class WishListViewShow extends StatelessWidget {
  WishListViewShow({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    super.key,
  });
  String text1;
  String text2;
  String text3;
  String text4;
  String text5;
  String text6;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(text1),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text2,
              style: const TextStyle(
                color: Color(0XFF212B36),
                fontSize: 17,
              ),
            ),
            Text(
              text3,
              style: const TextStyle(
                color: Color(0XFF637381),
                fontSize: 16,
              ),
            ),
            Text(
              text4,
              style: const TextStyle(
                color: Color(0XFF5C6AC4),
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  "size",
                  style: const TextStyle(
                    color: Color(0XFF454F5B),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Text(
                  text5,
                  style: const TextStyle(
                    color: Color(0XFF919EAB),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "color",
                  style: const TextStyle(
                    color: Color(0XFF454F5B),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Text(
                  text6,
                  style: const TextStyle(
                    color: Color(0XFF919EAB),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Image.asset('images/icOption.png')
      ],
    );
  }
}