import 'package:ak_golden_project/controller/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';
import '../controller/date_controller.dart';
import '../model/cafe_orderall_model.dart';

class OrderHistoryScreen extends StatelessWidget {

  final DateController dateController = Get.put(DateController());
  final OrderHistoryController orderHistoryController = Get.put(OrderHistoryController());
  final RxList<Orders> _filteredOrders = RxList<Orders>();
  final TextEditingController searchController = TextEditingController();

  OrderHistoryScreen({super.key});


  void _filterOrders(String query) {
    orderHistoryController.filterOrdersBySearch(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: const Color(0xff7B3F00),
        title: Text(
          "Order History",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w400,
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
                  Get.find<PersistentTabController>().jumpToTab(4);
                },
                icon: const Icon(Icons.person, color: Colors.brown),
              ),
            ),
          ),
        ],
        leading: IconButton(onPressed: (){
          // Get.back();
          // Get.toNamed('/profile_screen');
          Get.find<PersistentTabController>().jumpToTab(4);},
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Cafe Name
            _buildCafeHeader(),
            SizedBox(height: 3.h),
            // Search Bar
            _buildSearchBar(),
            SizedBox(height: 2.h),
            const Divider(
              height: 2,
              color: Color(0xffF2ECE6),
              thickness: 2,
            ),
            SizedBox(height: 2.h),
            // Date Picker
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Container(
                      width: 35.w,
                      height: 5.h,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateController.selectedDate.value.isEmpty
                                ? 'Order Date'
                                : dateController.selectedDate.value,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          Row( // Wrap calendar and reset icons in a Row
                            children: [
                              InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );

                                  if (pickedDate != null) {
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                    dateController.setDate(formattedDate);

                                    // Calculate the new selectedIndex based on the pickedDate
                                    int newIndex = pickedDate.difference(orderHistoryController.firstDayOfMonth).inDays;
                                    orderHistoryController.updateSelectedIndex(newIndex);
                                  }
                                },
                                child: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                              ),
                              if (dateController.selectedDate.value.isNotEmpty) // Show reset icon only if a date is selected
                                InkWell(
                                  onTap: () {
                                    dateController.setDate(''); // Reset the selected date
                                    orderHistoryController.updateSelectedIndex(-1); // Reset selectedIndex
                                  },
                                  child: const Icon(
                                    Icons.clear, // Or any other suitable icon
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 2.h),
            // Order List
            _buildOrderList(),
          ],
        ),
      ),
    );
  }

  // Widget to build the cafe header
  Widget _buildCafeHeader() {
    return Container(
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
            SizedBox(width: 4.w),
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
    );
  }

  // Widget to build the search bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: _filterOrders,
              decoration: InputDecoration(
                hintText: "Search by Order Number",
                hintStyle: GoogleFonts.lato(color: Colors.grey,fontWeight: FontWeight.w400),
                prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the order list
  Widget _buildOrderList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        if (orderHistoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (orderHistoryController.errorMessage.isNotEmpty) {
          return Center(child: Text(orderHistoryController.errorMessage.value));
        }
        if (orderHistoryController.orders.isEmpty) {
          return const Center(child: Text("No orders found"));
        }

        final ordersToDisplay =
        _filteredOrders.isNotEmpty ? _filteredOrders : orderHistoryController.orders;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // itemCount: ordersToDisplay.length,
          itemCount: orderHistoryController.filteredOrders.length,
          itemBuilder: (context, index) {
            // final order = ordersToDisplay[index];
            final order = orderHistoryController.filteredOrders[index];

            // Check if this order is selected
            final isSelected = orderHistoryController.selectedIndex.value == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: GestureDetector(
                onTap: () {
                  // Toggle the selected index on tap
                  // controller.selectedIndex.value =
                  // isSelected ? -1 : index;
                  // _showOrderDetailsPopup(context, order);
                  orderHistoryController.selectedIndex.value =
                  orderHistoryController.selectedIndex.value == index ? -1 : index;
                  _showOrderDetailsPopup(context, order);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xffF2ECE6) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Order Number Container
                      Container(
                        width: 90,
                        height: 70,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: isSelected
                              ? Colors.white
                              : const Color(0xffF2ECE6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text(
                           "Order No.",
                              style: GoogleFonts.lato(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              order.orderNumber ?? 'N/A',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Order Date and Amount
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date: ${order.orderDate != null ? DateFormat('dd-MMM-yyyy').format(DateTime.parse(order.orderDate!)) : 'N/A'}",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "₹ ${order.totalAmount}/-",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      // Forward Arrow Icon
                      IconButton(
                        onPressed: () {
                          _showOrderDetailsPopup(context, order);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
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
