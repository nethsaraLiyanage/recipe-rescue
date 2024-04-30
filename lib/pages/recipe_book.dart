import 'package:recipe_rescue/model/notification_model.dart';
import 'package:flutter/material.dart';

class RecipeBookScreen extends StatefulWidget {
  const RecipeBookScreen({super.key});

  @override
  State<RecipeBookScreen> createState() => _RecipeBookScreen();
}

class _RecipeBookScreen extends State<RecipeBookScreen> {
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Notification',
      //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 25,
      //         ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/recipe_book_screen.png',
              fit: BoxFit.fill,
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   width: double.infinity,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: Text(
          //           'Mark as Read',
          //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 16,
          //                 color: const Color.fromARGB(255, 255, 0, 0),
          //               ),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       SizedBox(
          //         height: size.height * 0.7,
          //         child: SingleChildScrollView(
          //           child: Column(
          //             children: notifications
          //                 .map(
          //                   (e) => Container(
          //                     margin: const EdgeInsets.only(bottom: 25),
          //                     padding: const EdgeInsets.all(12),
          //                     width: double.infinity,
          //                     height: size.height * 0.14,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(15),
          //                       color: Colors.white,
          //                       boxShadow: const [
          //                         BoxShadow(
          //                           blurRadius: 4,
          //                         )
          //                       ],
          //                     ),
          //                     child: Column(
          //                       children: [
          //                         Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text(
          //                               e.title,
          //                               style: Theme.of(context)
          //                                   .textTheme
          //                                   .bodyMedium!
          //                                   .copyWith(
          //                                     fontWeight: FontWeight.bold,
          //                                     fontSize: 16,
          //                                   ),
          //                             ),
          //                             Text(
          //                               e.time,
          //                               style: Theme.of(context)
          //                                   .textTheme
          //                                   .bodyMedium!
          //                                   .copyWith(
          //                                     fontWeight: FontWeight.bold,
          //                                     fontSize: 15,
          //                                     color: const Color.fromARGB(
          //                                         255, 166, 166, 166),
          //                                   ),
          //                             ),
          //                           ],
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: size.width * 0.78,
          //                               child: Text(
          //                                 e.content,
          //                                 style: Theme.of(context)
          //                                     .textTheme
          //                                     .bodyMedium!
          //                                     .copyWith(
          //                                       fontWeight: FontWeight.w400,
          //                                       fontSize: 12,
          //                                     ),
          //                               ),
          //                             ),
          //                             const SizedBox(
          //                               width: 16,
          //                             ),
          //                             if (!e.isRead)
          //                               Container(
          //                                 width: 10,
          //                                 height: 10,
          //                                 decoration: const BoxDecoration(
          //                                     shape: BoxShape.circle,
          //                                     color: Color.fromARGB(
          //                                         255, 0, 86, 254)),
          //                               )
          //                           ],
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 )
          //                 .toList(),
          //           ),
          //         ),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           InkWell(
          //             child: Container(
          //               height: 50,
          //               width: 50,
          //               decoration: const BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: Colors.white,
          //               ),
          //               child: const Icon(
          //                 Icons.delete_outlined,
          //                 size: 40,
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
