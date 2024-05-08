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
      final responsebody=jsonDecode(res.body) as List;
      List<Recipe> savedRecipes = responsebody.map((dynamic item) => Recipe.fromJson(item)).toList();
      print(savedRecipes);
      return savedRecipes;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get products";
    }
  }
}
