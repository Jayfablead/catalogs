// ignore_for_file: unused_field, avoid_print

import 'dart:convert';
import 'package:catalogs/modal/usermodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../provider/authprovider.dart';
import '../utils/const.dart';
import '../widgets/textfields.dart';
import 'Loginpage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool select = false;
  bool isLoading = false;
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldState,
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffb0cb6e1), Color(0xffb26eca2)],
                    begin: Alignment(-1.0, -1),
                    end: Alignment(-1.0, 1),
                    transform: GradientRotation(0.7853982),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 30.sp,
                            color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28.sp),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: textfields(
                          type: TextInputType.text,
                          mycontroller: _fname,
                          hint: "First Name",
                          icon: const Icon(Icons.person),
                          text: "Enter your Firstname",
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: textfields(
                            mycontroller: _lname,
                            text: "Enter your Lastname",
                            type: TextInputType.emailAddress,
                            icon: const Icon(Icons.email_outlined),
                            hint: "Last Name",
                          )),
                      SizedBox(height: 2.h),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: textfields(
                          type: TextInputType.phone,
                          mycontroller: _phone,
                          hint: "Phone number",
                          icon: const Icon(Icons.phone),
                          text: "Enter the phone number",
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: textfields(
                            mycontroller: _email,
                            text: "Enter your Email",
                            type: TextInputType.emailAddress,
                            icon: const Icon(Icons.email_outlined),
                            hint: "Email",
                          )),
                      SizedBox(height: 2.h),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          keyboardType: TextInputType.text,
                          controller: _password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10.sp),
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.grey),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            signupApi();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40.0,
                            width: size.width * 0.5,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                gradient: new LinearGradient(colors: [
                                  const Color.fromARGB(255, 255, 136, 34),
                                  const Color.fromARGB(255, 255, 177, 41)
                                ])),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const Loginpage(),
                              ));
                            },
                            child: Text(
                              'Login Here',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color.fromARGB(255, 196, 128, 10),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signupApi() async {
    print("object");
    Map<String, String> data = <String, String>{};
    data["action"] = "signup";
    data["fname"] = _fname.text.trim().toString();
    data["lname"] = _lname.text.trim().toString();
    data["email_id"] = _email.text.trim().toString();
    data["password"] = _password.text.trim().toString();
    data["mobile_no"] = _phone.text.trim().toString();
    if (_formKey.currentState!.validate()) {
      checkInternet().then((internet) async {
        if (internet) {
          Authprovider().signupapi(data).then((Response response) async {
            userData = usermodal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && userData?.status == "success") {
              SharedPreferences _sharedpreferences =
                  await SharedPreferences.getInstance();
              _sharedpreferences.setString(
                  'username', _email.text.trim().toString());

              print(_sharedpreferences.getString('username'));
              Fluttertoast.showToast(
                msg: "User Registred Successfully",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.indigo,
              );

              print(userData!.status);
              isLoading = false;

              if (kDebugMode) {}
              _fname.text = "";
              _lname.text = "";
              _email.text = "";
              _password.text = "";
              _phone.text = "";
            } else {
              Fluttertoast.showToast(
                msg: "User Already Registred",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.indigo,
              );
              isLoading = false;
            }
          });
        } else {}
      });
    } else {}
  }
}
