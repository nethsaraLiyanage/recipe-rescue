import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:recipe_rescue/model/Recipe.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:recipe_rescue/utils/connection.dart';

class HttpServiceRecipe {

  Future<List<Recipe>> getRecipes(List<String?> ingredients) async {
    Response res = await post(Uri.parse("${Connection.baseUrl}/api/recipe/getRecipesByIngredientsFilter"),
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "ingredients": jsonEncode(ingredients)
      }
    ));
    if (res.statusCode == 200) {
      log(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<Recipe> recipes =
          body.map((dynamic item) => Recipe.fromJson(item)).toList();

      return recipes;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get recipes";
    }
  }
}
