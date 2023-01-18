import 'package:catalogs/screen/productdetail1.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/drawer.dart';

class subcategoryshirt extends StatefulWidget {
  const subcategoryshirt({Key? key}) : super(key: key);

  @override
  State<subcategoryshirt> createState() => _subcategoryshirtState();
}

class Sachen {
  String title;
  String image;
  Sachen(this.title, this.image);
}

class _subcategoryshirtState extends State<subcategoryshirt> {
  final List<Sachen> infoBank = [
    Sachen(
      "Casablanca Solid Shirts",
      "assets/shirtsub/SHIRT-3A-Sky-blue.jpg",
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
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
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
                        builder: (context) => productdetail1()));
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
