import 'package:flutter/material.dart';
import 'package:recipe_rescue/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/auth/Auth.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const storage = FlutterSecureStorage();

  Future save() async {
    var res = await http.post(Uri.parse("${Connection.baseUrl}/user/register"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'email': user.email,
          'full_name': user.full_name,
          'mobile_number': user.mobile_number,
          'delivery_address': user.delivery_address,
          'password': user.password
        }));
    var result = jsonDecode(res.body);
    print(result['status']);
    if (result['status'] == 201) {
      await storage.write(key: "email", value: user.email);
      showTopSnackBar(
        context as OverlayState,
        const CustomSnackBar.success(
          message: "Successfilly Registered!",
        ),
      );
      Navigator.pushNamed(context, '/verify');
      Auth.sendOTp();
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context as OverlayState,
        const CustomSnackBar.error(
          message: "User Already exist!",
        ),
      );
    } else {
      showTopSnackBar(
        context as OverlayState,
        const CustomSnackBar.error(
          message: "Something went rong!",
        ),
      );
    }
  }

  User user = User('', '', '', '', '', []);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/wave2.png'),
              //         fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 55,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(25),
                                  child: TextFormField(
                                    controller: TextEditingController(
                                        text: user.full_name),
                                    onChanged: (value) {
                                      user.full_name = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Name is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Color.fromARGB(255, 46, 46, 46),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15),
                                      hintText: 'Full name',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(25),
                                  child: TextFormField(
                                    controller: TextEditingController(
                                        text: user.email),
                                    onChanged: (value) {
                                      user.email = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty && value == null) {
                                        return 'Email is Required';
                                      } else if (RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                        return null;
                                      } else {
                                        return 'Enter a valid email';
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Color.fromARGB(255, 46, 46, 46),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15),
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(25),
                                  child: TextFormField(
                                    controller: TextEditingController(
                                        text: user.mobile_number),
                                    onChanged: (value) {
                                      user.mobile_number = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Mobile Number is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: Color.fromARGB(255, 46, 46, 46),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15),
                                      hintText: 'Mobile number',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(25),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: TextEditingController(
                                        text: user.password),
                                    onChanged: (value) {
                                      user.password = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Password is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Color.fromARGB(255, 46, 46, 46),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15),
                                      hintText: 'Password',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(25),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: TextEditingController(
                                        text: user.password),
                                    onChanged: (value) {
                                      user.password = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Password is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Color.fromARGB(255, 46, 46, 46),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15),
                                      hintText: 'Confirm Password',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(20.0),
                      disabledForegroundColor: Colors.black.withOpacity(0.38),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    ),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   save();
                      // }
                      Navigator.pushNamed(context, '/questions');
                    },
                    child:
                        const Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: const CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Already Have an Account ? Sign In"),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );

  }
}
