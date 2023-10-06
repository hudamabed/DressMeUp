import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OutBoarding extends StatelessWidget {
  const OutBoarding({
    Key? key,  this.image1 = "Icon",  this.titile = "",  this.subTitle = "",  this.image2 = "",  this.titile1 = "",  this.subTitle1 = "",
  }) : super(key: key);
  final String image1;
  final String image2;
  final String titile;
  final String subTitle;
  final String titile1;
  final String subTitle1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/$image1.png',
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              Text(titile1,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: const Color(0xFF23203F)),),
              const SizedBox(height: 20.8,),
              Text(subTitle1,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: const Color(0xFF454F5B)),),
              const SizedBox(height: 20.8,),
            ],
          ),
        ),
        Image.asset('images/$image2.png',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              Text(titile,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: const Color(0xFF23203F)),),
              const SizedBox(height: 10,),
              Text(subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: const Color(0xFF454F5B)),),
            ],
          ),
        ),

      ],
    );
  }
}