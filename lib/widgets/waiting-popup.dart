import 'dart:async';

import 'package:flutter/material.dart';

import 'package:recipe_rescue/pages/recipe_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WaitPopup extends StatefulWidget {
  const WaitPopup({
    super.key,
    required this.ingredients
  });

  @override
  State<WaitPopup> createState() => _WaitPopupState();

  final List<String> ingredients;
}

class _WaitPopupState extends State<WaitPopup> {

  changeRoute () async {
    await Future.delayed(const Duration(seconds: 8), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipeScreen(ingredients: widget.ingredients)),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    changeRoute();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (cyx, constraints) {
      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color:  Color.fromARGB(255, 227, 188, 59),
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Please wait! \n We are processing your request',
                  style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),

                
              ],
            ),
          ),
        ),
      );
    });
  }
}
