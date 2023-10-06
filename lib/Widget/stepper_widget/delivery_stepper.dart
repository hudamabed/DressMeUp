import 'package:dressmeup/Widget/card_delivery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/user/stepper_screen.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24, left: 40, right: 40),
      children: [
        CardDelivery(
          title1: 'Free - \$0.00',
          title2: '3-5 day delivery',
        ),
        const SizedBox(
          height: 16,
        ),
        CardDelivery(
          title1: 'Standard - \$2.50',
          title2: '2-3 day delivery',
        ),
        const SizedBox(
          height: 16,
        ),
        CardDelivery(
          title1: 'Express - \$5.99',
          title2: 'Next day delivery',
        ),
        const SizedBox(
          height: 23,
        ),
        Text(
          ' Free shipping over \$49 + free returns and exchange',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: const Color(0XFF919EAB),
          ),
        ),
        const SizedBox(
          height: 23,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StepperScreen(activeStep: 2),));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF5C6AC4),
                fixedSize: const Size(295, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text('Next'))
      ],
    );
  }
}
