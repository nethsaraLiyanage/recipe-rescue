// ignore_for_file: unused_import
import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/api/http_service_recipe.dart';
import 'package:recipe_rescue/model/Recipe.dart';
import 'package:recipe_rescue/model/notification_model.dart';
import 'package:recipe_rescue/pages/recipe.dart';
import 'package:recipe_rescue/pages/try_again_screen.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreen();
}
class _RecipeScreen extends State<RecipeScreen> {
  final HttpServiceRecipe _httpServiceRecipe = new HttpServiceRecipe();
  final storage = new FlutterSecureStorage();
  void onStartCooking() {
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (ctx) => const Recipe(),
    //   ),
    //   (route) => false);
  }
  
  List<String?> ingredients = [];

  getIngredients() async {
    await storage.read(key: "ingredients").then((value) {
      setState(() {
        ingredients = value as List<String>;
      });
    });
    print(ingredients);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIngredients();

    Timer(const Duration(seconds: 5), () {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
            future: _httpServiceRecipe.getRecipes(ingredients),
            builder:
              (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
              if (snapshot.hasData) {
                List<Recipe>? recipes = snapshot.data;
                return(
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          // SizedBox(
                          //   height: size.height * 0.8,
                          //   child: SingleChildScrollView(
                          //     child: Column(
                          //       children: savedItems
                          //           .map(
                          //             (e) => Column(
                          //               children: [
                          //                 const SizedBox(
                          //                   height: 15,
                          //                 ),
                          //                 Container(
                          //                   height: size.height * 0.2,
                          //                   width: size.width * 0.9,
                          //                   decoration: BoxDecoration(
                          //                     color: const Color.fromARGB(255, 248, 248, 248),
                          //                     boxShadow: const [
                          //                       BoxShadow(
                          //                         blurRadius: 2,
                          //                         color: Colors.grey,
                          //                       )
                          //                     ],
                          //                     borderRadius: BorderRadius.circular(20),
                          //                     image: const DecorationImage(
                          //                       fit: BoxFit.cover,
                          //                       image: AssetImage('assets/images/test.png'),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 10,
                          //                 ),
                          //                 Text(
                          //                   'Test Recipe Name',
                          //                   style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodyMedium!
                          //                     .copyWith(
                          //                       fontWeight: FontWeight.w400,
                          //                       fontSize: 22,
                          //                   ),
                          //                 ),
                          //                 CustomElevatedButton(
                          //                   onButtonPressed: onStartCooking,
                          //                   height: 30,
                          //                   width: 200,
                          //                   childWidget: Text(
                          //                     'Start Cooking',
                          //                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          //                           fontSize: 20,
                          //                           fontWeight: FontWeight.bold,
                          //                         ),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 10,
                          //                 ),
                          //               ],
                          //             )
                          //           )
                          //           .toList(),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height * 0.8,
                            child: SingleChildScrollView(
                              child: Column(
                                children: recipes!
                                  .map(
                                    (Recipe recipe) => Column(children: [
                                      GestureDetector(
                                        onTap: () => {
                                          // Navigator.pushNamed(context, '/product')
                                          Navigator.push(
                                              context,
                                              '/questions' as Route<Object?>
                                          )
                                        },
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: size.height * 0.2,
                                              width: size.width * 0.9,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 248, 248, 248),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 2,
                                                    color: Colors.grey,
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(20),
                                                image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage('assets/images/test.png'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Test Recipe Name',
                                              style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 22,
                                              ),
                                            ),
                                            CustomElevatedButton(
                                              onButtonPressed: onStartCooking,
                                              height: 30,
                                              width: 200,
                                              childWidget: Text(
                                                'Start Cooking',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                    ]),
                                  )
                                  .toList()
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                );
              }
              return const TryAgainScreen();
            }),
    );
  }
}
