import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/widgets/feedback-popingup.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  final String selectedRadio = '';

  setSelectedRadio(String val) {
    setState(() {
      // selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    void openFavouriteOverlay() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const FeedbackPopup(

        ),
      );
    }

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: 90,
          ),
          Image.asset(
            'assets/images/feedback.png',
            alignment: Alignment.center,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 90),
                Text(
                  'Share Your Feedback!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color.fromARGB(255, 227, 188, 59),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please select a emoji below and let us\nknow about your concern',
                      style: TextStyle(
                        fontFamily: GoogleFonts.crimsonText.toString(),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rate your satisfaction with the last recipe',
                      style: TextStyle(
                        fontFamily: GoogleFonts.crimsonText.toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top:10, bottom: 15),
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: null,
                            child: Image.asset('assets/images/face01.png'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: null,
                            child: Image.asset('assets/images/face02.png'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: null,
                            child: Image.asset('assets/images/face03.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Is there any leftovers from the previous \nrecipe ?',
                      style: TextStyle(
                        fontFamily: GoogleFonts.crimsonText.toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        setSelectedRadio("option 01");
                      },
                    ),
                    const Text(
                      'Yes',
                      style: TextStyle(fontSize: 16),
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        setSelectedRadio("option 01");
                      },
                    ),
                    const Text(
                      'No',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  onButtonPressed: openFavouriteOverlay,
                  height: 50,
                  width: 200,
                  childWidget: Text(
                    'Send Feedback',
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
  
  void setState(Null Function() param0) {}
}
