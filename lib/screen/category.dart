import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalogs/screen/subcategorycollar.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/drawer.dart';

class category extends StatefulWidget {
  category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class Sachen {
  String title;
  String image;
  Sachen(this.title, this.image);
}

class _categoryState extends State<category> {
  List<String> images = [
    "assets/slider/slider1.jpg",
    "assets/slider/slider2.jpg",
    "assets/slider/slider3.jpg",
    "assets/slider/slider4.jpg",
    "assets/slider/slider5.jpg",
  ];
  final List<Sachen> infoBank = [
    Sachen(
      "Collar T-Shirt",
      "assets/main/tshirt1.jpg",
    ),
    Sachen(
      "T-Shirts",
      "assets/main/tshirt2.jpg",
    ),
    Sachen(
      "Sportwear",
      "assets/main/Tshirt3.jpg",
    ),
    Sachen(
      "Sweatshirts",
      "assets/main/Tshirt4.jpg",
    ),
    Sachen(
      "Shirts",
      "assets/main/tshirt5.jpg",
    ),
    Sachen(
      "Jackets",
      "assets/main/tshirt6.jpg",
    ),
    Sachen(
      "Workwear",
      "assets/main/tshirt7.jpg",
    ),
  ];
  int _current = 0;
  int index1 = 0;
  @override
  void initState() {
    index1 = 0;
    _current = 0;
    // TODO: implement initState
    super.initState();
  }

  final CarouselController _controller = CarouselController();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldState,
        endDrawer: drawer1(context),
        endDrawerEnableOpenDragGesture: true,
        // drawerScrimColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Category",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: _controller,
                    items: images.map((e) {
                      return Container(
                        height: 30.h,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                          // print(_current);
                        });
                      },
                      height: 30.h,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1.0,
                    ),
                  ),
                  Positioned(
                    top: 27.h,
                    left: 40.w,
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _current,
                        count: images.length,
                        effect: ScrollingDotsEffect(
                            spacing: 8.0,
                            radius: 3.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            paintStyle: PaintingStyle.stroke,
                            strokeWidth: 1.5,
                            dotColor: Colors.white,
                            activeDotColor: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 3.0,
                    // crossAxisSpacing: 3.0,
                    crossAxisCount: 2),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemCount: infoBank.length,
                itemBuilder: (context, index2) {
                  return Container(
                    height: 20.h,
                    width: 20.h,
                    child: GestureDetector(
                      onTap: () async {
                        print("object");
                        setState(() {
                          index1 = index2;
                          print(index1);
                        });
                        if (index1 == 0) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
                        if (index1 == 1) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
                        if (index1 == 2) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
                        if (index1 == 3) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
                        if (index1 == 4) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
                        if (index1 == 5) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
                        if (index1 == 6) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => subcategory()));
                        }
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
                                      infoBank[index2].image,
                                      height: 20.h,
                                      width: 20.h,
                                    )),
                                Positioned(
                                  top: 13.h,
                                  left: 0.5.h,
                                  child: Container(
                                    width: 19.1.h,
                                    height: 5.h,
                                    alignment: Alignment.center,
                                    color: Colors.black26,
                                    child: Text(
                                      infoBank[index2].title,
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
            ],
          ),
        ),
      ),
    );
  }
}
