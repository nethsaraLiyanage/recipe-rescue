import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeBookScreen extends StatefulWidget {
  const RecipeBookScreen({super.key});

  @override
  State<RecipeBookScreen> createState() => _RecipeBookScreen();
}

class _RecipeBookScreen extends State<RecipeBookScreen> {
  
  Future<void> _launchInBrowser(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(
      url,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe Book',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
                    children: [
                      GestureDetector(
                        onTap: () =>  _launchInBrowser("https://drive.google.com/file/d/1sNwdAtpGnolAQbS4FHIJ7sGGZn_HOUvt/view?usp=drive_link") ,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                height: size.height * 0.15,
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
                                                  image: AssetImage('assets/images/cookies.jpg'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left:15, top:15),
                                              width: size.width * 0.40,
                                              child: Text(
                                                "Cookie Recipes",
                                                style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>  _launchInBrowser("https://pdfobject.com/pdf/sample.pdf") ,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                height: size.height * 0.15,
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
                                                  image: AssetImage('assets/images/pastries.jpg'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left:15, top:15),
                                              width: size.width * 0.40,
                                              child: Text(
                                                "Pastry Recipes",
                                                style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>  _launchInBrowser("https://pdfobject.com/pdf/sample.pdf") ,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                height: size.height * 0.15,
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
                                                  image: AssetImage('assets/images/savory.jpg'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left:15, top:15),
                                              width: size.width * 0.40,
                                              child: Text(
                                                "Savory Recipes",
                                                style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>  _launchInBrowser("https://pdfobject.com/pdf/sample.pdf") ,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                height: size.height * 0.15,
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
                                                  image: AssetImage('assets/images/desserts.jpg'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left:15, top:15),
                                              width: size.width * 0.40,
                                              child: Text(
                                                "Dessert Recipes",
                                                style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]
                  ),
                )
              ),
            ]
          ),
        ),
      ),          
    );
  }
}
