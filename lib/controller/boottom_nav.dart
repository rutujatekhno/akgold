// import 'package:ak_golden_project/common/order_form.dart';
// import 'package:ak_golden_project/screens/bill_details.dart';
// import 'package:ak_golden_project/screens/order_checkout_screen.dart';
// import 'package:ak_golden_project/screens/order_history_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class BottomNavBarScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         switch (controller.selectedIndex.value) {
//           case 0:
//             return OrderCheckoutScreen();
//           case 1:
//             return OrderHistoryScreen();
//           case 2:
//             return BillDetails();
//           case 3:
//             return BillDetails();
//           default:
//             return  NewOrderForm();
//         }
//       }),
//       bottomNavigationBar: Obx(() {
//         return BottomNavigationBar(
//           currentIndex: navController.selectedIndex.value,
//           onTap: (index) => navController.changePage(index),
//           items: [
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/images/home.png', width: 24),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/images/Frame3.png', width: 24),
//               label: 'Order History',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/images/Frame2.png', width: 24),
//               label: 'Cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/images/Frame4.png', width: 24),
//               label: 'Account',
//             ),
//           ],
//           selectedItemColor: Colors.brown,
//           unselectedItemColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//         );
//       }),
//     );
//   }
// }
