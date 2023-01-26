import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ThankyouPage extends StatefulWidget {
  const ThankyouPage({Key? key}) : super(key: key);

  @override
  State<ThankyouPage> createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlueAccent,

                gradient: LinearGradient(
                  colors: [Color(0xffe14d17), Color(0xffcc642e)],
                  begin: Alignment(-1.0, -1),
                  end: Alignment(-1.0, 1),
                  // begin: Alignment(-1.0, -4.0),
                  // end: Alignment(1.0, 4.0),
                  transform: GradientRotation(0.7853982),
                ),
              ),
            ),
            Positioned(
              top: 7.5.h,
              left: 7.5.w,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * 0.84,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065,
                      ),
                      Text(
                        'Order Book Succesfuly',
                        style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Your Transaction is completed',
                        style: TextStyle(
                          fontSize: 4.w,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 0.05.h,
                        width: 70.w,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Transaction Id :',
                            style: TextStyle(
                              fontSize: 4.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        '343504920658',
                        style: TextStyle(
                          fontSize: 8.w,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Image.asset(
                            'assets/done.png',
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Text('Catalogs'),
                              Text('Catalogs'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 3.h,
                left: 40.w,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(250),
                  ),
                )),
            Positioned(
              top: 3.3.h,
              left: 41.w,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(250),
                ),
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/done.png')),
              ),
            ),
            Positioned(
              left: 2.w,
              top: 22.h,
              child: Container(
                height: 4.h,
                width: 9.w,
                decoration: BoxDecoration(
                    color: Color(0xfae14d17),
                    borderRadius: BorderRadius.circular(90)),
              ),
            ),
            Positioned(
              left: 88.5.w,
              top: 22.h,
              child: Container(
                height: 4.h,
                width: 9.w,
                decoration: BoxDecoration(
                    color: Color(0xfae14d17),
                    borderRadius: BorderRadius.circular(90)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
