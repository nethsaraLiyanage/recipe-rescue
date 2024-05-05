import 'package:recipe_rescue/pages/notifications_screen.dart';
import 'package:recipe_rescue/pages/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:recipe_rescue/model/tech_models.dart';
import 'package:recipe_rescue/pages/recipe_book.dart';
import 'package:recipe_rescue/pages/saved.dart';
import 'package:recipe_rescue/pages/servings_page.dart';
import 'package:recipe_rescue/widgets/custom_appbar.dart';
import 'package:recipe_rescue/widgets/progress_bar.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var items = [
      Tech(name: 'Breakfast', icon: Image.asset('assets/images/breakfast.png')),
      Tech(name: 'Lunch', icon: Image.asset('assets/images/lunch.png')),
      Tech(name: 'Brunch', icon: Image.asset('assets/images/brunch.png')),
      Tech(name: 'Dinner', icon: Image.asset('assets/images/dinner.png')),
    ];
    var detailItems = [
      'assets/images/chicken_curry1.png',
      'assets/images/chicken_curry1.png',
      'assets/images/chicken_curry1.png',
    ];

    final navigationItems = [
      {
        'icon': 'assets/images/home_icon.png',
        'title': 'Home',
      },
      {
        'icon': 'assets/images/saved.png',
        'title': 'Saved',
      },
      {'icon': 'assets/images/recipe_book.png', 
        'title': 'Recipe Book'
      },
      {
        'icon': 'assets/images/profile_icon.png',
        'title': 'Profile',
      },
    ];

    void onNavigationBarTap(String title) {
      if (title == 'Profile') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const ProfileScreen(),
          ),
        );
      }
      if (title == 'Saved') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const SavedScreen(),
          ),
        );
      }
      if (title == 'Recipe Book') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const RecipeBookScreen(),
          ),
        );
      }
    }
    void onNotifications() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const NotificationsScreen(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home_arc.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                CustomAppBar(
                  onTap: onNotifications,
                ),
                const SizedBox(height: 35), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Get cooking today !',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    
                  ],
                ),                
                const SizedBox(height: 2),
                const Divider(color: Colors.black26),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                          )),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...items.map(
                      (e) => GestureDetector(
                        onTap: (){
                          if(e.name == "Breakfast"){
                            Navigator.pushNamed(context, '/meal');
                          }
                          else if(e.name == "Lunch"){
                            Navigator.pushNamed(context, '/recipe');
                          }
                          else if(e.name == "Dinner"){
                            Navigator.pushNamed(context, '/servings');
                          }
                        },
                        child: Column(
                          children: [
                            e.icon,
                            // Text(e.name),
                          ],
                        ),
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Popular Recipes',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    
                  ],
                ),
                const SizedBox(height: 15),
                CarouselSlider(
                  items: detailItems
                      .map(
                        (e) => Builder(builder: (BuildContext context) {
                          return Container(
                            width: size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(
                              e,
                              fit: BoxFit.fitHeight,
                            ),
                            
                          );
                        }),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: size.height * 0.28,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 25),
        width: size.width * 0.95,
        height: size.height * 0.089,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 247, 247),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(blurRadius: 3, color: Colors.grey)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...navigationItems
                .map(
                  (e) => InkWell(
                    onTap: () {
                      onNavigationBarTap(e['title']!);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(e['icon']!),
                        Text(e['title']!),
                      ],
                    ),
                  ),
                )
                .toList()
          ],
        ),
      )
    );
  }
}
