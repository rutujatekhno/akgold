import 'package:ak_golden_project/common/addprodut_card.dart';
import 'package:ak_golden_project/screens/bill_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';
import '../common/product_card.dart';
import '../controller/bottom_navigation_controller.dart';
import '../controller/orderchekout_controller.dart';

class OrderCheckoutScreen extends StatelessWidget {
  OrderCheckoutScreen({super.key});

  final OrderCheckoutController controller = Get.put(OrderCheckoutController());
  final BottomNavigationController bottomNavController = Get.put(BottomNavigationController());



  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;

    final List<Widget> imageSliders = List.generate(4, (index) {
      return Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset(
            'assets/images/pic.png',
            fit: BoxFit.cover,
            width: 1000.w,
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 72,
        backgroundColor: const Color(0xff7B3F00),
        title: Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 12.0),
          child: Container(
            height: 35,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
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
                  " Welcome User",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: IconButton(
                onPressed: (){
                  // Get.toNamed('billdetails');
                },
                  icon: const Icon( Icons.person,color: Colors.brown)
                  ),
            ),
          ),
          SizedBox(width: 2.w),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: const Icon(Icons.search, color: Colors.brown),
            ),
          )
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: GestureDetector(
      //         onTap: () {
      //           Get.toNamed('/dashboard_screen');
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.symmetric(
      //                   vertical: 4.0), // Adjust the vertical padding
      //               child: Image.asset(
      //                 'assets/images/home.png',
      //                 width: 7.w,
      //               ),
      //             ),
      //             const Text(
      //               "Home",
      //               style: TextStyle(color: Color(0xff565E6C)),
      //             ),
      //           ],
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //                 vertical: 4.0), // Adjust the vertical padding
      //             child: Image.asset(
      //               'assets/images/Frame.png',
      //               width: 7.w,
      //             ),
      //           ),
      //           const Text(
      //             "Deals",
      //             style: TextStyle(color: Color(0xff565E6C)),
      //           ),
      //         ],
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: GestureDetector(
      //         onTap: () {
      //           Get.toNamed('/orderhistory_screen');
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.symmetric(
      //                   vertical: 4.0),
      //               child: Image.asset(
      //                 'assets/images/Frame3.png',
      //                 width: 7.w,
      //               ),
      //             ),
      //             const Text(
      //               "History",
      //               style: TextStyle(color: Color(0xff565E6C)),
      //             ),
      //           ],
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: GestureDetector(
      //         onTap: () {
      //           Get.toNamed('/billdetails');
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.symmetric(
      //                   vertical: 4.0), // Adjust the vertical padding
      //               child: Image.asset(
      //                 'assets/images/Frame2.png',
      //                 width: 7.w,
      //               ),
      //             ),
      //             const Text(
      //               "Cart",
      //               style: TextStyle(color: Color(0xff565E6C)),
      //             ),
      //           ],
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //                 vertical: 4.0), // Adjust the vertical padding
      //             child: Image.asset(
      //               'assets/images/Frame4.png',
      //               width: 7.w,
      //             ),
      //           ),
      //           const Text(
      //             "Account",
      //             style: TextStyle(color: Color(0xff565E6C)),
      //           ),
      //         ],
      //       ),
      //       label: '',
      //     ),
      //   ],
      //   selectedItemColor: Colors.brown,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      SizedBox(
        width: 55.w,
        height: 6.h,
        child: FloatingActionButton(
          onPressed: (){
            // Get.toNamed('/billdetails');
            // Get.find<PersistentTabController>().jumpToTab(3);
            PersistentNavBarNavigator.pushNewScreen(context, screen: const BillDetails(),withNavBar: true);
        },
          backgroundColor: const Color(0xff7B3F00),
          child: Text("Check Out",style: GoogleFonts.alatsi(fontWeight: FontWeight.w500,color: Colors.white),),
        ),
      ),
      body: SingleChildScrollView(
        reverse: false,
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
                      " Deliver to Manapa",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            CarouselSlider(
              options: CarouselOptions(
                height: 183,
                aspectRatio: Device.width,
                // aspectRatio: 2.0,
                // aspectRatio: deviceWidth > 600 ? 2.5 : 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    controller.currentCarouselIndex(index),
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
              ),
              items: imageSliders,
            ),
            Column(
              children: [
                Obx(
                  () => buildCarouselIndicator(
                    controller.currentCarouselIndex.value,
                    imageSliders.length,
                    (index) {
                      controller.currentCarouselIndex(index);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '   Special Deals',
                  style: GoogleFonts.alatsi(
                      fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(
              height: 75.h,
              child:
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                } else {
                  return GridView.builder(
                    itemCount: controller.products.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 1.7,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()  {
                          // show(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Cards(productModule: controller.products[index],)));
                        },
                        child: ProductCard(
                          productModule: controller.products[index],
                            ),
                      );
                    },
                  );
                }
              }),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '     You may also Like',
                  style: GoogleFonts.alatsi(
                      fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(child: Text(controller.errorMessage.value));
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return AddprodutCard(
                        productModule: controller.products[index],
                      );
                    },
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

Row buildCarouselIndicator(
  int currentCarouselIndex,
  int itemCount,
  void Function(int) onIndicatorTap,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 0; i < itemCount; i++)
        GestureDetector(
          onTap: () {
            onIndicatorTap(i);
          },
          child: Container(
            width: 16,
            height: 5.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              // shape: BoxShape.rectangle,
              color: currentCarouselIndex == i
                  ? Colors.white
                  : Colors.brown.shade300,
            ),
          ),
        ),
    ],
  );
}