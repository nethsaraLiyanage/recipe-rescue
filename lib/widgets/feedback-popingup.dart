import 'package:flutter/material.dart';

import 'package:recipe_rescue/pages/home_screen.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';

class FeedbackPopup extends StatefulWidget {
  const FeedbackPopup({
    super.key,
    
  });


  @override
  State<FeedbackPopup> createState() => _NewIngredientsState();
}

class _NewIngredientsState extends State<FeedbackPopup> {
  @override
  Widget build(BuildContext context) {

    void onHome() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
          (route) => false);
    }

    return LayoutBuilder(builder: (cyx, constraints) {
      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: null,
                  child: Image.asset('assets/images/feedback-thank.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Thank you for\nyour feedback!',
                  style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  onButtonPressed: onHome,
                  height: 50,
                  width: 200,
                  childWidget: Text(
                    'Back to Home',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 40),

                
              ],
            ),
          ),
        ),
      );
    });
  }
}
