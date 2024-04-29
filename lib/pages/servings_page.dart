// import 'package:recipe_rescue/model/notification_model.dart';
// import 'package:flutter/material.dart';

// class ServingsScreen extends StatefulWidget {
//   const ServingsScreen({super.key});

//   @override
//   State<ServingsScreen> createState() => _NotificationsScreenState();
// }

// class _NotificationsScreenState extends State<ServingsScreen> {
//   final notifications = [
//     LocalNotification(
//       title: 'New Recipe Alerts',
//       time: '1m',
//       content:
//           '🎉 New recipes just added! Check out our latest creations including Spicy Thai Noodle Salad and Lemon Garlic Butter Salmon',
//       isRead: false,
//     ),
//     LocalNotification(
//       title: 'Recipe Recommendations',
//       time: '15m',
//       content:
//           '🌟 Recommended for you: One-Pot Creamy Tuscan Chicken Pasta. Perfect for a cozy night in! Click to view the recipe',
//       isRead: false,
//     ),
//     LocalNotification(
//       title: 'Weekly Meal Plans',
//       time: '1h',
//       content:
//           '🍽️ This week\'s meal plan is here! From hearty breakfast burritos to flavorful chicken stir-fry, we\'ve got your meals covered. Tap to see the plan.',
//       isRead: true,
//     ),
//     LocalNotification(
//       title: 'Cooking Tips and Tricks',
//       time: '6h',
//       content:
//           '👩‍🍳 Tip of the day: Try using cold butter when making pie crusts for a flakier texture. Learn more about pie-making techniques in our latest blog post!',
//       isRead: true,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(
//       //     'Notification',
//       //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//       //           fontWeight: FontWeight.bold,
//       //           fontSize: 25,
//       //         ),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       body: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: Image.asset(
//               'assets/images/servings.png',
//               fit: BoxFit.fill,
//             ),
//           ),
//           // Container(
//           //   margin: const EdgeInsets.symmetric(horizontal: 10),
//           //   width: double.infinity,
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.end,
//           //     children: [
//           //       const SizedBox(
//           //         height: 20,
//           //       ),
//           //       TextButton(
//           //         onPressed: () {},
//           //         child: Text(
//           //           'Mark as Read',
//           //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//           //                 fontWeight: FontWeight.bold,
//           //                 fontSize: 16,
//           //                 color: const Color.fromARGB(255, 255, 0, 0),
//           //               ),
//           //         ),
//           //       ),
//           //       const SizedBox(
//           //         height: 10,
//           //       ),
//           //       SizedBox(
//           //         height: size.height * 0.7,
//           //         child: SingleChildScrollView(
//           //           child: Column(
//           //             children: notifications
//           //                 .map(
//           //                   (e) => Container(
//           //                     margin: const EdgeInsets.only(bottom: 25),
//           //                     padding: const EdgeInsets.all(12),
//           //                     width: double.infinity,
//           //                     height: size.height * 0.14,
//           //                     decoration: BoxDecoration(
//           //                       borderRadius: BorderRadius.circular(15),
//           //                       color: Colors.white,
//           //                       boxShadow: const [
//           //                         BoxShadow(
//           //                           blurRadius: 4,
//           //                         )
//           //                       ],
//           //                     ),
//           //                     child: Column(
//           //                       children: [
//           //                         Row(
//           //                           mainAxisAlignment:
//           //                               MainAxisAlignment.spaceBetween,
//           //                           children: [
//           //                             Text(
//           //                               e.title,
//           //                               style: Theme.of(context)
//           //                                   .textTheme
//           //                                   .bodyMedium!
//           //                                   .copyWith(
//           //                                     fontWeight: FontWeight.bold,
//           //                                     fontSize: 16,
//           //                                   ),
//           //                             ),
//           //                             Text(
//           //                               e.time,
//           //                               style: Theme.of(context)
//           //                                   .textTheme
//           //                                   .bodyMedium!
//           //                                   .copyWith(
//           //                                     fontWeight: FontWeight.bold,
//           //                                     fontSize: 15,
//           //                                     color: const Color.fromARGB(
//           //                                         255, 166, 166, 166),
//           //                                   ),
//           //                             ),
//           //                           ],
//           //                         ),
//           //                         Row(
//           //                           children: [
//           //                             SizedBox(
//           //                               width: size.width * 0.78,
//           //                               child: Text(
//           //                                 e.content,
//           //                                 style: Theme.of(context)
//           //                                     .textTheme
//           //                                     .bodyMedium!
//           //                                     .copyWith(
//           //                                       fontWeight: FontWeight.w400,
//           //                                       fontSize: 12,
//           //                                     ),
//           //                               ),
//           //                             ),
//           //                             const SizedBox(
//           //                               width: 16,
//           //                             ),
//           //                             if (!e.isRead)
//           //                               Container(
//           //                                 width: 10,
//           //                                 height: 10,
//           //                                 decoration: const BoxDecoration(
//           //                                     shape: BoxShape.circle,
//           //                                     color: Color.fromARGB(
//           //                                         255, 0, 86, 254)),
//           //                               )
//           //                           ],
//           //                         )
//           //                       ],
//           //                     ),
//           //                   ),
//           //                 )
//           //                 .toList(),
//           //           ),
//           //         ),
//           //       ),
//           //       Row(
//           //         mainAxisAlignment: MainAxisAlignment.center,
//           //         children: [
//           //           InkWell(
//           //             child: Container(
//           //               height: 50,
//           //               width: 50,
//           //               decoration: const BoxDecoration(
//           //                 shape: BoxShape.circle,
//           //                 color: Colors.white,
//           //               ),
//           //               child: const Icon(
//           //                 Icons.delete_outlined,
//           //                 size: 40,
//           //               ),
//           //             ),
//           //           ),
//           //         ],
//           //       )
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
