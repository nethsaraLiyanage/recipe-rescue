import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:recipe_rescue/pages/Main_screen.dart';

import 'Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 238, 180, 21)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 204, 104, 3),
                      radius: 100.0,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const SizedBox(height: 15.0),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 204, 104, 3)),
                    ),
                    const SizedBox(height: 200.0),
                    // const Text(
                    //   "Pizza Hut",
                    //   style: TextStyle(
                    //       color: Colors.redAccent,
                    //       fontFamily: 'Radicalis',
                    //       // fontWeight: FontWeight.bold,
                    //       fontSize: 30.0),
                    // ),
                    // const Text(
                    //   "SRI LANKA",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       // fontWeight: FontWeight.bold,
                    //       fontSize: 15.0),
                    // )

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
