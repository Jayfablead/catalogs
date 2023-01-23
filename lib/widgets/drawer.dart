
import 'package:catalogs/screen/cartsystem.dart';
import 'package:catalogs/screen/subcategoryshirt.dart';
import 'package:catalogs/screen/subcategoryswertshirt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screen/Loginpage.dart';
import '../screen/profilestatic.dart';
import '../screen/subcategorycollar.dart';
import '../screen/subcategoryjacket.dart';
import '../screen/subcategorysportwear.dart';
import '../screen/subcategorytshirt.dart';
import '../screen/subcategoryworkwear.dart';
import '../utils/sharedPref.dart';

class drawer1 extends StatefulWidget {
  final BuildContext context;
  const drawer1(this.context, {Key? key}) : super(key: key);
  @override
  State<drawer1> createState() => _drawer1State();
}

class _drawer1State extends State<drawer1> {
  bool str = false;
  List<bool> data = [false, false, false, false, false, false, false];
  @override
  void initState() {
    str = false;
    data = [false, false, false, false, false, false, false];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width * 0.75;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(2.w),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close)),
                Container(
                  height: 100.0,
                  width: 0.80 * widthDrawer,
                  color: Colors.white,
                  child: Image.asset("assets/logo.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => profilestatic()));
                },
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                      color: (!data[0]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[0] = !data[0];
                  });
                  print(data[0]);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => subcategory()));
                },
                child: Text(
                  "COLLAR T-SHIRT",
                  style: TextStyle(
                      color: (!data[0]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[1] = !data[1];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => subcategorytshirt()));
                },
                child: Text(
                  "T-SHIRT",
                  style: TextStyle(
                      color: (!data[1]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
              )),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[2] = !data[2];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => subcategoryswertshirt()));
                },
                child: Text(
                  "SWEATSHIRT",
                  style: TextStyle(
                      color: (!data[2]) ? Colors.black : Colors.orange,
                      fontFamily: "Poppins",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[3] = !data[3];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => subcategorysportwear()));
                },
                child: Text(
                  "SPORTWEAR",
                  style: TextStyle(
                      color: (!data[3]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[4] = !data[4];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => subcategoryjacket()));
                },
                child: Text(
                  "JACKET",
                  style: TextStyle(
                      color: (!data[4]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[5] = !data[5];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => subcategoryshirt()));
                },
                child: Text(
                  "SHIRTS",
                  style: TextStyle(
                      color: (!data[5]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[6] = !data[6];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => subcategoryworkwear()));
                },
                child: Text(
                  "WORKWEAR",
                  style: TextStyle(
                      color: (!data[6]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    data[6] = !data[6];
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Cartpage()));
                },
                child: Text(
                  "My Cart",
                  style: TextStyle(
                      color: (!data[6]) ? Colors.black : Colors.orange,
                      fontSize: 10.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                )),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  cleanSHP();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Loginpage()));
                },
                child: Row(
                  children: [
                    Icon(Icons.logout_rounded),
                    Text(
                      "LOGOUT",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
