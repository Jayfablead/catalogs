import 'dart:convert';

import 'package:catalogs/provider/authprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../modal/errmodal.dart';
import '../utils/const.dart';

class CheckoutPage extends StatefulWidget {
  String? colorname;
  String? size;
  int? qty;
  String? name;
  String? img;
  String? cname;
  String? add;
  String? mobile;
  String? email;
  String? city;
  String? pincode;

  CheckoutPage(
      {Key? key,
      this.colorname,
      this.email,
      this.name,
      this.qty,
      this.size,
      this.img,
      this.cname,
      this.add,
      this.mobile,
      this.city,
      this.pincode})
      : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Products : ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 5.w,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 15.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Image.network(
                        widget.img.toString(),
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Product Name : ' + ' ' + widget.name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          ),
                          Text(
                            'Colour : ' + ' ' + widget.colorname.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          ),
                          Text(
                            'Qty : ' + ' ' + widget.qty.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          ),
                          Text(
                            'Size : ' + ' ' + widget.size.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Personal Details : ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 5.w,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 19.h,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Customer Name : ' + ' ' + widget.cname.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                      Text(
                        'Email Address : ' + ' ' + widget.email.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                      Text(
                        'Phone : ' + ' ' + widget.mobile.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                      Text(
                        'Address : ' +
                            ' ' +
                            widget.add.toString() +
                            ',' +
                            widget.city.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                      Text(
                        'Pincode : ' + ' ' + widget.pincode.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Center(
                  child: InkWell(
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
                        'Submit',
                        style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
