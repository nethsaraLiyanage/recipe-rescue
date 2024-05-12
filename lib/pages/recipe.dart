// ignore: unused_import
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/model/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:recipe_rescue/pages/feedback.dart';
import 'package:recipe_rescue/utils/connection.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/widgets/popingup.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RecipePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Recipe recipe_passed;
  RecipePage({
    super.key,
    // ignore: non_constant_identifier_names
    required this.recipe_passed,
  });

  @override
  State<RecipePage> createState() => _RecipePage();
}

class _RecipePage extends State<RecipePage> {
  final storage = const FlutterSecureStorage();

  _openFavouriteOverlay(String ingredients) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const IngredientsPopUp(
        recycleLocations: "potatoes (peeled and cubed) - 4 medium, onions (chopped) - 1 medium, tomatoes (chopped) - 2 medium, curry powder - 1 tbsp, coconut milk (full-fat) - 1 cup",
        // recycleLocations: widget.recipe_passed.ingredients == null ? "-" : widget.recipe_passed.ingredients!,
      ),
    );
  }
  void setUserIdLocal() async => await storage.write(key: "rceipeId", value: widget.recipe_passed.id);
  
  Future onTapSave(id) async {
    print(id);
    var res = await http.put(Uri.parse("${Connection.baseUrl}/api/recipe/updateRecipesSaveStatus"),
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode({"id": id,"saveStatus": true})
    );
    var result = await jsonDecode(res.body);
    print(result);
    if (result['status'] == 200) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Successfilly Saved",
        ),
      );
      Navigator.pushNamed(context, '/saved');
    } else if (result['status'] == 401) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message:
              "Sorry! Cannot Save at the moment!",
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
          message:"Sorry! Cannot Save at the moment!",
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserIdLocal();
  }

  void onFeedback() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const FeedbackScreen(),
        ),
        (route) => false);
  }

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left:30, right:30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.recipe_passed.name!,
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                        ),
                        overflow: TextOverflow.visible
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => {onTapSave(widget.recipe_passed.id)},
                    child: Image.asset(widget.recipe_passed.isSaved! ? 'assets/images/saved-colored-heart.png' : 'assets/images/saved-not-colored-heart.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: size.height * 0.3,
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
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/test.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Image.asset('assets/images/star.png'),
                          ),
                          Text(
                            widget.recipe_passed.rating == null ? "-" : widget.recipe_passed.rating!,
                            style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Image.asset('assets/images/cal.png'),
                          ),
                          Text(
                            widget.recipe_passed.calories == null ? "-" : widget.recipe_passed.rating!,
                            style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Proteins',
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.recipe_passed.protiens == null ? "-" : widget.recipe_passed.protiens!,
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Fats',
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.recipe_passed.fats == null ? "-" : widget.recipe_passed.fats!,
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Carbohydrates',
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.recipe_passed.carbohydrates == null ? "-" : widget.recipe_passed.carbohydrates!,
                        style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/white-curved-rectangle.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width-140,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        padding: const EdgeInsets.only(left: 80, right: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Servings',
                                  style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '4',
                                  style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Preperation',
                                  style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                  ),
                                ),
                                Text(
                                  widget.recipe_passed.cookingTime == null ? "-" : widget.recipe_passed.cookingTime!,
                                  style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Cook',
                                  style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                  ),
                                ),
                                Text(
                                  widget.recipe_passed.preparationTime == null ? "-" : widget.recipe_passed.preparationTime!,
                                  style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/ingredients.png',
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.width-220,
                          ),
                          SafeArea(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                                  padding: const EdgeInsets.only(left: 60, right: 60),
                                  child: Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ingredients',
                                            style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 140),
                                            child: InkWell(
                                              onTap:  () => {_openFavouriteOverlay (widget.recipe_passed.ingredients == null ? "-" : widget.recipe_passed.ingredients!)},
                                              child: Image.asset('assets/images/up-arrow.png'),
                                            ),
                                          )
                                        ]
                                      )
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/direction.png',
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      height: MediaQuery.of(context).size.width-250,
                                    ),
                                    SafeArea(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                                            padding: const EdgeInsets.only(left: 60, right: 60),
                                            child: Row(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Directions',
                                                      style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets.only(left: 150),
                                                      child: InkWell(
                                                        onTap: null,
                                                        child: Image.asset('assets/images/up-arrow.png'),
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 50, right: 50),
                                            child: CustomElevatedButton(
                                              onButtonPressed: onFeedback,
                                              height: 45,
                                              width: 255,
                                              childWidget: Text(
                                                'Give Feedback',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            )
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                        )
                                    )
                                  ]
                                )

                              ],
                            )
                          )
                        ]
                      )
                    ],
                  )
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}
