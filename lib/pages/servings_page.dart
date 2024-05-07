import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/pages/recipe_screen.dart';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/widgets/waiting-popup.dart';
import 'package:http/http.dart' as http;

class ServingsScreen extends StatefulWidget {
  const ServingsScreen({super.key});

  @override
  State<ServingsScreen> createState() => _ServingsScreen();
}

class _ServingsScreen extends State<ServingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropDownValue = 'Number of Servings';
  String ingredient1 = '';
  String ingredient2 = '';
  String ingredient3 = '';
  String ingredient4 = '';

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    void openWaitPopupOverlay() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const WaitPopup(),
      );
    }
    Future<void> onStart() async {
      if (_formKey.currentState!.validate()) {
        List<String> ingredients = [ingredient1, ingredient2, ingredient3, ingredient4];
        await storage.write(key: 'ingredients', value: jsonEncode(ingredients));
        openWaitPopupOverlay();
      }
      
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '',
          ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/servings.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Column(
                  children: [
                    Text(
                        'Elevate Your Cooking \nExperience',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(12),
                      width: size.width,
                      height: size.height * 0.061,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 246, 246, 246),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: DropdownButton<String>(
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 52, 52, 52)),
                          underline: Container(height: 0),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'Number of Servings',
                              child: Text('Number of Servings'),
                            ),
                            DropdownMenuItem(
                              value: '01',
                              child: Text('01'),
                            ),
                            DropdownMenuItem(
                              value: '02',
                              child: Text('02'),
                            ),
                            DropdownMenuItem(
                              value: '03',
                              child: Text('03'),
                            ),
                            DropdownMenuItem(
                              value: '04',
                              child: Text('04'),
                            ),
                          ],
                        ),
                      )
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        padding: const EdgeInsets.all(15),
                        width: size.width * 0.9,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Image.asset('assets/images/plus-icon.png'),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: "Add Ingredient"
                                      ),
                                      onChanged: (value) {
                                        ingredient1 = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Need atleast one ingredient!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  )                          
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Image.asset('assets/images/plus-icon.png'),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: "Add Ingredient"
                                      ),
                                      onChanged: (value) {
                                        ingredient2 = value;
                                      },
                                      
                                    ),
                                  )                          
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Image.asset('assets/images/plus-icon.png'),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: "Add Ingredient"
                                      ),
                                      onChanged: (value) {
                                        ingredient3 = value;
                                      },
                                      
                                    ),
                                  )                         
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Image.asset('assets/images/plus-icon.png'),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: "Add Ingredient"
                                      ),
                                      onChanged: (value) {
                                        ingredient4 = value;
                                      },
                                      
                                    ),
                                  )                         
                                ],
                              ),
                            ],
                          ),
                          )
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      onButtonPressed: onStart,
                      height: 45,
                      width: 180,
                      childWidget: Text(
                        'Start',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  ],
              )

              ),
            ),
          ],
        ),
      )
    );
  }
}
