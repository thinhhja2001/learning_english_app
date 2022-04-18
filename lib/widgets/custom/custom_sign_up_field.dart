import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../utils/colors.dart';

class CustomeSignUpField extends StatefulWidget {
  final CustomInputFieldType customInputFieldType;
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final bool isShowIcon;
  const CustomeSignUpField(
      {Key? key,
      required this.customInputFieldType,
      required this.controller,
      this.label,
      this.hintText,
      required this.isShowIcon})
      : super(key: key);

  @override
  State<CustomeSignUpField> createState() => _CustomeSignUpFieldState();
}

class _CustomeSignUpFieldState extends State<CustomeSignUpField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 70,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              Text(
                widget.label!,
                style: ktsMediumLabelInputText,
                textAlign: TextAlign.left,
              ),
            verticalSpaceTiny,
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: kcPrimaryTextColor,
                    width: 1,
                  )),
              child: Row(
                children: [
                  if (widget.isShowIcon)
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
                          hintText: widget.hintText,
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
                                    color: kcEyeIconColor,
                                  ))
                              : null),
                      validator: (value) {
                        if (value == null || value.isEmpty) return null;
                      },
                    ),
                  )),
                ],
              ),
            ),
          ]),
    );
  }
}
