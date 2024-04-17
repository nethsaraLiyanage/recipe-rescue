import 'package:recipe_rescue/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
            // Container(
            //   height: size.height * 0.0938,
            //   width: size.width * 0.648,
            //   decoration: BoxDecoration(
            //     color: const Color.fromARGB(255, 248, 248, 248),
            //     boxShadow: const [],
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       SizedBox(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Row(
            //               children: [
            //                 Image.asset('assets/images/star.png'),
            //                 Text(
            //                   '1200',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodyLarge!
            //                       .copyWith(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 20,
            //                       ),
            //                 ),
            //               ],
            //             ),
            //             Text(
            //               'Total Points',
            //               style:
            //                   Theme.of(context).textTheme.bodyLarge!.copyWith(
            //                         fontSize: 16,
            //                       ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Image.asset('assets/images/items.png'),
            //                 Text(
            //                   '500',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodyLarge!
            //                       .copyWith(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 20,
            //                       ),
            //                 ),
            //               ],
            //             ),
            //             Text(
            //               'Total Items',
            //               style:
            //                   Theme.of(context).textTheme.bodyLarge!.copyWith(
            //                         fontSize: 16,
            //                       ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
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
                children: [
                  ...buttons
                      .map((e) => InkWell(
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
                                        e,
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
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
