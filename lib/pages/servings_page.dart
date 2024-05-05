import 'package:recipe_rescue/model/notification_model.dart';
import 'package:flutter/material.dart';

class ServingsScreen extends StatefulWidget {
  const ServingsScreen({super.key});

  @override
  State<ServingsScreen> createState() => _ServingsScreen();
}

class _ServingsScreen extends State<ServingsScreen> {
  String dropDownValue = 'Number of Servings';
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Elevate Your Cooking \nExperience',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: size.width,
                  height: size.height * 0.061,
                  alignment: Alignment.center,
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
                          color: Color.fromARGB(255, 124, 124, 124)),
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
              ],
          )

          ),
        ),
      ],
        // children: [
        //   SizedBox(
        //     width: double.infinity,
        //     height: double.infinity,
        //     child: Image.asset(
        //       'assets/images/servings.png',
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(left: 15),
        //     child: Text(
        //       'Elevate Your Cooking \nExperience',
        //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //             fontSize: 25,
        //             fontWeight: FontWeight.w300,
        //           ),
        //     ),
        //   ),
        //   Container(
        //     margin: const EdgeInsets.only(top: 7),
        //     width: size.width * 0.784,
        //     height: size.height * 0.061,
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       color: const Color.fromARGB(255, 246, 246, 246),
        //     ),
        //     child: DropdownButton<String>(
        //       value: dropDownValue,
        //       icon: const Icon(Icons.keyboard_arrow_down),
        //       style: const TextStyle(
        //           color: Color.fromARGB(255, 124, 124, 124)),
        //       underline: Container(height: 0),
        //       onChanged: (String? newValue) {
        //         setState(() {
        //           dropDownValue = newValue!;
        //         });
        //       },
        //       items: const [
        //         DropdownMenuItem(
        //           value: 'Number of Servings',
        //           child: Text('Number of Servings'),
        //         ),
        //         DropdownMenuItem(
        //           value: 'Mobile',
        //           child: Text('Mobile'),
        //         ),
        //         DropdownMenuItem(
        //           value: 'Laptop',
        //           child: Text('Laptop'),
        //         ),
        //         DropdownMenuItem(
        //           value: 'TV',
        //           child: Text('TV'),
        //         ),
        //         DropdownMenuItem(
        //           value: 'Embedded items',
        //           child: Text('Embedded items'),
        //         ),
        //       ],
        //     ),
        //   ),
        // ]
      ),
    );
  }
}
