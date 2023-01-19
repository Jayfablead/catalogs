import 'dart:convert';


import 'package:catalogs/modal/prodmodal.dart';
import 'package:catalogs/screen/productdetail1.dart';
import 'package:catalogs/widgets/spink.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../provider/authprovider.dart';
import '../utils/const.dart';
import '../widgets/drawer.dart';

class subcategory extends StatefulWidget {
  subcategory({
    Key? key,
  }) : super(key: key);

  @override
  State<subcategory> createState() => _subcategoryState();
}

class Sachen {
  String title;
  String image;

  Sachen(this.title, this.image);
}

class _subcategoryState extends State<subcategory> {
  int? indes;
  final List<Sachen> infoBank = [
    Sachen(
      "Ruffty Sports Collar T-shirt",
      "assets/collarsub/BLACK-2-7.jpg",
    ),
    Sachen(
      "Athli Pro Collar T-shirt",
      "assets/collarsub/BLACK-A-4.jpg",
    ),
    Sachen(
      "Ruffty X Collar T-shirt",
      "assets/collarsub/BLACK-B-5.jpg",
    ),
    Sachen(
      "Ruffty Solid Collar T-shirt",
      "assets/collarsub/Cream-2-2.jpg",
    ),
    Sachen(
      "Carbon ni Tipping Collar T-shirt",
      "assets/collarsub/ice-blue-with-white-2.jpg",
    ),
    Sachen(
      "Carbon ni Solid Collar T-shirt",
      "assets/collarsub/Mulberry-2-1.jpg",
    ),
    Sachen(
      "Carbon ni Solid Collar T-shirt",
      "assets/collarsub/Mulberry-2-1.jpg",
    ),
    Sachen(
      "Ruffty Endurance Collar T-shirt",
      "assets/collarsub/ROYAL-BLUE-2-2.jpg",
    ),
    Sachen(
      "Ruffty Tipping Collar T-shirt",
      "assets/collarsub/sunflower-yellow-with-black-2.jpg",
    ),
    Sachen(
      "Wild Horn Collar T-shirt",
      "assets/collarsub/WH-3-White-With-Black-Blue-Jacquard-2.jpg",
    ),
    // Sachen("High O2 Collar T-shirt","assets/collarsub/WHITE-2-6.jpg",),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productsapi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: commanScreen(isLoading: false,
      scaffold: Scaffold(
        endDrawer: drawer1(context),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            "Main Category",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(3.w),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5.0, crossAxisCount: 2),
            shrinkWrap: true,
            //   scrollDirection:
            // Axis.horizontal,
            itemCount: infoBank.length,
            itemBuilder: (context, index) {
              return Container(
                height: 20.h,
                width: 20.h,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      indes = index;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            productdetail1(
                                indew: prods?.productData?[index].apId,
                                pname: prods?.productData?[index].apName),
                      ),
                    );
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
                                  infoBank[index].image,
                                  height: 20.h,
                                  width: 20.h,
                                )),
                            Positioned(
                              top: 13.h,
                              left: 0.5.h,
                              child: Container(
                                width: 19.h,
                                height: 5.h,
                                alignment: Alignment.center,
                                color: Colors.black38,
                                child: Text(
                                  (prods?.productData?[index].apName)
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
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
        ),
      ),
    ),);
  }

  productsapi() async {
    SharedPreferences _sharedpreferences =
    await SharedPreferences.getInstance();
    final Map<String, String> data = {};
    data['action'] = 'fetch_products';
    // data['d_id'] = '24';
    // data['ap_id'] = '2';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Authprovider().products(data).then((Response response) async {
          prods = Prodmodal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && prods?.status == 'success') {
            print((prods?.productData).toString());

            if (kDebugMode) {}
          } else {}
        });
      } else {
        setState(() {});
      }
    });
  }
}
