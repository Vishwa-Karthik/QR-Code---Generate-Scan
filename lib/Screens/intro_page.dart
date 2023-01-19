import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code/Widgets/button.dart';

import 'qr_scanner.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //todo logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Image.asset(
                'assets/qr_code_logo.png',
                height: 300,
              ),
            ),

            const SizedBox(
              height: 55,
            ),

            //todo Game title
            Text(
              "QR Code",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            Text(
              "Scan and Generate",
              style: GoogleFonts.poppins(
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 1),

            //todo generate button
            MyButton(
              text: "Generate QR",
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            //todo scan button
            MyButton(
              text: "Scan QR",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
              ),
            ),

            const Spacer(flex: 2),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Divider(
                color: Colors.black,
                thickness: 2,
              ),
            ),

            //todo developer details
            Text(
              "Developed by Vishwa Karthik",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
