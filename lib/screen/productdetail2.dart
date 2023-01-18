import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';
import '../widgets/drawer.dart';

class productdetail2 extends StatefulWidget {
  const productdetail2({Key? key}) : super(key: key);

  @override
  State<productdetail2> createState() => _productdetail2State();
}

class Sachen {
  int title;
  String name;
  Sachen(this.title, this.name);
}

class _productdetail2State extends State<productdetail2> {
  int? index1;
  bool _select = false;
  int _current = 0;
  List<String> image1 = [
    "assets/tshirt/ROYAL-BLUE1.jpg",
    "assets/tshirt/ROYAL-BLUE2.jpg",
    "assets/tshirt/ROYAL-BLUE3.jpg"
  ];
  List<String> image2 = [
    "assets/tshirt/MILITARY-GREEn1.jpg",
    "assets/tshirt/MILITARY-GREEN2.jpg",
    "assets/tshirt/MILITARY-GREEN3.jpg"
  ];
  List<String> image3 = [
    "assets/tshirt/WHITE1.jpg",
    "assets/tshirt/WHITE2.jpg",
    "assets/tshirt/WHITE3.jpg"
  ];
  List<String> image4 = [
    "assets/tshirt/RED1.jpg",
    "assets/tshirt/RED1.jpg",
    "assets/tshirt/RED1.jpg"
  ];
  List<String> image5 = [
    "assets/tshirt/BLACK1.jpg",
    "assets/tshirt/BLACK2.jpg",
    "assets/tshirt/BLACK3.jpg"
  ];

  final List<Sachen> infoBank = [
    Sachen(
      0xffb4169e1,
      "Royal \n Blue",
    ),
    Sachen(
      0xffb4B5320,
      "Military \n Green",
    ),
    Sachen(
      0xffbFFFFFF,
      "White",
    ),
    Sachen(
      0xffbFF0000,
      "Red",
    ),
    Sachen(
      0xffb000000,
      "Black",
    ),
    // Sachen(0xffbB68C2A, "yellow",),
    // Sachen(0xffbB02AB6, "pink",),
    // Sachen(0xffb2AB6AB, "sunflower",),
    // Sachen(0xffbA7B62A, "Tangerine",),
    // Sachen(0xffbB68C2A, "Orange",),
    // Sachen(0xffbB02AB6, "Grey \n Melange",),
    // Sachen(0xffb2AB6AB, "Chestnut",),
    // Sachen(0xffbA7B62A, "Mulberry",),
    // Sachen(0xffbB68C2A, "Cocoa",),
    // Sachen(0xffbB02AB6, "Turquoise \n  Blue",),
  ];
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    index1 = 0;
    // TODO: implement initState
    super.initState();
  }

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
            "Product Details",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(3.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          items: ((index1 == 0)
                                  ? image1
                                  : (index1 == 1)
                                      ? image2
                                      : (index1 == 2)
                                          ? image3
                                          : (index1 == 3)
                                              ? image4
                                              : image5)
                              .map((item) {
                            return Container(
                              height: 30.h,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                            height: 30.h,
                            enlargeCenterPage: false,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: false,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 500),
                            viewportFraction: 1,
                          ),
                        ),
                        Positioned(
                          top: 27.h,
                          left: 40.w,
                          child: AnimatedSmoothIndicator(
                            activeIndex: _current,
                            count: ((index1 == 0)
                                    ? image1
                                    : (index1 == 1)
                                        ? image2
                                        : (index1 == 2)
                                            ? image3
                                            : (index1 == 3)
                                                ? image4
                                                : image5)
                                .length,
                            effect: ScrollingDotsEffect(
                                spacing: 8.0,
                                radius: 3.0,
                                dotWidth: 8.0,
                                dotHeight: 8.0,
                                paintStyle: PaintingStyle.stroke,
                                strokeWidth: 1.5,
                                dotColor: Colors.grey,
                                activeDotColor: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text("Ruffty DTG Round Neck T-shirt",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                        (index1 == 0)
                            ? "Colors: Royal Blue"
                            : (index1 == 1)
                                ? "Colors: Military Green"
                                : (index1 == 2)
                                    ? "Colors: White"
                                    : (index1 == 3)
                                        ? "Colors: Red"
                                        : "Colors : Black",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 14.h,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: infoBank.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      index1 = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      Container(
                                        height: 10.w,
                                        width: 10.w,
                                        color:
                                            Color(infoBank[index].title as int),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Center(
                                          child: Text(
                                        infoBank[index].name,
                                        style: textStyle,
                                      )),
                                    ]),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text("Product Specifications:",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp)),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Approximately – 180 GSM (5.9 ounces)"),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("100% Ring-spun Cotton (Melange colours \n"
                            " contain a % of polyester)"),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Bio-wash Fabric"),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Compacted Pre-shrunk",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Double needle stitch on the sleeves and bottom \n hem",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Color fastness Guaranteed"),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("ONLY SIZE LABEL"),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Available Sizes Small to 3XL"),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _select = !_select;
                        });
                        showImageViewer(
                            context,
                            Image.asset(
                              "assets/detail.jpg",
                              height: 60.h,
                              width: 60.w,
                            ).image,
                            swipeDismissible: true);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu_sharp,
                            color: (_select)
                                ? Colors.orange.shade900
                                : Colors.black,
                            size: 22.sp,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Size Chart",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: (_select)
                                    ? Colors.orange.shade900
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text("Choose Category :",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              select1 = !select1;
                              select2 = false;
                            });
                          },
                          child: Container(
                            width: 30.w,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color:
                                  (select1) ? Color(0xffb202A45) : Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                "Men",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: (select1)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              select2 = !select2;
                              select1 = false;
                            });
                          },
                          child: Container(
                            width: 30.w,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color:
                                  (select2) ? Color(0xffb202A45) : Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text("Women",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: (select2)
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    fontFamily: "Poppins",
  );
}
