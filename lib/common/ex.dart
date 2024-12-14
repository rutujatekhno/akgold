// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// void show(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.topCenter,
//         children: [
//           IntrinsicHeight(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(
//                         10),
//                     child: Image.asset('assets/images/cake.png'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22),
//                   child: Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(Radius.zero),
//                           border: Border.all(color: Colors.green),
//                         ),
//                         child: const Icon(
//                           Icons.circle,
//                           size: 18,
//                           color: Colors.green,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 3.w,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           width: 10.w,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: Colors.greenAccent),
//                           child: const Center(
//                               child: Text(
//                                 "New",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff0B0A0A)),
//                               )),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Almond Chocolate Cupcake",
//                         // productModule.name ?? "na",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.share),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 22),
//                   child: Row(
//                     children: [
//                       Icon(Icons.currency_rupee, size: 22),
//                       Text(
//                         "99",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 22),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Extra protein charges an additional charge",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Container(
//                   height: 8.h,
//                   decoration: const BoxDecoration(
//                       color: Color(0xffFBEFE3),
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                           topLeft: Radius.circular(20))),
//                   child: Center(
//                     child: SizedBox(
//                       width: 82.w,
//                       height: 5.h,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Get.back();
//                           Get.showSnackbar(
//                             GetBar(
//                               messageText: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.brown,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 padding: const EdgeInsets.all(8),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const Icon(Icons.currency_rupee,
//                                             color: Colors.white),
//                                         SizedBox(width: 2.w),
//                                         const Text(
//                                           "99",
//                                           style: TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                         SizedBox(width: 5.w),
//                                         const Text(
//                                           "1 Item |",
//                                           style: TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                         SizedBox(width: 20.w),
//                                         TextButton(
//                                           onPressed: () {
//                                             Get.toNamed('/billdetails');
//                                           },
//                                           child: const Text(
//                                             "View Cart",
//                                             style:
//                                             TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                         SizedBox(width: 5.w),
//                                         const Icon(Icons.shopping_cart_sharp,
//                                             color: Colors.white),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               snackPosition: SnackPosition.BOTTOM,
//                               backgroundColor: Colors.transparent,
//                               margin: const EdgeInsets.only(
//                                   bottom: 50, left: 10, right: 10),
//                               duration: const Duration(seconds: 3),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.brown,
//                             padding: const EdgeInsets.all(8),
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(Radius.zero))),
//                         child: Text(
//                           "Add",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: -50,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const CircleAvatar(
//                 radius: 20,
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.close, color: Colors.grey),
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }





//code
// Center(
// child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: SizedBox(
// height: 1.h,
// child: const Row(
// children: [
// // Expanded(
// //   child: Obx(() => GestureDetector(
// //         // onTap: () => controller.updateSelectedIndex(0),
// //     onTap: () {
// //       // Get.toNamed('/login');
// //       show(context);
// //     },
// //         child: Container(
// //           alignment: Alignment.center,
// //           decoration: BoxDecoration(
// //               color: controller.selectedIndex.value == 0
// //                   ? const Color(0xffD7BB9E)
// //                   : Colors.white,
// //               borderRadius: const BorderRadius.only(
// //                 topLeft: Radius.circular(8),
// //                 bottomLeft: Radius.circular(8),
// //               ),
// //               border: Border.all(
// //                   color: Colors.brown.shade200)),
// //           child: Text(
// //             'Delivery',
// //             style: TextStyle(
// //               color: controller.selectedIndex.value == 0
// //                   ? Colors.brown
// //                   : Colors.black,
// //             ),
// //           ),
// //         ),
// //       )),
// // ),
// // Pickup Button
// // Expanded(
// //   child: Obx(
// //     () => GestureDetector(
// //       onTap: () => controller.updateSelectedIndex(1),
// //       child: Container(
// //         alignment: Alignment.center,
// //         decoration: BoxDecoration(
// //             color: controller.selectedIndex.value == 1
// //                 ? const Color(0xffD7BB9E)
// //                 : Colors.white,
// //             borderRadius: const BorderRadius.only(
// //               topRight: Radius.circular(8),
// //               bottomRight: Radius.circular(8),
// //             ),
// //             border:
// //                 Border.all(color: Colors.brown.shade200)),
// //         child: Text(
// //           'Pickup',
// //           style: TextStyle(
// //             color: controller.selectedIndex.value == 1
// //                 ? Colors.brown
// //                 : Colors.black,
// //           ),
// //         ),
// //       ),
// //     ),
// //   ),
// // )
// ],
// ),
// ),
// ),
// ),