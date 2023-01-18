import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class textfields extends StatelessWidget {
  final Icon icon;
  final String? hint;
  final String? text;
  final bool pwd = false;
  final bool? obtext;

  TextEditingController mycontroller;
  TextInputType? type;
  textfields(
      {Key? key,
      this.obtext,
      required this.type,
      required this.icon,
      required this.hint,
      required this.text,
      required this.mycontroller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: type,
        controller: mycontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return text;
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(2.0),
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 10.sp),
            hintText: hint,
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
            prefixIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconTheme(
                data: IconThemeData(color: Colors.grey),
                child: icon,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.white),
      ),
    );
  }
}
