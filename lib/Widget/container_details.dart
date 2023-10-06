import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerDetails extends StatelessWidget {
  const ContainerDetails(
      {super.key,
      required this.image,
      required this.name,
      required this.itemCount,
      required this.color,
      required this.onPressed});

  final String image;
  final String name;
  final Color color;
  final int itemCount;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: 35, top: 35, right: MediaQuery.of(context).size.width * 0.55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: const Color(0xFF084E8A).withOpacity(0.6)),
            ),
            Text(
              '${itemCount}K products',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xFF454F5B),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(110, 35)),
              child: Text(
                "View all",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
