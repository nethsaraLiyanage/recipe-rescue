import 'package:flutter/material.dart';

import 'package:recipe_rescue/model/recycle_location_model.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';

class FavouriteRecycles extends StatefulWidget {
  const FavouriteRecycles({
    super.key,
    required this.recycleLocations,
    
  });

  final List<RecycleLocation> recycleLocations;

  @override
  State<FavouriteRecycles> createState() => _NewIngredientsState();
}

class _NewIngredientsState extends State<FavouriteRecycles> {
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
                // ...widget.recycleLocations
                //     .map((e) => SizedBox(
                //           child: 
                //         ))
                //     .toList(),
                Text(
                  'Ingredients',
                  style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Ingredients, Ingredients, Ingredients, Ingredients, Ingredients, Ingredients, Ingredients',
                  style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                
              ],
            ),
          ),
        ),
      );
    });
  }
}
