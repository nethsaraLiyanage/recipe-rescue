// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:recipe_rescue/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/auth/Auth.dart';
import 'package:recipe_rescue/pages/home_screen.dart';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  int currentIndex = 1;

  Future login() async {
    print("Called login() "+user.password.toString());
    var res = await http.post(Uri.parse("${Connection.baseUrl}/api/auth"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(
            <String, String>{'email': user.email, 'password': user.password}));
    var result = await jsonDecode(res.body);
    print(result);
    if (result['status'] == 200) {
      var userID = result['user']['userId'];
      await Auth.rememberUser(userID);
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Successfilly Logged In",
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/welcome');
    } else if (result['status'] == 401) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message:
              "Incorrect email or password. Please check your credentials and try again",
        ),
      );
    } else if (result['status'] == 404) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "User does not exist!",
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Something went wrong!",
        ),
      );
    }
  }

  Future<void> rememberUser(String id) async {
    await storage.write(key: "userId", value: id);
  }

  Future<String> getUserId() async {
    var userId = storage.read(key: "userId").toString();
    return userId;
  }

  User user = User('', '', '', '');

  @override
  Widget build(BuildContext context) {

    void onLogin() {
      if (_formKey.currentState!.validate()) {
        login();
      }
    }
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
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
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 35, 35, 35),
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
                                        text: user.email),
                                    onChanged: (value) {
                                      user.email = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
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
                                        color: Color.fromARGB(255, 54, 54, 54),
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
                                    obscureText: true,
                                    controller: TextEditingController(
                                        text: user.password),
                                    onChanged: (value) {
                                      user.password = value;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Password is Required';
                                      } else if (1 == 1) {
                                        return null;
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Color.fromARGB(255, 54, 54, 54),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 15),
                                      hintText: 'Password',
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
                  const SizedBox(height: 5),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 54, 54, 54),
                      shape: const CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {},
                    child: const Text("Forgot Password ?"),
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    onButtonPressed: onLogin,
                    height: 45,
                    width: 180,
                    childWidget: Text(
                      'LogIn',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: const CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text("Don’t have an  account? Sign Up"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
