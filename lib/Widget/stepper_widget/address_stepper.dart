
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/user/stepper_screen.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      children: [
        const SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
              label: const Text('Name'),
              labelStyle: GoogleFonts.nunito(
                fontSize: 11,
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
              label: const Text('Address'),
              labelStyle: GoogleFonts.nunito(
                fontSize: 11,
              )),
        ),
        const SizedBox(
          height: 8,
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
                      label: const Text('City'),
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
                      label: const Text('ZIP code'),
                      labelStyle: GoogleFonts.nunito(
                        fontSize: 11,
                      )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
              label: const Text('State'),
              labelStyle: GoogleFonts.nunito(
                fontSize: 11,
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
              label: const Text('Phone Number'),
              labelStyle: GoogleFonts.nunito(
                fontSize: 11,
              )),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Set shipping address default',
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
        ElevatedButton(
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => StepperScreen(activeStep: 1),));
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
