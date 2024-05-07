import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_rescue/pages/servings_page.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button_red.dart';

class TryAgainScreen extends StatelessWidget {
  const TryAgainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onTryAgain() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const ServingsScreen(),
          ),
          (route) => false);
    }

    return Scaffold(
      body: Stack(
        children: [
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 60),
                Image.asset(
                  'assets/images/oops.png',
                  alignment: Alignment.center,
                  width: 80,
                ),
                Text(
                  'OOOPS!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color.fromARGB(255, 234, 33, 33),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Ingredients are not enough.',
                  style: TextStyle(
                    fontFamily: GoogleFonts.crimsonText.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 90),
                CustomElevatedButtonRED(
                  onButtonPressed: onTryAgain,
                  height: 40,
                  width: 150,
                  childWidget: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 234, 33, 33),
                    shape: const CircleBorder(
                      side: BorderSide(color: Colors.transparent)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text("Got to Home"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
