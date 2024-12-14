import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/counter_controller.dart';

// Define the CardData class
class CardData {
  final String name;
  final IconData icon;
  final String amount;

  CardData(this.name, this.icon, this.amount);
}

void card_sheet() {
  final List<CardData> cardDataList = [
    CardData('Product Name: Cake', Icons.currency_rupee, '270'),
    CardData('Product Name: Pastry', Icons.currency_rupee,'380'),
    CardData('Product Name: CupCakes', Icons.currency_rupee,'280'),
    CardData('Product Name: Brownies', Icons.currency_rupee,'250'),


    // Add more card data as needed
  ];

  Get.bottomSheet(
    SingleChildScrollView(
      child: Center(
        child: Container(
          width: 90.w, // Make container responsive
          padding: EdgeInsets.all(2.h), // Adjust padding with Sizer
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "List of Products !!",
                  style: TextStyle(
                    fontSize: 18.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
              Column(
                children: cardDataList.map((data) => card(data)).toList(),
              ),
              SizedBox(height: 2.h), // Responsive spacing before button
              button(),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget button() {
  return SizedBox(
    width: 50.w, // Make the button width responsive
    height: 6.h, // Responsive button height
    child: ElevatedButton(
      onPressed: () {
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Save',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp, // Responsive font size
        ),
      ),
    ),
  );
}

Widget card(CardData data) {
  final CounterController controller = Get.put(CounterController());

  return Container(
    margin: EdgeInsets.symmetric(vertical: 1.h), // Responsive margin
    padding: EdgeInsets.all(2.h), // Responsive padding
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.name,
              style: TextStyle(fontSize: 14.sp), // Responsive text size
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 8.w, // Responsive width for buttons
                  height: 8.w,
                  child: FloatingActionButton(
                    onPressed: controller.decrement,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove, size: 18),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.brown.shade200, // Consistent button color
                    elevation: 0,
                  ),
                ),
                SizedBox(width: 3.w), // Responsive spacing
                Obx(
                      () => Text(
                    '${controller.count}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(width: 3.w), // Responsive spacing
                SizedBox(
                  width: 8.w,
                  height: 8.w,
                  child: FloatingActionButton(
                    onPressed: controller.increment,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add, size: 18),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.brown.shade200,
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 1.h), // Responsive spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(data.icon, size: 16.sp), // Responsive icon size
            SizedBox(width: 1.w),
            Text(
              data.amount,
              style: TextStyle(fontSize: 14.sp), // Responsive text size
            ),
          ],
        )
      ],
    ),
  );
}
