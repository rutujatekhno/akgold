import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../model/all_product_model.dart';

class AddprodutCard extends StatelessWidget {

  // final String productName;
  // final String price;
  final AllProductModule productModule;

  const AddprodutCard({super.key,
    // Key? key,
    //
    // required this.productName,
    // required this.price,
    required this.productModule
  }) ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.w),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12.w),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: ShapeDecoration(
                                shape: Border.all(color: Colors.green),
                              ),
                              child: const Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 14,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              productModule.name ?? "NA",
                              style:  GoogleFonts.alatsi(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  // Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "₹${productModule.makingPrice}",
                        style: GoogleFonts.alatsi(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle add to cart action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE8EBED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Add cart',
                          style: GoogleFonts.alatsi(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // Circular Image
        Positioned(
          // top: 0,
          child: ClipOval(
            child: Image.asset(
              'assets/images/pic2.png',
              width: 27.w,
              height: 27.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
