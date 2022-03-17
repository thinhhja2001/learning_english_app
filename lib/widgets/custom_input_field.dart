import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/constants.dart';

import '../utils/colors.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    required this.customInputFieldType,
    required this.controller,
  }) : super(key: key);
  final CustomInputFieldType customInputFieldType;
  final TextEditingController controller;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              widget.customInputFieldType == CustomInputFieldType.text
                  ? const Icon(
                      Icons.mail_outline,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Icons.lock_outline,
                      color: kPrimaryColor,
                    ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.customInputFieldType ==
                          CustomInputFieldType.password
                      ? _isObscure
                      : false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.customInputFieldType ==
                              CustomInputFieldType.text
                          ? "Email address"
                          : "Password",
                      suffixIcon: widget.customInputFieldType ==
                              CustomInputFieldType.password
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xff9FA5C0),
                              ))
                          : null),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
