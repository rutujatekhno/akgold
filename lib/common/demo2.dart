
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void demo2(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      int _itemCount = 0;
      return IntrinsicHeight(
        child: Column(
          children: [
            Image.asset('assets/images/cake.png'),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.zero),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  width: 10.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.greenAccent),
                  child: Center(
                      child: Text(
                        "New",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Almond Chocolate Cupcake",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.currency_rupee),
                Text(
                  "  99",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Extra protein charges an additional charge",
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.zero),
                  color: Color(0xffFBEFE3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.brown),
                    // ),
                      child: Row(
                          children: [
                            IconButton(
                              icon:  Icon(Icons.remove),
                              onPressed: () {
                                // setState(() {
                                //   _itemCount--;
                                // });
                              },
                            ),
                            Text(_itemCount.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                // setState(() {
                                //   _itemCount++;
                                // });
                              },
                            )
                          ])),
                  SizedBox(
                    height: 4.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.toNamed('/dashboard_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                          ),
                          Text(
                            "99",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/billdetails');                               },
                            child: Text(
                              "  View Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
