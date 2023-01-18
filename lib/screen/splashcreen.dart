import 'dart:async';


import 'package:catalogs/screen/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/sharedPref.dart';
import 'category.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    checkLogin();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/logo.png'),
                width: 85.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Catalogs',
                style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Check Diffrent Varieties Of Clothes ',
                style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin() async {
    bool? status = await getisloginSHP();
    if (status == true) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => category(),
            )),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Loginpage(),
            )),
      );
    }
  }
}
