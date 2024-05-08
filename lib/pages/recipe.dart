// ignore: unused_import
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_rescue/model/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:recipe_rescue/pages/feedback.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:recipe_rescue/widgets/popingup.dart';

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
      builder: (ctx) => const FavouriteRecycles(
        recycleLocations: "",
      ),
    );
  }
  void setUserIdLocal() async => await storage.write(key: "rceipeId", value: widget.recipe_passed.id);
  

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
                  Text(
                    widget.recipe_passed.name!,
                    style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                    ),
                  ),
                  InkWell(
                      child: Image.asset('assets/images/saved-not-colored-heart.png'),
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
