import 'dart:math';

import 'package:catalogs/screen/checkoutPage.dart';
import 'package:catalogs/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailsPage extends StatefulWidget {
  String? colorname;
  String? size;
  int? qty;
  String? name;
  String? img;

  DetailsPage(
      {Key? key, this.size, this.img, this.qty, this.name, this.colorname})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

final TextEditingController _fname = TextEditingController();
final TextEditingController _phone = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _pincode = TextEditingController();
final TextEditingController _add = TextEditingController();
final TextEditingController _add1 = TextEditingController();
final TextEditingController _state = TextEditingController();
final TextEditingController _city = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool selectindex1 = true;
bool selectindex = false;
List list = ['1. Product Details', '2. Add Details'];

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    _fname.clear();
    _phone.clear();
    _email.clear();
    _pincode.clear();
    _add.clear();
    _add1.clear();
    _state.clear();
    _city.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectindex = !selectindex;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 6.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade600,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.pages_rounded,
                                    size: 3.h,
                                    color: Color(0xffb4776e6),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(list[0]),
                                ],
                              ),
                              (selectindex == true)
                                  ? Transform.rotate(
                                      angle: -90 * pi / 180,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 2.h,
                                      ),
                                    )
                                  : Transform.rotate(
                                      angle: 90 * pi / 180,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 2.h,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      (selectindex == false)
                          ? Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Product : ' +
                                                  ' ' +
                                                  widget.name.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Colour : ' +
                                                  ' ' +
                                                  widget.colorname.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Qty : ' +
                                                  ' ' +
                                                  widget.qty.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Size : ' +
                                                  ' ' +
                                                  widget.size.toString(),
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
                                    height: 2.h,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selectindex = true;
                                            selectindex1 = true;
                                          });
                                        },
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                              fontSize: 4.w,
                                              color: Colors.deepOrange),
                                        )),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectindex1 = !selectindex1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 6.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade600,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 3.h,
                                    color: Color(0xffb4776e6),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(list[1]),
                                ],
                              ),
                              (selectindex1 == false)
                                  ? Transform.rotate(
                                      angle: -90 * pi / 180,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 2.h,
                                      ),
                                    )
                                  : Transform.rotate(
                                      angle: 90 * pi / 180,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 2.h,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      (selectindex1 == true)
                          ? Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w),
                                                child: textfields(
                                                  type: TextInputType.text,
                                                  mycontroller: _fname,
                                                  hint: "Enter Name",
                                                  icon:
                                                      const Icon(Icons.person),
                                                  text: "Enter Your Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w),
                                                child: textfields(
                                                  type: TextInputType.phone,
                                                  mycontroller: _phone,
                                                  hint: "Phone number",
                                                  icon: const Icon(Icons.phone),
                                                  text:
                                                      "Enter Your phone number",
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w),
                                                  child: textfields(
                                                    mycontroller: _email,
                                                    text: "Enter Your Email",
                                                    type: TextInputType
                                                        .emailAddress,
                                                    icon: const Icon(
                                                        Icons.email_outlined),
                                                    hint: "Email",
                                                  )),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w),
                                                  child: textfields(
                                                    mycontroller: _add,
                                                    text: "Enter Your Address",
                                                    type: TextInputType.text,
                                                    icon: const Icon(Icons
                                                        .location_on_outlined),
                                                    hint: "Address",
                                                  )),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w),
                                                  child: textfields(
                                                    mycontroller: _add1,
                                                    text:
                                                        "Enter Your Address 1",
                                                    type: TextInputType.text,
                                                    icon: const Icon(Icons
                                                        .location_on_outlined),
                                                    hint: "Address 1",
                                                  )),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w),
                                                  child: textfields(
                                                    mycontroller: _pincode,
                                                    text: "Enter pincode",
                                                    type: TextInputType.number,
                                                    icon: const Icon(Icons
                                                        .pin_drop_outlined),
                                                    hint: "Pincode",
                                                  )),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.45,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w),
                                                      child: textfields(
                                                        mycontroller: _city,
                                                        text: "Enter City",
                                                        type:
                                                            TextInputType.text,
                                                        icon: const Icon(Icons
                                                            .location_city_outlined),
                                                        hint: "City",
                                                      )),
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.45,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w),
                                                      child: textfields(
                                                        mycontroller: _state,
                                                        text: "Enter State",
                                                        type:
                                                            TextInputType.text,
                                                        icon: const Icon(Icons
                                                            .reduce_capacity),
                                                        hint: "State",
                                                      )),
                                                ],
                                              )
                                            ],
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
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {}
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
                        'Submit',
                        style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
