
import 'package:catalogs/screen/productdetail2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/drawer.dart';

class subcategorytshirt extends StatefulWidget {
  const subcategorytshirt({Key? key}) : super(key: key);

  @override
  State<subcategorytshirt> createState() => _subcategorytshirtState();
}

class Sachen {
  String title;
  String image;
  Sachen(this.title, this.image);
}

class _subcategorytshirtState extends State<subcategorytshirt> {
  final List<Sachen> infoBank = [
    Sachen(
      "Ruffty DTG Round Neck T-shirt",
      "assets/tshirtsub/BLACK-B-11.jpg",
    ),
    Sachen(
      "Ruffty Crew Neck T-shirt",
      "assets/tshirtsub/MULBERRY-B-1.jpg",
    ),
    Sachen(
      "Carbon ni Basics Round Neck T-shirt",
      "assets/tshirtsub/RED-A-5.jpg",
    ),
    Sachen(
      "Ruffty X Crew Neck T-shirt",
      "assets/tshirtsub/ROYAL-BLUE-B.jpg",
    ),
    Sachen(
      "High O2 Crew Neck T-shirt",
      "assets/tshirtsub/WHITE-B-2.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: drawer1(context),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            "Sub category of  T-Shirts",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(3.w),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5.0, crossAxisCount: 2),
            shrinkWrap: true,
            //   scrollDirection:
            // Axis.horizontal,
            itemCount: infoBank.length,
            itemBuilder: (context, index) {
              return Container(
                height: 20.h,
                width: 20.h,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => productdetail2()));
                  },
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  infoBank[index].image,
                                  height: 20.h,
                                  width: 20.h,
                                )),
                            Positioned(
                              top: 13.h,
                              left: 0.5.h,
                              child: Container(
                                width: 19.h,
                                height: 5.h,
                                alignment: Alignment.center,
                                color: Colors.black38,
                                child: Text(
                                  infoBank[index].title,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
