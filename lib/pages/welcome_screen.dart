import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/pages/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onGetStarted() {
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
            'assets/images/double_circle.png',
            alignment: Alignment.center,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 110),
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color.fromARGB(255, 227, 188, 59),
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your personal chef, on-demand',
                  style: TextStyle(
                    fontFamily: GoogleFonts.crimsonText.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 90),
                CustomElevatedButton(
                  onButtonPressed: onGetStarted,
                  height: 59,
                  width: 275,
                  childWidget: Text(
                    'Get Started',
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
