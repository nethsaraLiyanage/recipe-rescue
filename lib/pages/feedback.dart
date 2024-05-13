import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_rescue/pages/home_screen.dart';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/widgets/feedback-popingup.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});
  _FeedbackState createState() => _FeedbackState();

}

class _FeedbackState extends State<FeedbackScreen> {
  String selectedMood = '';
  bool selectedRadio = false;

  @override
  Widget build(BuildContext context) {
    final storage = new FlutterSecureStorage();

    void openFavouriteOverlay() async {
      var userId = await storage.read(key: "userId");
      var recipeId = await storage.read(key: "recipeId");
      var res = await http.post(Uri.parse("${Connection.baseUrl}/api/feedback/saveFeedBack"),
          headers: <String, String>{
            'Content-Type': 'application/json;charSet=UTF-8'
          },
          body: jsonEncode({
            "statisfaction": selectedMood,
            "isThereAreAnyLeftOvers": selectedRadio,
            "createdUserId": userId,
            "recipeId": recipeId
          }));
      var result = jsonDecode(res.body);
      print(result);
      if (result['isSuccess'] = true) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: "Successfilly saved your feedback!",
          ),
        );
        showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (ctx) => const FeedbackPopup(),
          );
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Something went Wrong!",
          ),
        );
      }
    }

    setMood(String mood) {
      setState(() {
        selectedMood = mood;
      });
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
                            onTap: () => {setMood('Happy')},
                            child: Image.asset('assets/images/face01.png'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () => {setMood('Normal')},
                            child: Image.asset('assets/images/face02.png'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () => {setMood('Not Happy')},
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
                      value: true,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                    const Text(
                      'Yes',
                      style: TextStyle(fontSize: 16),
                    ),
                    Radio(
                      value: false,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
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
  
}
