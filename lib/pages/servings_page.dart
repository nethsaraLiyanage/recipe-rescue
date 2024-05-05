import 'package:recipe_rescue/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:recipe_rescue/pages/home_screen.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';

class ServingsScreen extends StatefulWidget {
  const ServingsScreen({super.key});

  @override
  State<ServingsScreen> createState() => _ServingsScreen();
}

class _ServingsScreen extends State<ServingsScreen> {
  String dropDownValue = 'Number of Servings';
  @override
  Widget build(BuildContext context) {
    void onStart() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
          (route) => false);
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
      body: Stack(
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: size.height * 0.14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "e.title",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.78,
                                child: Text(
                                  "e.content",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
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
    );
  }
}
