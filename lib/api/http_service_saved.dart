import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:recipe_rescue/model/Recipe.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:recipe_rescue/utils/connection.dart';

class HttpServiceSaved {
  Future<List<Recipe>> getSaved() async {
    Response res = await get(Uri.parse("${Connection.baseUrl}/api/recipe/getSavedRecipes"));
    if (res.statusCode == 200) {
      log(res.body);
      List<dynamic> body = jsonDecode(res.body);
      print(res.body);

      List<Recipe> savedRecipes = body.map((dynamic item) => Recipe.fromJson(item)).toList();

      return savedRecipes;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get products";
    }
  }
}
