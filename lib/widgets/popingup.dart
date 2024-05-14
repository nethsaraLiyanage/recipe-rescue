import 'package:flutter/material.dart';
import 'package:recipe_rescue/widgets/custom_elevated_button.dart';

class IngredientsPopUp extends StatefulWidget {
  const IngredientsPopUp({
    super.key,
    required this.recycleLocations,
    
  });

  final String recycleLocations;

  @override
  State<IngredientsPopUp> createState() => _NewIngredientsState();
}

class _NewIngredientsState extends State<IngredientsPopUp> {
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
                  widget.recycleLocations,
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
