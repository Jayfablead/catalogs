import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalogs/modal/Colorsdata.dart';
import 'package:catalogs/modal/errmodal.dart';
import 'package:catalogs/screen/cartsystem.dart';
import 'package:catalogs/widgets/spink.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';
import '../provider/authprovider.dart';
import '../utils/const.dart';
import '../widgets/drawer.dart';

class productdetail1 extends StatefulWidget {
  final String? indew;
  final String? pname;

  productdetail1({Key? key, this.indew, this.pname}) : super(key: key);

  @override
  State<productdetail1> createState() => _productdetail1State();
}

class Sachen {
  int title;
  String name;

  Sachen(this.title, this.name);
}

class _productdetail1State extends State<productdetail1> {
  int index1 = 0;
  int index2 = 0;
  String? siz;
  bool emty = true;
  bool checkblock = true;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  bool _select = false;
  TextEditingController _qty = TextEditingController();
  int _current = 0;
  int _current1 = 0;
  bool cur1 = true;
  bool cur2 = true;

  String size = "Xs";
  List<String> image1 = [
    "assets/colarr/pro1.jpg",
    "assets/colarr/pro2.jpg",
    "assets/colarr/pro3.jpg"
  ];
  List<String> image2 = [
    "assets/colarr/Lemon1.jpg",
    "assets/colarr/Lemon2.jpg",
    "assets/colarr/Lemon3.jpg"
  ];
  List<String> image3 = ["assets/colarr/White1.jpg"];
  List<String> image4 = [
    "assets/colarr/Red1.jpg",
    "assets/colarr/Red1.jpg",
    "assets/colarr/Red1.jpg"
  ];
  List<String> image5 = [
    "assets/colarr/Black1.jpg",
    "assets/colarr/Black2.jpg",
    "assets/colarr/Black3.jpg"
  ];

  final List<Sachen> infoBank = [
    Sachen(
      0xffbFFFDD0,
      "Cream",
    ),
    Sachen(
      0xffbFAFA33,
      "Lemon",
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
  ];

  // List of items in our dropdown menu
  var items = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXl',
    '3XL',
    '4XL',
    '5XL',
  ];
  List<bool> current = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  // tf = List.generate(someList.length, (index)=>false);

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    select1 = true;
    select2 = false;
    setState(() {
      clrnameapi();
      userapi();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: commanScreen(
        isLoading: false,
        scaffold: Scaffold(
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
          body: Form(
            key: _formKey1,
            child: SafeArea(
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
                                .map(
                              (item) {
                                return Container(
                                  height: 30.h,
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.fitHeight,
                                  ),
                                );
                              },
                            ).toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              height: 31.h,
                              enlargeCenterPage: false,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: false,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 50),
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
                      Text(widget.pname.toString(),
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp)),
                      SizedBox(
                        height: 2.h,
                      ),

                      // ======================== Colors Data ======================

                      Text(
                        "Colors : " + "  " + clrdata!.coloursdata![index1],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 7.5.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: clrdata?.coloursdata?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            index1 = index;
                                            cur1 = !cur1;
                                          },
                                        );
                                        _qty.clear();
                                        index2 = 0;
                                        checkblock = true;
                                        userapi();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          alignment: Alignment.center,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: index1 == index
                                                ? Color.fromARGB(
                                                    55, 248, 139, 139)
                                                : Color(0xffffffff),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 2,
                                                color: index1 == index
                                                    ? Color.fromARGB(
                                                        255, 243, 33, 33)
                                                    : Colors.transparent),
                                          ),
                                          child: Text(
                                            clrdata!.coloursdata![index],
                                            style: textStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

                      //================ Size Data ===============

                      Text(
                          (index2 == 0)
                              ? "Size :  XS"
                              : (index2 == 1)
                                  ? "Size :  S"
                                  : (index2 == 2)
                                      ? "Size :  M"
                                      : (index2 == 3)
                                          ? "Size :  L"
                                          : (index2 == 4)
                                              ? "Size :  XL"
                                              : (index2 == 5)
                                                  ? "Size :  XXL"
                                                  : (index2 == 6)
                                                      ? "Size :  3XL"
                                                      : (index2 == 7)
                                                          ? "Size :  4XL"
                                                          : "Size :  5XL",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp)),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (items.length),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index2 = index;
                                        siz = items[index2];

                                        current[index2] = !current[index2];
                                        print("current" +
                                            current[index2].toString());

