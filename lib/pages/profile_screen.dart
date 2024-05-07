import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final storage = new FlutterSecureStorage();

    void logout() async {
      await storage.delete(key: "userId");
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Successfilly Logged Out",
        ),
      );
      Navigator.pushNamed(context, '/login');
    }

    final buttons = [
      'Account',
      'Settings',
      'Privacy Policies',
      'App Info',
      'Logout'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.231,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/home_dp.png'),
                  ),
                  Text(
                    'Shasha Mendis',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'shashamendis@gmail.com',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: size.height * 0.342,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   ...buttons
                //       .map((e) => 
                //       .toList(),
                // ],
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.75,
                          child: const Divider(
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Settings",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.75,
                          child: const Divider(
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Privacy Policies",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.75,
                          child: const Divider(
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "App Info",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.75,
                          child: const Divider(
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      logout();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Log out",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.75,
                          child: const Divider(
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  )
                          
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
