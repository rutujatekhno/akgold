import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';
import '../controller/date_controller.dart';
import '../controller/repeat_order_controller.dart';
import '../model/cafe_orderall_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RepeatOrderController _controller = Get.put(RepeatOrderController());
  final DateController dateController = Get.put(DateController());


  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar(
          "Press Again",
          "Press the back button again to exit the app.",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(milliseconds: 600)
      );
      return Future.value(false);
    }
    return Future.value(true);
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 72,
          backgroundColor: const Color(0xff7B3F00),
          title: Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 12.0),
            child: Container(
              height: 35,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/images/pic1.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Text(
                    "  Welcome",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 45),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: IconButton(
                  onPressed: () {
                    // SystemNavigator.pop();
                    // Get.toNamed('/profile_screen');
                    Get.find<PersistentTabController>().jumpToTab(4);
                  },
                  icon: const Icon(Icons.person, color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 5.h,
                width: 100.w,
                color: const Color(0xffD7BB9E),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "AK Golden Crust",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Center(
                child: Obx(() {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          _controller.totalDaysInMonth,(index) {
                        final currentDate =
                        _controller.firstDayOfMonth.add(Duration(days: index));
                        final dayName = DateFormat('E').format(currentDate);
                        final isSelected = _controller.selectedIndex.value == index;

                        return GestureDetector(
                          onTap: () {
                            _controller.updateSelectedIndex(index);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                dayName.substring(0,1),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: dayName.isNotEmpty
                                      ? const Color(0xff7B3F00)
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xff7B3F00)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xff7B3F00)
                                        : Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  (index + 1).toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
              SizedBox(height: 2.h),
              // Track Payment Section
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "     Track Payment",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    // Obx(() {
                    //   return Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 20),
                    //         child: Container(
                    //           width: 34.w,
                    //           height: 4.h,
                    //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey.shade100,
                    //             border: Border.all(color: Colors.grey.shade400),
                    //             borderRadius: BorderRadius.circular(8.0),
                    //           ),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text(
                    //                 dateController.selectedDate.value.isEmpty
                    //                     ? 'Date'
                    //                     : dateController.selectedDate.value,
                    //                 style: GoogleFonts.inter(
                    //                   fontSize: 14.sp,
                    //                   fontWeight: FontWeight.w400,
                    //                   color: Colors.black54,
                    //                 ),
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   InkWell(
                    //                     onTap: () async {
                    //                       DateTime? pickedDate = await showDatePicker(
                    //                         context: context,
                    //                         initialDate: DateTime.now(),
                    //                         firstDate: DateTime(2000),
                    //                         lastDate: DateTime(2101),
                    //                       );
                    //
                    //                       if (pickedDate != null) {
                    //                         String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    //                         dateController.setDate(formattedDate);
                    //
                    //                         // Calculate the new selectedIndex based on the pickedDate
                    //                         int newIndex = pickedDate.difference(_controller.firstDayOfMonth).inDays;
                    //                         _controller.updateSelectedIndex(newIndex);
                    //                       }
                    //                     },
                    //                     child: const Icon(
                    //                       Icons.calendar_today_outlined,
                    //                       color: Colors.black54,
                    //                       size: 20,
                    //                     ),
                    //                   ),
                    //                   if (dateController.selectedDate.value.isNotEmpty)
                    //                     InkWell(
                    //                       onTap: () {
                    //                         dateController.setDate('');
                    //                         _controller.updateSelectedIndex(-1);
                    //                       },
                    //                       child: const Icon(
                    //                         Icons.clear,
                    //                         color: Colors.black54,
                    //                         size: 20,
                    //                       ),
                    //                     ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // }),
                  ]
              ),
              SizedBox(height: 2.h),
              Container(
                width: 322,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff7B3F00),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                       BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.brown,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  tabs: const [
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Pending",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              // Order Cards
              SizedBox(
                height: 70.h,
                child: TabBarView(
                  children: [
                    // Completed Orders Tab
                    Obx(() {
                      if (_controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (_controller.errorMessage.isNotEmpty) {
                        return Center(
                            child: Text(_controller.errorMessage.value));
                      }
                      if (_controller.orders.isEmpty) {
                        return const Center(child: Text("No orders found"));
                      }

                      // Filter completed orders
                      final completedOrders = _controller.orders
                          .where((order) => order.paymentStatus == 1)
                          .toList();

                      return ListView.builder(
                        // itemCount: completedOrders.length,
                        itemCount: _controller.filteredOrders
                            .where((order) => order.paymentStatus == 1)
                            .length,
                        itemBuilder: (context, index) {
                          // final order = completedOrders[index];
                          final order = _controller.filteredOrders
                              .where((order) => order.paymentStatus == 1)
                              .toList()[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                _showOrderDetailsPopup(context, order);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 65,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            color: Color(0xffF2ECE6),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                 Text(
                                                  "Order No.",
                                                  style: GoogleFonts.lato(
                                                      fontWeight: FontWeight.w400),
                                                ),

                                                Text(
                                                  "${order.orderNumber}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.brown,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 2.w),
                                    Column(
                                      children: [
                                        Text(
                                          "Date:  ${order.orderDate != null ? DateFormat('dd-MMMM-yyyy').format(DateTime.parse(order.orderDate!)) : 'N/A'}",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "₹ ${order.totalAmount}/-",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffB60808),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5.w),
                                    IconButton(
                                        onPressed: () {
                                          _showOrderDetailsPopup(context,order);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),

                    // Pending Orders Tab
                    Obx(() {
                      if (_controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (_controller.errorMessage.isNotEmpty) {
                        return Center(
                            child: Text(_controller.errorMessage.value));
                      }
                      if (_controller.orders.isEmpty) {
                        return const Center(child: Text("No orders found"));
                      }

                      // Filter pending orders
                      final pendingOrders = _controller.orders
                          .where((order) => order.paymentStatus == 0)
                          .toList();

                      return ListView.builder(
                      //  itemCount: pendingOrders.length,
                        itemCount: _controller.filteredOrders
                            .where((order) => order.paymentStatus == 0)
                            .length,
                        itemBuilder: (context, index) {
                          // final order = pendingOrders[index];
                          final order = _controller.filteredOrders
                              .where((order) => order.paymentStatus == 0)
                              .toList()[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 65,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Color(0xffF2ECE6),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Order No.",
                                                style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.w400),
                                              ),

                                              Text(
                                                "${order.orderNumber}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.brown,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 2.w),
                                  Column(
                                    children: [
                                      Text(
                                        "Date: ${order.orderDate != null ? DateFormat('dd-MMMM-yyyy').format(DateTime.parse(order.orderDate!)) : 'N/A'}",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "₹ ${order.totalAmount}/-",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffB60808),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5.w),
                                  IconButton(
                                      onPressed: () {
                                        _showOrderDetailsPopup(context, order);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
  }
}

void _showOrderDetailsPopup(BuildContext context, Orders order) {
  // Calculate total quantities and total amount
  final int totalProducts = order.products?.fold(
      0, (sum, product) => sum! + (product.quantity ?? 0)) ??
      0; // Total quantity of all products
  final double totalAmount = order.products?.fold(
      0.0, (sum, product) => sum! + (product.subTotalAmount ?? 0.0)) ??
      0.0; // Total amount

  showDialog(
    context: context,
    builder: (context) {
      // Local state to track the selected product index
      ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titlePadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Order Details",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(0xff7B3F00),
                ),
              ),
              const Divider(
                color: Color(0xffD7BB9E),
                thickness: 1,
              ),
              const SizedBox(height: 8),
              SizedBox(
                child: ValueListenableBuilder<int?>(
                  valueListenable: selectedIndex,
                  builder: (context, selected, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...order.products!.asMap().entries.map(
                              (entry) {
                            int index = entry.key;
                            var product = entry.value;

                            return GestureDetector(
                              onTap: () {
                                selectedIndex.value =
                                (selectedIndex.value == index) ? null : index;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selected == index
                                      ? const Color(0xffF5E1C0)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 8.0),
                                margin: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${product.name} [${product.quantity ?? 0} Piece]",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Price
                                    Text(
                                      "₹ ${product.subTotalAmount}",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: const Color(0xff7B3F00),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Divider(
                            color: Color(0xffD7BB9E),
                            thickness: 1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Quantity\n$totalProducts",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Total Amount\n₹ $totalAmount/-",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: const Color(0xff7B3F00),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}