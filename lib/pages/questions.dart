import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:recipe_rescue/pages/home_screen.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
  void onGetStarted() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
          (route) => false);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quick Questions',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.2,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Is there any household food wastage generated currently ?',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: size.height * 0.231,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:const EdgeInsets.all(20.0),
                    child: Text(
                      'Select the household wastage that generates:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                        ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: size.height * 0.231,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:const EdgeInsets.all(20.0),
                    child: Text(
                      'Select the type of food wastes raw ingredients :',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                        ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomElevatedButton(
                  onButtonPressed: onGetStarted,
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
    );
  }
}
