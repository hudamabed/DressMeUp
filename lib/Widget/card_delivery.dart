import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDelivery extends StatefulWidget {
   CardDelivery({required this.title1, required this.title2, Key? key})
      : super(key: key);

  String title1 ;
  String title2 ;
  @override
  State<CardDelivery> createState() => _CardDeliveryState();
}

class _CardDeliveryState extends State<CardDelivery> {
  bool check = false;


  @override
  Widget build(BuildContext context) {
    return check
        ? Material(
            elevation: 3,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 96,
              width: 295,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title1,
                          style: GoogleFonts.nunito(
                              fontSize: 17, color: const Color(0XFF5C6AC4)),
                        ),
                        Text(
                          widget.title2,
                          style: GoogleFonts.nunito(
                              fontSize: 17, color: const Color(0XFFB3BCF5)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: IconButton(
                        onPressed: () {
                          if (check) {
                            setState(() {
                              check = false;
                            });
                          } else {
                            setState(() {
                              check = true;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.check,
                          color: check ? Colors.green : Colors.grey,
                          size: 32,
                        )),
                  )
                ],
              ),
            ),
          )
        : Container(
            height: 96,
            width: 295,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0XFFB3BCF5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title1,
                        style: GoogleFonts.nunito(
                            fontSize: 17, color: const Color(0XFF5C6AC4)),
                      ),
                      Text(
                        widget.title2,
                        style: GoogleFonts.nunito(
                            fontSize: 17, color: const Color(0XFFB3BCF5)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: IconButton(
                      onPressed: () {
                        if (check) {
                          setState(() {
                            check = false;
                          });
                        } else {
                          setState(() {
                            check = true;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.check,
                        color: check ? Colors.green : Colors.grey,
                        size: 32,
                      )),
                )
              ],
            ),
          );
  }
}
