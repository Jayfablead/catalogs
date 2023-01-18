
import 'package:catalogs/screen/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

bool select1 = false;
bool select2 = false;
void main() {
  runApp(const MyApp());
}
int? group = 0;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Loginpage(),
      );
    });
  }
}
