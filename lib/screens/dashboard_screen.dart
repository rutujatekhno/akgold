import 'package:ak_golden_project/common/repeat_order_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';
import '../common/order_form.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
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
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500),
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
                    // Get.toNamed('/profile_screen');
                    Get.find<PersistentTabController>().jumpToTab(4);
                    },
                  icon: Icon(Icons.person, color: Colors.brown),
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
              SizedBox(height: 2.h,),
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
                    boxShadow: [
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
                  indicatorPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  tabs: const [
                    Tab(
                      text: "New Order",
                    ),
                    Tab(
                      text: "Repeat Order",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              // Display the TabBar content
              Container(
                height: 70.h,
                child: TabBarView(
                  children: [
                    NewOrderForm(),
                    RepeatOrder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
