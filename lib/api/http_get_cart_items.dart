import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:flutter_config/flutter_config.dart';
import 'package:recipe_rescue/model/Recipe.dart';

class HttpGetCart {
  // final String getUrl = "http://"+FlutterConfig.get('IP')+":8000/product/get-cart-items/6162ab7904e39f6e99bd92f2";

  int? val;
  int totSel = 0;

  Future<List<Recipe>> getAddons(String? userId) async {
    Response res = await get(Uri.parse("http://" +FlutterConfig.get('IP') +":8000/product/get-cart-items/" +userId.toString()));

    if (res.statusCode == 200) {
      //log(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<Recipe> saved =
          body.map((dynamic item) => Recipe.fromJson(item)).toList();

      return saved;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get saved recipes";
    }
  }
}