                                        checkblock = true;
                                        _qty.clear();
                                        cur2 = !cur2;
                                        userapi();
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Container(
                                        height: 11.w,
                                        width: 11.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          color: index2 == index
                                              ? Color.fromARGB(
                                                  55, 248, 139, 139)
                                              : Color(0xffffffff),
                                          border: Border.all(
                                              width: 2,
                                              color: index2 == index
                                                  ? Color.fromARGB(
                                                      255, 243, 33, 33)
                                                  : Colors.transparent),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${items[index]}',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),

                      // ======= stocks details ==========

                      Text(
                        (index2 == 0)
                            ? "Available Stock : " +
                                ' ' +
                                clrdata!.sizes![index1].xs!
                            : (index2 == 1)
                                ? "Available Stock : " +
                                    ' ' +
                                    clrdata!.sizes![index1].s!
                                : (index2 == 2)
                                    ? "Available Stock : " +
                                        ' ' +
                                        clrdata!.sizes![index1].m!
                                    : (index2 == 3)
                                        ? "Available Stock : " +
                                            ' ' +
                                            clrdata!.sizes![index1].l!
                                        : (index2 == 4)
                                            ? "Available Stock : " +
                                                ' ' +
                                                clrdata!.sizes![index1].xl!
                                            : (index2 == 5)
                                                ? "Available Stock : " +
                                                    ' ' +
                                                    clrdata!.sizes![index1].xxl!
                                                : (index2 == 6)
                                                    ? "Available Stock : " +
                                                        ' ' +
                                                        clrdata!.sizes![index1]
                                                            .s3xl!
                                                    : (index2 == 7)
                                                        ? "Available Stock : " +
                                                            ' ' +
                                                            clrdata!
                                                                .sizes![index1]
                                                                .s4xl!
                                                        : "Available Stock : " +
                                                            ' ' +
                                                            clrdata!
                                                                .sizes![index1]
                                                                .s5xl!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),

                      //========================= Button Row ============

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: Text('Quantity :',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp)),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.20,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              validator: (value) {
                                setState(
                                  () {
                                    emty = value!.isEmpty;
                                    print(value.isEmpty);
                                  },
                                );

                                if (value!.isEmpty) {
                                  dialog1();
                                }
                                return null;
                              },
                              controller: _qty,
                              cursorColor: Colors.black54,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                hintText: 'Qty',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(16),
                                fillColor: Color.fromARGB(40, 250, 114, 104),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          checkblock
                              ? InkWell(
                                  onTap: () {
                                    if (_formKey1.currentState!.validate()) {
                                      print(emty);
                                    }
                                    if (index2 == -1) {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Ok',
                                                style: TextStyle(
                                                    color: Color(0xffe16e6e)),
                                              ),
                                            ),
                                          ],
                                          title: Text("Please Select Size"),
                                        ),
                                      );
                                    } else {
                                      blockapi();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xfff65b5b),
                                    ),
                                    child: Icon(
                                      Icons.block,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    if (_formKey1.currentState!.validate()) {
                                      print(emty);
                                    }
                                    print(emty);

                                    unblockapi();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xfff65b5b),
                                      ),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        color: Colors.white,
                                      )),
                                ),
                          InkWell(
                            onTap: () {
                              if (_qty.text.isEmpty) {
                                dialog2();
                              } else {
                                clrdata!.sizes![index2].toString();
                                blockapi1();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xfff66a4b),
                              ),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    fontFamily: "Poppins",
  );

  clrnameapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, dynamic> data = {};
    data['action'] = 'single_product';
    data['d_id'] = _sharedpreferences.getString('Did').toString();
    data['ap_id'] = widget.indew.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Authprovider().clrs(data).then((Response response) async {
          print(response.statusCode);
          print(response.body);
          // clrdata = colorsdata.fromJson(json.decode(response.body));
          clrdata = colorsdata.fromJson(jsonDecode(response.body));

          if (response.statusCode == 200) {
            print(clrdata!.sizes![index1].xs![index2].toString());

            if (kDebugMode) {}
          } else {
            CircularProgressIndicator();
          }
        });
      } else {
        setState(() {});
      }
    });
  }

  userapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, dynamic> data = {};
    data['action'] = 'fetch_block_quantity';
    data['d_id'] = _sharedpreferences.getString('Did').toString();
    data['ap_id'] = widget.indew.toString();
    data['apd_id'] = (clrdata?.apdId?[index1]).toString();
    print((clrdata?.apdId?[index1]).toString());
    checkInternet().then((internet) async {
      if (internet) {
        Authprovider().user(data).then((Response response) async {
          print(response.statusCode);
          print(response.body);
          // clrdata = colorsdata.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            print(usernew?.blockedSize?[0]);

            if (kDebugMode) {}
          } else {
            CircularProgressIndicator();
          }
        });
      } else {
        setState(() {});
      }
    });
  }

  blockapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, String> data = {};

    data['d_id'] = _sharedpreferences.getString('Did').toString();
    data['ap_id'] = widget.indew.toString();
    data['apd_id'] = (clrdata?.apdId?[index1]).toString();
    data['product_size'] = items[index2].toLowerCase() + '_block';
    data['block_quantity'] = _qty.text.trim().toString();

    data['action'] = 'block_product';

    print(data);

    checkInternet().then(
      (internet) async {
        if (internet) {
          Authprovider().block(data).then(
            (Response response) async {
              print(response.statusCode);
              eror = Datamodal.fromJson(json.decode(response.body));

              if (response.statusCode == 200 && eror!.status == 'success') {
                print('Blocked');
                checkblock = !checkblock;
                Fluttertoast.showToast(
                  msg: "Product Blocked Successfully",
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.indigo,
                );
                if (kDebugMode) {}
              } else {
                dialog();
              }
            },
          );
        } else {
          setState(() {});
        }
      },
    );
  }

  blockapi1() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, String> data = {};

    data['d_id'] = _sharedpreferences.getString('Did').toString();
    data['ap_id'] = widget.indew.toString();
    data['apd_id'] = (clrdata?.apdId?[index1]).toString();
    data['product_size'] = items[index2].toLowerCase() + '_block';
    data['block_quantity'] = _qty.text.trim().toString();

    data['action'] = 'block_product';

    print(data);

    checkInternet().then(
      (internet) async {
        if (internet) {
          Authprovider().block(data).then(
            (Response response) async {
              print(response.statusCode);
              eror = Datamodal.fromJson(json.decode(response.body));

              if (response.statusCode == 200 && eror!.status == 'success') {
                print('Blocked');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cartpage(
                      colorname: (clrdata?.coloursdata?[index1]).toString(),
                      qty: int.parse(_qty.text),
                      size: siz,
                      name: widget.pname,
                      apdId: (clrdata?.apdId?[index1]).toString(),
                      apId: widget.indew.toString(),
                    ),
                  ),
                );

                if (kDebugMode) {}
              } else {
                dialog();
              }
            },
          );
        } else {
          setState(() {});
        }
      },
    );
  }

  unblockapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, String> data = {};

    data['d_id'] = _sharedpreferences.getString('Did').toString();
    data['ap_id'] = widget.indew.toString();
    data['apd_id'] = (clrdata?.apdId?[index1]).toString();
    data['product_size'] = items[index2].toLowerCase() + '_block';
    data['block_quantity'] = _qty.text.trim().toString();

    data['action'] = 'unblock_product';

    print(data);

    checkInternet().then(
      (internet) async {
        if (internet) {
          Authprovider().unblock(data).then((Response response) async {
            print(response.statusCode);
            // userData = usermodal.fromJson(json.decode(response.body));

            if (response.statusCode == 200) {
              print('Unblocked');
              checkblock = !checkblock;

              Fluttertoast.showToast(
                msg: "Product Unblocked Successfully",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.indigo,
              );
              if (kDebugMode) {}
            } else {}
          });
        } else {
          setState(() {});
        }
      },
    );
  }

  TextStyle textstyle = TextStyle(
      fontSize: 11.sp,
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins");

  dialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          // elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 18.0,
                  ),
                  // margin: EdgeInsets.only(top: 13.0,right: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Container(
                    width: 75.w,
                    height: 15.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/error.png',
                          height: 6.3.h,
                          width: 90.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Available Quantity : " +
                              " " +
                              eror!.quantity.toString(),
                          style: TextStyle(
                              color: Color(0xff181818),
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // top: 0.h,
                  // left: 75.w,
                  right: 0.0,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  dialog1() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          // elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 18.0,
                  ),
                  // margin: EdgeInsets.only(top: 13.0,right: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Container(
                    width: 75.w,
                    height: 15.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/error.png',
                          height: 6.3.h,
                          width: 90.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Enter Quantity To Block Product',
                          style: TextStyle(
                              color: Color(0xff181818),
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // top: 0.h,
                  // left: 75.w,
                  right: 0.0,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  dialog2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          // elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 18.0,
                  ),
                  // margin: EdgeInsets.only(top: 13.0,right: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Container(
                    width: 75.w,
                    height: 15.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/error.png',
                          height: 6.3.h,
                          width: 90.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'You Have to add Quantity to Add This Product to Cart',
                            style: TextStyle(
                                color: Color(0xff181818),
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // top: 0.h,
                  // left: 75.w,
                  right: 0.0,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// old data not to touch

// SizedBox(height: 1.h,),
// Text("Product Specifications:",
//     style: TextStyle(
//         color: Colors.black,
//         fontFamily: "Poppins",
//         fontWeight: FontWeight.bold,
//         fontSize: 12.sp)),
// SizedBox(
//   height: 1.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text("250 – 260 gsm"),
//   ],
// ),
// SizedBox(
//   height: 0.5.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text("100% combed ring-spun cotton"),
//   ],
// ),
// SizedBox(
//   height: 0.5.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text("Compacted Pre-shrunk"),
//   ],
// ),
// SizedBox(
//   height: 0.5.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text(
//       "Double needle stitch on the shoulder,sleeves and \n side slits  on the bottom hem",
//       overflow: TextOverflow.ellipsis,
//       maxLines: 3,
//     ),
//   ],
// ),
// SizedBox(
//   height: 0.5.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text(
//       "3 Button placket with dyed to match button and\n bottom box stitch",
//       overflow: TextOverflow.ellipsis,
//       maxLines: 3,
//     ),
//   ],
// ),
// SizedBox(
//   height: 0.5.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text("Soft flow dyed"),
//   ],
// ),
// SizedBox(
//   height: 0.5.h,
// ),
// Row(
//   children: [
//     Container(
//       height: 10.0,
//       width: 10.0,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle, color: Colors.black),
//     ),
//     SizedBox(
//       width: 20.0,
//     ),
//     Text("Color fastness Guaranteed"),
//   ],
// ),
// SizedBox(
//   height: 2.h,
// ),
// GestureDetector(
//   onTap: () async {
//     setState(() {
//       _select = !_select;
//     });
//     showImageViewer(
//         context,
//         Image.asset(
//           "assets/detail.jpg",
//           height: 60.h,
//           width: 60.w,
//         ).image,
//         swipeDismissible: true);
//   },
//   child: Row(
//     children: [
//       Icon(
//         Icons.menu_sharp,
//         color: (_select)
//             ? Colors.orange.shade400
//             : Colors.black,
//         size: 22.sp,
//       ),
//       SizedBox(
//         width: 10.0,
//       ),
//       Text(
//         "Size Chart",
//         style: TextStyle(
//             fontFamily: "Poppins",
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//             color: (_select)
//                 ? Colors.orange.shade400
//                 : Colors.black),
//       )
//     ],
//   ),
// ),
// SizedBox(
//   height: 2.h,
// ),
// Text("Choose Category :",
//     style: TextStyle(
//         color: Colors.black,
//         fontSize: 12.sp,
//         fontWeight: FontWeight.bold,
//         fontFamily: "Poppins")),
// SizedBox(
//   height: 2.h,
// ),
// Row(
//   children: [
//     GestureDetector(
//       onTap: () {
//         setState(() {
//           select1 = !select1;
//           select2 = false;
//         });
//       },
//       child: Container(
//         width: 30.w,
//         height: 40.0,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           color:
//               (select1) ? Color(0xffb202A45) : Colors.white,
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: Center(
//           child: Text(
//             "Men",
//             style: TextStyle(
//                 fontFamily: "Poppins",
//                 color: (select1)
//                     ? Colors.white
//                     : Colors.black),
//           ),
//         ),
//       ),
//     ),
//     SizedBox(width: 10.w),
//     GestureDetector(
//       onTap: () {
//         setState(() {
//           select2 = !select2;
//           select1 = false;
//         });
//       },
//       child: Container(
//         width: 30.w,
//         height: 40.0,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           color:
//               (select2) ? Color(0xffb202A45) : Colors.white,
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: Center(
//           child: Text("Women",
//               style: TextStyle(
//                   fontFamily: "Poppins",
//                   color: (select2)
//                       ? Colors.white
//                       : Colors.black)),
//         ),
//       ),
//     ),
//   ],
// ),
