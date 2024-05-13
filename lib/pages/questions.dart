import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/pages/thankyou_screen.dart';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  QuestionScreen({super.key});
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  bool q01group = false;
  String q02group = "";
  String q03group = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final storage = new FlutterSecureStorage();

    Future saveQuestions() async {
      var userId = await storage.read(key: "userId");
      var res = await http.post(Uri.parse("${Connection.baseUrl}/api/user/saveUserQuestion"),
          headers: <String, String>{
            'Content-Type': 'application/json;charSet=UTF-8'
          },
          body: jsonEncode({
            "id": userId,
            "questionOneAnswer": q01group,
            "questionTwoAnswer": q02group,
            "questionThreeAnswer": q03group
          }));
      var result = jsonDecode(res.body);
      print(result);
      if (result['isSuccess'] = true) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: "Successfilly saved your responces!",
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const ThankYouScreen(),
          ),
          (route) => false);
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Something went Wrong!",
          ),
        );
      }
    }

    void onNext() {
      saveQuestions();
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                      child: Column(
                        children: [
                          Text(
                            'Is there any household food wastage generated currently ?',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: true,
                                groupValue: q01group,
                                onChanged: (value) {
                                  setState(() {
                                    q01group = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Yes',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                value: false,
                                groupValue: q01group,
                                onChanged: (value) {
                                  setState(() {
                                    q01group = value!;
                                  });
                                },
                              ),
                              const Text(
                                'No',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * 0.24,
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
                      child: Column(
                        children: [
                          Text(
                            'Select the household wastage that generates:',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: "20%",
                                groupValue: q02group,
                                onChanged: (value) {
                                  setState(() {
                                    q02group = value!;
                                  });
                                },
                              ),
                              const Text(
                                '20%',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                value: "40%",
                                groupValue: q02group,
                                onChanged: (value) {
                                  setState(() {
                                    q02group = value!;
                                  });
                                },
                              ),
                              const Text(
                                '40%',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: "80%",
                                groupValue: q02group,
                                onChanged: (value) {
                                  setState(() {
                                    q02group = value!;
                                  });
                                },
                              ),
                              const Text(
                                '80%',
                                style: TextStyle(fontSize: 16),
                              ),
                              Radio(
                                value: "95%",
                                groupValue: q02group,
                                onChanged: (value) {
                                  setState(() {
                                    q02group = value!;
                                  });
                                },
                              ),
                              const Text(
                                '95%',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * 0.24,
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
                      child: Column(
                        children: [
                          Text(
                            'Select the type of food wastes raw ingredients :',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: "Row Ingredients",
                                groupValue: q03group,
                                onChanged: (value) {
                                  setState(() {
                                    q03group = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Row Ingredients',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: "Cooked Meals",
                                groupValue: q03group,
                                onChanged: (value) {
                                  setState(() {
                                    q03group = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Cooked Meals',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
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
        )
      ),
    );
  }
}
