import 'dart:convert';

import 'package:catalogs/modal/cartmodal.dart';
import 'package:catalogs/screen/checkoutPage.dart';
import 'package:catalogs/screen/detailsPage.dart';
import 'package:catalogs/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sizer/sizer.dart';
import '../modal/errmodal.dart';
import '../provider/authprovider.dart';

class Cartpage extends StatefulWidget {
  String? colorname;
  String? size;
  int? qty;
  String? name;
  String? apId;
  String? apdId;

  Cartpage(
      {Key? key,
      this.colorname,
      this.size,
      this.qty,
      this.name,
      this.apdId,
      this.apId})
      : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

String img =
    'https://5.imimg.com/data5/LG/AM/OW/SELLER-31619481/plain-t-shirt-500x500.jpeg';

class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchcartapi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "My Cart",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: Colors.black),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Products',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart?.cartProducts?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          height: 23.h,
                          decoration: BoxDecoration(
                            color: Color(0xffe3e3e3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.close),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 1.3.w),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      img,
                                      height: 12.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Name :' +
                                              ' ' +
                                              cart!
                                                  .cartProducts![index].prodName
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Color :' +
                                              ' ' +
                                              cart!.cartProducts![index]
                                                  .apColorName
                                                  .toString(),
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Size :' +
                                              ' ' +
                                              cart!
                                                  .cartProducts![index].prodSize
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        // Text(
                                        //   'Qunatity :' + ' ' + widget.qty!.toString(),
                                        //   style: TextStyle(
                                        //       fontWeight: FontWeight.w600,
                                        //       fontFamily: "Poppins",
                                        //       color: Colors.black),
                                        // ),
                                        Row(
                                          children: [
                                            Text(
                                              'Qty :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 3.w),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (cart!.cartProducts![index]
                                                          .cartQuantity! <=
                                                      cart!.cartProducts![index]
                                                          .maxQuantity!) {
                                                    cart!.cartProducts![index]
                                                        .cartQuantity = cart!
                                                            .cartProducts![
                                                                index]
                                                            .cartQuantity! +
                                                        1;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xfff66a4b),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3.w),
                                            Text(
                                              cart!.cartProducts![index]
                                                  .cartQuantity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 3.w),
                                            InkWell(
                                              onTap: () {
                                                // setState(() {
                                                //   if (widget.qty! != 0) {
                                                //     widget.qty = widget.qty! - 1;
                                                //   }
                                                // });
                                                setState(() {
                                                  if (cart!.cartProducts![index]
                                                          .cartQuantity! !=
                                                      1) {
                                                    cart!.cartProducts![index]
                                                        .cartQuantity = cart!
                                                            .cartProducts![
                                                                index]
                                                            .cartQuantity! -
                                                        1;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xfff66a4b),
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        // Padding(
                                        //   padding:  EdgeInsets.only(right: 10),
                                        //   child: Align(
                                        //     alignment: Alignment.centerRight,
                                        //     child: InkWell(
                                        //       child: Container(alignment: Alignment.center,
                                        //         width: MediaQuery.of(context)
                                        //             .size
                                        //             .width *
                                        //             0.21,
                                        //         height: MediaQuery.of(context)
                                        //             .size
                                        //             .height *
                                        //             0.04,
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //           BorderRadius.circular(10),
                                        //           color: Color(0xfff66a4b),
                                        //         ),
                                        //         child: Text(
                                        //           'Remove',
                                        //           style: TextStyle(
                                        //             fontSize: 4.w,
                                        //             fontWeight: FontWeight.w600,
                                        //             fontFamily: "Poppins",
                                        //             color: Colors.white,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff66a4b),
                          ),
                          child: Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                size: widget.size,
                                colorname: widget.colorname,
                                name: widget.name,
                                qty: widget.qty,
                                img: img),
                          ),
                        );
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff66a4b),
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.7.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  fetchcartapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Map<String, String> data = {};

    data['d_id'] = _sharedpreferences.getString('Did').toString();

    data['action'] = 'cart_products';

    print(data);

    checkInternet().then(
      (internet) async {
        if (internet) {
          Authprovider().block(data).then(
            (Response response) async {
              print(response.statusCode);
              cart = CartModal.fromJson(json.decode(response.body));

              if (response.statusCode == 200 && cart!.status == 'success') {
                print('Fetched');

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
    data['ap_id'] = widget.apId.toString();
    data['apd_id'] = widget.apdId.toString();
    data['product_size'] = widget.size.toString() + '_block';
    data['block_quantity'] = widget.qty.toString();

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
}
