import 'dart:convert';

import 'package:catalogs/modal/usermodal.dart';
import 'package:catalogs/provider/authprovider.dart';
import 'package:catalogs/provider/updateprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../utils/const.dart';
import '../utils/sharedPref.dart';
import 'category.dart';

class profilestatic extends StatefulWidget {
  const profilestatic({super.key});

  @override
  State<profilestatic> createState() => _profilestaticState();
}

class _profilestaticState extends State<profilestatic> {
  String select = "Male";
  String gender = "Male";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _add = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print("hiii");
      profileapi();
    });
    getdata();
  }

  getdata() {
    _fname.text = '${userData?.logindata?.fname.toString()} ';
    _lname.text = '${userData?.logindata?.lname.toString()} ';
    _email.text = '${userData?.logindata?.emailId.toString()} ';
    _phone.text = '${userData?.logindata?.mobileNo.toString()} ';
    _add.text = '${userData?.logindata?.address.toString()} ';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Positioned(
              top: 0.h,
              left: 0.w,
              right: 0.w,
              child: Stack(children: [
                Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(color: Color(0xffb4776e6)
                      // gradient: new LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors: [
                      //   Color(0xff1a54ac),
                      //   Color.fromARGB(255, 66, 125, 214),
                      //
                      //   //  Color(0xFF1976D2),
                      //   // Color(0xFF42A5F5),
                      // ])
                      ),
                ),
                Positioned(
                    top: 1.h,
                    left: 0.w,
                    right: 0.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
                Positioned(
                    top: 12.h,
                    left: 10.w,
                    right: 10.w,
                    child: Container(
                        height: 35.w,
                        width: 35.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://wallpapercave.com/wp/wp4585578.jpg",
                                ),
                                fit: BoxFit.cover)))),
                Positioned(
                    top: 22.h,
                    left: 35.w,
                    right: 5.w,
                    child: Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ]),
            ),
            Positioned(
                top: 35.h,
                left: 0.w,
                right: 0.w,
                bottom: 0.h,
                child: SingleChildScrollView(
                  child: Container(
                    height: 60.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        color: Colors.white),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: textStyle,
                              ),
                              TextFormField(
                                  controller: _fname,
                                  keyboardType: TextInputType.text,
                                  // validator: (val) {
                                  //   if (val!.isEmpty) {
                                  //     return "Enter the Name";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: inputDecoration(
                                      // icon: Icon(Icons.person)
                                      hintText: "First Name")),
                              SizedBox(height: 1.h),
                              Text(
                                "Last Name",
                                style: textStyle,
                              ),
                              TextFormField(
                                  controller: _lname,
                                  keyboardType: TextInputType.text,
                                  // validator: (val) {
                                  //   if (val!.isEmpty) {
                                  //     return "Enter the Name";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: inputDecoration(
                                      // icon: Icon(Icons.person)
                                      hintText: "Last Name")),
                              SizedBox(height: 1.h),
                              Text(
                                "Email Address",
                                style: textStyle,
                              ),
                              TextFormField(
                                  controller: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  // validator: (value) {
                                  //   String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                                  //       "\\@" +
                                  //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                                  //       "(" +
                                  //       "\\." +
                                  //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                                  //       ")+";
                                  //   //Convert string p to a RegEx
                                  //   RegExp regExp = RegExp(p);
                                  //   if (value!.isEmpty) {
                                  //     return 'Please enter Your Email';
                                  //   } else {
                                  //     //If email address matches pattern
                                  //     if (regExp.hasMatch(value)) {
                                  //       return null;
                                  //     } else {
                                  //       //If it doesn't match
                                  //       return 'Email is not valid';
                                  //     }
                                  //   }
                                  // },
                                  decoration: inputDecoration(
                                      // icon: Icon(Icons.email_outlined),
                                      hintText: "Email")),
                              SizedBox(
                                height: 1.h,
                              ),

                              Text(
                                "Phone",
                                style: textStyle,
                              ),
                              TextFormField(
                                controller: _phone,
                                decoration: inputDecoration(
                                  hintText: "Mobile Number",
                                ),
                                // validator: (value) {
                                //   if (value?.number.length != 10) {
                                //     return "Enter 10 digit Mobile Number";
                                //   } else if (value!.number.isEmpty) {
                                //     return "Enter the  Mobile Number";
                                //   }
                                //   return null;
                                // },
                                // initialCountryCode: 'IN',
                                // showDropdownIcon: true,
                                // dropdownIconPosition: IconPosition.trailing,
                                // onChanged: (phone) {
                                //   print(phone.completeNumber);
                                // },
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Address",
                                style: textStyle,
                              ),
                              TextFormField(
                                controller: _add,
                                decoration: inputDecoration(
                                  hintText: "Address",
                                ),
                                // validator: (value) {
                                //   if (value?.number.length != 10) {
                                //     return "Enter 10 digit Mobile Number";
                                //   } else if (value!.number.isEmpty) {
                                //     return "Enter the  Mobile Number";
                                //   }
                                //   return null;
                                // },
                                // initialCountryCode: 'IN',
                                // showDropdownIcon: true,
                                // dropdownIconPosition: IconPosition.trailing,
                                // onChanged: (phone) {
                                //   print(phone.completeNumber);
                                // },
                              ),
                              SizedBox(
                                height: 1.h,
                              ),

                              // Container(
                              //   child: DropdownButtonFormField<String>(
                              //     value: select,
                              //     decoration: InputDecoration(
                              //         focusedBorder: UnderlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey.shade200),
                              //         ),
                              //         enabledBorder: UnderlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey.shade200),
                              //         )),
                              //     onChanged: (salutation) =>
                              //         setState(() => select = salutation!),
                              //     validator: (value) =>
                              //         value == null ? 'field required' : null,
                              //     items: [
                              //       'Male',
                              //       'Female',
                              //       'Other'
                              //     ].map<DropdownMenuItem<String>>((String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(value),
                              //       );
                              //     }).toList(),
                              //   ),
                              // )
                              SizedBox(
                                height: 2.h,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    onPressed: () {
                                      print('done');
                                      // editprofileapi();
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(fontSize: 5.w),
                                    )),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ))
          ],
        )),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 12.sp,
      color: Colors.grey,
      fontWeight: FontWeight.w400);
  TextStyle textStyle1 = TextStyle(
      fontFamily: "Poppins",
      fontSize: 10.sp,
      color: Colors.grey,
      fontWeight: FontWeight.bold);
  InputDecoration inputDecoration({
    required String hintText,
  }) {
    return InputDecoration(
      // prefixIcon: icon,

      // fillColor: Colors.white,
      // hoverColor: Colors.white,
      // focusColor: Colors.white,
      // filled: true,
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      hintText: hintText,
      hintStyle: textStyle1,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
    );
  }

  editdata() {}
  profileapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['d_id'] = _sharedpreferences.getString('Did').toString();

      data['action'] = 'fetch_distributor_data';
      checkInternet().then((internet) async {
        if (internet) {
          Authprovider().profile(data).then((Response response) async {
            print(response.statusCode);
            userData = usermodal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && userData!.status == "success") {
              if (kDebugMode) {}
            } else {}
          });
        } else {
          setState(() {});
        }
      });
    }
  }

  editprofileapi() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    // Future<String?> shpid = getuid();
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['d_id'] = _sharedpreferences.getString('Did').toString();
      data['fname'] = _fname.text.trim().toString();
      data['lname'] = _lname.text.trim().toString();
      data['mobile_no'] = _phone.text.trim().toString();
      data['address'] = _add.text.trim().toString();
      data['email_id'] = _email.text.trim().toString();
      // print(shpid);

      data['action'] = 'update_distributor_data';
      checkInternet().then((internet) async {
        if (internet) {
          Authprovider().editproapi(data).then((Response response) async {
            print(response.statusCode);
            newData = updateddata.fromJson(json.decode(response.body));
            print('hello');
            print('===================${newData?.status}==========');
            if (response.statusCode == 200 && newData!.status == "success") {
              setState(() async {
                // _fname.text = newData!.updated!.fname.toString();
                // _lname.text = newData!.updated!.lname.toString();
                // _phone.text = newData!.updated!.mobileNo.toString();
                // _add.text = newData!.updated!.address.toString();
                // _email.text = newData!.updated!.emailId.toString();

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => category()));
                // print(
                //     "=========================================${userData?.distrubutorData?.dId}===================================");

                // Fluttertoast.showToast(
                //   msg: "Logged In Successfully",
                //   textColor: Colors.white,
                //   toastLength: Toast.LENGTH_SHORT,
                //   timeInSecForIosWeb: 1,
                //   gravity: ToastGravity.BOTTOM,
                //   backgroundColor: Colors.indigo,
                // );
              });
              if (kDebugMode) {}
            } else {
              Fluttertoast.showToast(
                msg: "Email or Password Invalid",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.indigo,
              );
            }
          });
        } else {
          setState(() {});
        }
      });
    }
  }
}
