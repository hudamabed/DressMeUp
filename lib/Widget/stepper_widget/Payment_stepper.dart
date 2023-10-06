import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

import '../../screens/user/control_screen.dart';
import '../shopping_view-model.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  static final ShoppingViewModel shoppingViewModel =
      Get.find<ShoppingViewModel>();

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
      children: [
        SizedBox(
          height: 104,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 104 ,
                width: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFFB3BCF5)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'images/Logo_card.png',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset('images/Apple_Pay_Payment.png'),
              const SizedBox(
                width: 15,
              ),
              Image.asset('images/Visa_payment.png'),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TextField(
          obscureText: true,
          obscuringCharacter: '*',
          decoration: InputDecoration(
              label: const Text('Card Number'),
              labelStyle: GoogleFonts.nunito(
                fontSize: 11,
              )),
        ),
        TextField(
          decoration: InputDecoration(
              label: const Text('Cardholder name'),
              labelStyle: GoogleFonts.nunito(
                fontSize: 11,
              )),
        ),
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                child: TextField(
                  decoration: InputDecoration(
                      label: const Text('Expiry date'),
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 11,
                      )),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 140,
                child: TextField(
                  decoration: InputDecoration(
                      label: const Text('CVV'),
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 11,
                      )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 38,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Save credit card information',
              style: GoogleFonts.nunito(
                  fontSize: 14, color: const Color(0XFF919EAB)),
            ),
            Switch(
              value: light,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        GetBuilder<ShoppingViewModel>(
          init: ShoppingViewModel(),
          builder: (controller) {
            return ElevatedButton(
                onPressed: () async {
                  controller.getTotalPrice() != 0 ? pay() : Get.to(() => const ControlScreen()) ; 
                  controller.cart.clear();
                  controller.totalPrice = 0;
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF5C6AC4),
                    fixedSize: const Size(295, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text('Pay now'));
          }
        )
      ],
    );
  }

  void pay() async {
    var response = await MyFatoorah.startPayment(
      context: context,
      request: MyfatoorahRequest.test(
        currencyIso: Country.SaudiArabia,
        // successUrl: 'https://openjournalsystems.com/file/2017/07/payment-success.png',
        successUrl:
            'https://dreyad-academy.brilliantartjo.com/wp-content/uploads/2022/05/Paymentsuccessful21.png',
        errorUrl: 'https://www.google.com/',
        invoiceAmount: 100,
        language: ApiLanguage.English,
        token:
            'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
      ),
    );
    log(response.paymentId.toString());
    log(response.status.toString());
    Get.to(() => const ControlScreen());
  }
  
}
