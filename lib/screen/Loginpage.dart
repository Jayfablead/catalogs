import 'dart:convert';


import 'package:catalogs/modal/usermodal.dart';
import 'package:catalogs/provider/authprovider.dart';
import 'package:catalogs/screen/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../utils/const.dart';
import '../widgets/textfields.dart';
import 'Signuppage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _forgetpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldState,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // color: Colors.lightBlueAccent,

                  gradient: LinearGradient(
                    colors: [Color(0xffb0cb6e1), Color(0xffb26eca2)],
                    begin: Alignment(-1.0, -1),
                    end: Alignment(-1.0, 1),
                    // begin: Alignment(-1.0, -4.0),
                    // end: Alignment(1.0, 4.0),
                    transform: GradientRotation(0.7853982),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login_sharp,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            // padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28.sp,
                                  fontFamily: "Poppins"),
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
                            obtext: !_passwordVisible,
                            mycontroller: _email,
                            text: "Enter your Email",
                            type: TextInputType.emailAddress,
                            icon: Icon(Icons.email_outlined),
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
                      // child: textfields(
                      //   mycontroller: _password,
                      //   text: "Enter your Password",
                      //   type: TextInputType.text,
                      //   icon: Icon(Icons.lock),
                      //   hint: "Password",
                      // )),
                      SizedBox(height: 2.h),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Need Help?',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                              "Enter a Valid Email Address To Get Link To Reset Your Password"),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          backgroundColor:
                                              Color.fromARGB(250, 12, 218, 225),
                                          content: SizedBox(
                                            height: 17.h,
                                            child: Form(
                                              key: _formKey1,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w),
                                                      child: textfields(
                                                        mycontroller:
                                                            _forgetpassword,
                                                        text:
                                                            "Enter your Email",
                                                        type: TextInputType
                                                            .emailAddress,
                                                        icon: Icon(Icons
                                                            .email_outlined),
                                                        hint: "Email",
                                                      )),
                                                  TextButton(
                                                    onPressed: () {
                                                      forgetpwdapi();
                                                      print('send');
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 40.0,
                                                      width: size.width * 0.5,
                                                      decoration: new BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      80.0),
                                                          gradient:
                                                              new LinearGradient(
                                                                  colors: [
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    136,
                                                                    34),
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    177,
                                                                    41)
                                                              ])),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      child: Text(
                                                        "Send",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                              },
                              child: Text(
                                "Forgot password.",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: Color.fromARGB(255, 196, 128, 10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextButton(
                        onPressed: () {
                          loginApi();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.0,
                          width: size.width * 0.5,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: new LinearGradient(colors: [
                                Color.fromARGB(255, 255, 136, 34),
                                Color.fromARGB(255, 255, 177, 41)
                              ])),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "LOGIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
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
                                builder: (context) => Signuppage(),
                              ));
                            },
                            child: Text(
                              'Register Now',
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
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginApi() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['loginEmail'] = _email.text.trim().toString();
      data['loginPassword'] = _password.text.trim().toString();
      data['action'] = 'login';
      checkInternet().then((internet) async {
        if (internet) {
          Authprovider().loginapi(data).then((Response response) async {
            SharedPreferences _sharedpreferences =
                await SharedPreferences.getInstance();
            print(response.statusCode);
            userData = usermodal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && userData!.status == "success") {
              _sharedpreferences.setString(
                  'Did', '${userData?.logindata?.dId.toString()}');
              print('Did' + '${_sharedpreferences.getString('Did')}');
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => category(),
              )); // Fluttertoast.showToast(
              //   msg: "Logged In Successfully",
              //   textColor: Colors.white,
              //   toastLength: Toast.LENGTH_SHORT,
              //   timeInSecForIosWeb: 1,
              //   gravity: ToastGravity.BOTTOM,
              //   backgroundColor: Colors.indigo,
              // );
              isLoading = false;

              if (kDebugMode) {}

              _email.text = "";
              _password.text = "";
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

  forgetpwdapi() async {
    if (_formKey1.currentState!.validate()) {
      final Map<String, String> data = {};
      data['forgotEmail'] = _forgetpassword.text.trim().toString();
      data['action'] = 'forgot_password';
      checkInternet().then((internet) async {
        if (internet) {
          Authprovider().loginapi(data).then((Response response) async {
            print(response.statusCode);
            userData = usermodal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 &&
                userData!.status == "Check your mail!") {
              setState(() async {
                Fluttertoast.showToast(
                  msg: "Check Your MailBox",
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.indigo,
                );
                _forgetpassword.clear();
                Navigator.pop(context);
                isLoading = false;
              });
              if (kDebugMode) {}

              _forgetpassword.text = "";
            } else {
              Fluttertoast.showToast(
                msg: "Enter A Valid Email Address",
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
