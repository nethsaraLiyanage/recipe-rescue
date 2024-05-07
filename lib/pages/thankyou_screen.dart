import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/pages/home_screen.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onNext() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
          (route) => false);
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/thankyou.png',
            alignment: Alignment.center,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 380),
                Text(
                  'Thank you\nfor the completing\nthe Survey !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.crimsonText.toString(),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                CustomElevatedButton(
                  onButtonPressed: onNext,
                  height: 59,
                  width: 275,
                  childWidget: Text(
                    'Next',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
