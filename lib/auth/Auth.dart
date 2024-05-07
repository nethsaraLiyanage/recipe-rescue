import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_rescue/model/User.dart';
import 'package:email_auth/email_auth.dart';

class Auth {
  static final storage = new FlutterSecureStorage();
  static User user = User('', '', '', '');
  static EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");
  final TextEditingController _emailController = TextEditingController();

//Remember user for next login
  static Future<void> rememberUser(String id) async {
    await storage.write(key: "userId", value: id);
  }

//Get the current user id
  static Future<String> getUserId() async {
    var userId = await storage.read(key: "userId");
    return userId.toString();
  }

//Check if user is previously logged in
  static Future<bool> isLoggedIn() async {
    String? userId = await storage.read(key: "userId");
    print(userId);
    if (userId == null) {
      return false;
    } else {
      return true;
    }
  }

//Get the user profile details
  static Future<User> view() async {
    var id = await getUserId();
    var res = await http.get(Uri.parse(Connection.baseUrl + "/user/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        });
    var result = await jsonDecode(res.body);
    user.full_name = await result['user']['fullName'];
    user.email = await result['user']['email'];
    user.mobile_number = await result['user']['mobileNumber'];

    return user;
  }

  static bool verifyOtp(String otp)  {
    var res =   emailAuth.validateOtp(recipientMail:"udithaj.98@gmail.com", userOtp: otp);
    if (res) {
      return true;
    }
    else{
      return false;
    }
  }

  //Get the current user id
  static Future<String> getOrderId() async {
    var orderId = await storage.read(key: "order_id");
    return orderId.toString();
  }
}
