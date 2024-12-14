// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import '../controller/cart_controller.dart';
//
// void cartAdd(BuildContext context) {
//   final CartController cartController = Get.find<CartController>();
//
//
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.topCenter,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 6.0),
//             child:  IntrinsicHeight(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(
//                           10), // Adjust the radius as needed
//                       child: Image.asset('assets/images/cake.png'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 22),
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.zero),
//                             border: Border.all(color: Colors.green),
//                           ),
//                           child: Icon(
//                             Icons.circle,
//                             size: 18,
//                             color: Colors.green,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 3.w,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: 10.w,
//                             // height: 16,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.greenAccent.shade100),
//                             child: Center(
//                                 child: Text(
//                                   "New",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green.shade600),
//                                 )),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 22),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                          Text(
//                           "Almond Chocolate Cupcake",
//                           //  productModule.name ?? 'N/A',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.share),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 22),
//                     child: Row(
//                       children: [
//                         Icon(Icons.currency_rupee, size: 22),
//                         Text(
//                           "99",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 22),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Extra protein charges an additional charge",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   Container(
//                     height: 8.h,
//                     decoration: const BoxDecoration(
//                         color: Color(0xffFBEFE3),
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(20),
//                             topLeft: Radius.circular(20))),
//                     child: Center(
//                       child: SizedBox(
//                         width: 100.w,
//                          height: 5.h,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.brown.shade50,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Quantity Selector
//                               Container(
//                                 height: 4.h,
//                                 padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.brown.shade200),
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.brown.shade50,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     // Decrease button
//                                     IconButton(
//                                       icon: Icon(Icons.remove,color: Colors.brown,),
//                                       onPressed: () {
//                                         cartController.decreaseQuantity();
//                                       },
//                                       iconSize: 20,
//                                     ),
//                                     // Quantity text
//                                     Obx(() => Text(
//                                       "${cartController.quantity}",
//                                       style: TextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.bold,color: Colors.brown
//                                       ),
//                                     )),
//                                     // Increase button
//                                     IconButton(
//                                       icon: Icon(Icons.add,color: Colors.brown,),
//                                       onPressed: () {
//                                         cartController.increaseQuantity();
//                                       },
//                                       iconSize: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 2.w),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     Get.toNamed('/billdetails');
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.brown,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       // Price
//                                       Obx(() => Text(
//                                         '₹ ${cartController.price.value * cartController.quantity.value}',
//                                         style: TextStyle(
//                                           // fontSize: 14.sp,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )),
//                                       // Text and Icon
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "View Cart",
//                                             style: TextStyle(
//                                               // fontSize: 14.sp,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           SizedBox(width: 2.w),
//                                           Icon(
//                                             Icons.shopping_basket_outlined,
//                                             color: Colors.white,
//                                             // size: 18.sp,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
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
