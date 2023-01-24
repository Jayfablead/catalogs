import 'package:catalogs/screen/checkoutPage.dart';
import 'package:catalogs/screen/detailsPage.dart';
import 'package:catalogs/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Cartpage extends StatefulWidget {
  String? colorname;
  String? size;
  int? qty;
  String? name;

  Cartpage({Key? key, this.colorname, this.size, this.qty, this.name})
      : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

String img =
    'https://5.imimg.com/data5/LG/AM/OW/SELLER-31619481/plain-t-shirt-500x500.jpeg';

class _CartpageState extends State<Cartpage> {
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
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: Color(0xffe3e3e3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    'Name :' + ' ' + widget.name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    'Color :' + ' ' + widget.colorname!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    'Size :' + ' ' + widget.size!,
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
                                            widget.qty = widget.qty! + 1;
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
                                        widget.qty.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            color: Colors.black),
                                      ),
                                      SizedBox(width: 3.w),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if(widget.qty! != 0){widget.qty = widget.qty! - 1;}

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

}
