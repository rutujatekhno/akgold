class RepeatOrder extends StatelessWidget {
  final RepeatOrderController controller = Get.put(RepeatOrderController());
  final DateController dateController = Get.put(DateController());

  RepeatOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                // Date Picker
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 34.w,
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
                                  ? 'Date'
                                  : dateController.selectedDate.value,
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
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
                                      int newIndex = pickedDate.difference(controller.firstDayOfMonth).inDays;
                                      controller.updateSelectedIndex(newIndex);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                ),
                                if (dateController.selectedDate.value.isNotEmpty)
                                  InkWell(
                                    onTap: () {
                                      dateController.setDate('');
                                      controller.updateSelectedIndex(-1);
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 2.h),
                // Orders List
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.errorMessage.isNotEmpty) {
                    return Center(child: Text(controller.errorMessage.value));
                  }

                  if (controller.filteredOrders.isEmpty) {
                    return const Center(child: Text("No orders found"));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.filteredOrders.length,
                    itemBuilder: (context, index) {
                      final order = controller.filteredOrders[index];

                      return GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value =
                              controller.selectedIndex.value == index ? -1 : index;
                          _showOrderDetailsPopup(context, order);
                        },
                        child: Obx(() {
                          final isSelected = controller.selectedIndex.value == index;

                          return Card(
                            color: isSelected ? const Color(0xFFF7E7DB) : Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Colors.grey.shade200,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order No.\n${order.orderNumber ?? 'N/A'}",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Date: ${order.orderDate != null ? DateFormat('dd-MMM-yyyy').format(DateTime.parse(order.orderDate!)) : 'N/A'}",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final orderCheckoutController =
                                          Get.put(OrderCheckoutController());
                                      orderCheckoutController.repeatOrder(order);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isSelected
                                          ? const Color(0xff7B3F00)
                                          : Colors.white,
                                      foregroundColor: isSelected
                                          ? Colors.white
                                          : const Color(0xff7B3F00),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.brown),
                                      ),
                                    ),
                                    child: Text(
                                      'Repeat',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }