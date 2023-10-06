import 'dart:developer';

import 'package:dressmeup/Widget/stepper_widget/Payment_stepper.dart';
import 'package:dressmeup/Widget/stepper_widget/address_stepper.dart';
import 'package:dressmeup/Widget/stepper_widget/delivery_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';


// ignore: must_be_immutable
class StepperScreen extends StatefulWidget {
   StepperScreen({required this.activeStep , Key? key}) : super(key: key);
  int activeStep ;
  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {

  int dotCount = 3;
  List<String> title = ['Address', 'Delivery', 'Payment'];
  List<Widget> widg = [
    const AddressWidget(),
    const DeliveryWidget(),
    const PaymentWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF9FAFB),
      appBar: AppBar(
        title: Text(
          title[widget.activeStep],
          style: GoogleFonts.nunito(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF212B36)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('images/Icon_back.png')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: DotStepper(
                    dotCount: dotCount,
                    dotRadius: 12,
                    activeStep: widget.activeStep,
                    shape: Shape.circle,
                    spacing: 110,
                    indicator: Indicator.shift,
                    onDotTapped: (tappedDotIndex) {
                      setState(() {
                        widget.activeStep = tappedDotIndex;
                      });
                    },
                    // DOT-STEPPER DECORATIONS
                    fixedDotDecoration: const FixedDotDecoration(
                      color: Colors.grey,
                    ),

                    indicatorDecoration: const IndicatorDecoration(
                      color: Color(0XFF5C6AC4),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.fromLTRB(20,10,20,10), child: steps()),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: widg[widget.activeStep],
              ),
            )
          ],
        ),
      ),
    );
  }
  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotCount, (index) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: Text(
            title[index],
            style: GoogleFonts.nunito(color: const Color(0XFFB3BCF5)),
          ),
          onPressed: () {
            setState(() {
              widget.activeStep = index;
            });
          },
        );
      }),
    );
  }


  
  
}
