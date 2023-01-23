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
                    itemCount: 10,
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
                                  'https://5.imimg.com/data5/LG/AM/OW/SELLER-31619481/plain-t-shirt-500x500.jpeg',
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
                                        widget.qty!.toInt().toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            color: Colors.black),
                                      ),
                                      SizedBox(width: 3.w),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            widget.qty = widget.qty! - 1;
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
}
