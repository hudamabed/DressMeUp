import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    Key? key,
    required this.currentPage,
    this.marginStart = 0,
    this.marginEnd = 0,
  }) : super(key: key);

  final double marginStart;
  final double marginEnd;
  final bool currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsetsDirectional.only(start: marginStart, end: marginEnd),
      decoration: BoxDecoration(
        color: currentPage ?  Colors.grey.shade600 : const Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
