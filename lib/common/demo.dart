import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical:15),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(150),topRight: Radius.circular(150))),
          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                  top: 60,
                  left: 42,
                  width: 240,
                  height: 250,
                  child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                          children: [
                            // SizedBox(
                            //   height: 80,
                            //   child: GestureDetector(
                            //     onTap: (){
                            //       // show( context);
                            //     },
                            //     child: Image.asset(
                            //         'assets/images/pic2.png',
                            //       // imageUrl,
                            //        fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 6.h),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        )),
                                    child: Icon(
                                      Icons.circle,
                                      size: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: 1.h),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'productName',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'description',
                              style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'price',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // SizedBox(width: 4.w,),
                                  ElevatedButton(
                                    onPressed: () {
                                      // cartAdd(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Color(0xffFFF4D0), // Button background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      elevation: 5,
                                    ),
                                    child: Text(
                                      'Add Cart',
                                      style: TextStyle(
                                          color: Colors.brown, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ])),
              ),
              Positioned(
                left: 110,
                width: 105,
                height: 105,
                child: Container(
                  child: Image.asset(
                    'assets/images/pic2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
