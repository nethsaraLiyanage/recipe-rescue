import 'package:flutter/material.dart';
import 'package:recipe_rescue/api/http_service_saved.dart';
import 'package:recipe_rescue/model/Recipe.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreen();
}

class _SavedScreen extends State<SavedScreen> {

  final HttpServiceSaved _HttpServiceSaved = new HttpServiceSaved();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _HttpServiceSaved.getSaved(),
        builder:
          (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            List<Recipe>? recipes = snapshot.data;
            return (Padding(
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
                    
                    SizedBox(
                      height: size.height * 0.7,
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
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 25),
                                      padding: const EdgeInsets.all(12),
                                      width: double.infinity,
                                      height: size.height * 0.14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: size.height * 0.11,
                                                    width: size.width * 0.2,
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
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(left:15, top:15, right: 10),
                                                    width: size.width * 0.45,
                                                    child: Text(
                                                      recipe.name,
                                                      style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    child: InkWell(
                                                      child: Image.asset('assets/images/star-group.png'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.centerRight,
                                                    child: InkWell(
                                                      child: Image.asset('assets/images/saved-colored-heart.png'),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    recipe.mealType,
                                                    style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
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
          return (
            const Center(
              child: Text(
                "You have no saved recipes!",
                style: TextStyle(
                  color: Color.fromARGB(255, 58, 58, 58),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          );
        }),
    );
  }
}
