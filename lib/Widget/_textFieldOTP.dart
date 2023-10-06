// ignore_for_file: sized_box_for_whitespace, camel_case_types, file_names
import 'package:flutter/material.dart';

class textFieldOTP extends StatelessWidget {
  const textFieldOTP({
    super.key,
    required this.context,
    required this.context1,
    required this.first,
    required this.last,
  });

  final BuildContext context;
  final BuildContext context1;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xFF5C6AC4)),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
