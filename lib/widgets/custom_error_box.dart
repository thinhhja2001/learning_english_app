import 'package:flutter/material.dart';

class CustomErrorBox extends StatelessWidget {
  const CustomErrorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: const Padding(
          padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
          child: Text(
            "Please fill up all the field",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
