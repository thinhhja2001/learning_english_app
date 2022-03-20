import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/signup_provider.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/custom_error_box.dart';
import 'package:learning_english_app/widgets/custom_sign_up_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final String welcome = "Join the exciting adventure!";
  final String rule = "- Password should be 8-20 characters\n" +
      "- Password should have a lower case letter\n" +
      "- Password should have a upper case letter\n" +
      "- Password should have a number or acceptable characters";

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // Widget _buildForm(String label, String? _value) {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: label),
  //     maxLength: 10,
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return label + ' is required';
  //       }
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _value = value;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    void validate() {
      //Validate all field
      String isEmpty = "";
      isEmpty += _firstnameController.text.isEmpty ? "1" : "0";
      isEmpty += _lastNameController.text.isEmpty ? "1" : "0";
      // isEmpty += _phoneController.text.isEmpty ? "1" : "0";
      isEmpty += "0"; //Mobile Phone is not required
      isEmpty += _emailController.text.isEmpty ? "1" : "0";
      signUpProvider.isEmpty(isEmpty);

      //Valide mail
      signUpProvider.isValidEmail = RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
          .hasMatch(_emailController.text);

      //Validate Password
      signUpProvider.isValidPassword =
          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$')
                  .hasMatch(_passwordController.text) ||
              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,20}$')
                  .hasMatch(_passwordController.text);

      //Check confirm password
      signUpProvider.checkConfirm(
          _passwordController.text, _confirmPasswordController.text);
    }

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              verticalSpaceLarge,
              Text(
                welcome,
                style: ktsMediumTitleText,
              ),
              verticalSpaceMedium,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _firstnameController,
                  isShowIcon: false,
                  label: 'First Name',
                  hintText: 'Jezeniel'),
              signUpProvider.isEmptyField[0]
                  ? const CustomErrorBox(
                      message: "First Name is required",
                    )
                  : Container(),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _lastNameController,
                  isShowIcon: false,
                  label: 'Last Name',
                  hintText: 'Zapanta'),
              signUpProvider.isEmptyField[1]
                  ? const CustomErrorBox(
                      message: "Second Name is required",
                    )
                  : Container(),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _phoneController,
                  isShowIcon: false,
                  label: 'Mobile Number',
                  hintText: 'Enter your mobile number'),
              signUpProvider.isEmptyField[2]
                  ? const CustomErrorBox(
                      message: "Mobile Phone is required",
                    )
                  : Container(),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _emailController,
                  isShowIcon: false,
                  label: 'Email Address',
                  hintText: 'Enter your email address'),
              signUpProvider.isEmptyField[3]
                  ? const CustomErrorBox(
                      message: "Email is required",
                    )
                  : signUpProvider.isValidEmail
                      ? Container()
                      : const CustomErrorBox(
                          message: "Email is invalid",
                        ),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.password,
                  controller: _passwordController,
                  isShowIcon: false,
                  label: 'Password',
                  hintText: 'Enter Password'),
              signUpProvider.isValidPassword
                  ? Container()
                  : const CustomErrorBox(
                      message: "Password is invalid",
                    ),
              verticalSpaceSmall,
              Text(rule, style: ktsMediumInputText),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.password,
                  controller: _confirmPasswordController,
                  isShowIcon: false,
                  label: 'Comfirm Password',
                  hintText: 'Re-type password'),
              signUpProvider.isMatch
                  ? Container()
                  : const CustomErrorBox(
                      message: "Confirm Password is not match",
                    ),
              verticalSpaceSmall,
              Row(children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "Back",
                      style: ktsButton,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(165, 50),
                      primary: kcPrimaryColor,
                      side: BorderSide(width: 1.0, color: kcPrimaryColor),
                    ),
                    onPressed: () {},
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size?>(const Size(165, 50)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kcPrimaryColor),
                    ),
                    onPressed: validate,
                    child: Text(
                      'Sign Up',
                      style: ktsButton,
                    ),
                  ),
                ),
              ]),
            ],
          )),
    );
  }
}
// class SignUpScreen extends StatelessWidget {
//   final String welcome = "Join the exciting adventure!";
//   final String rule = "- Password should be 8-20 characters\n" +
//       "- Password should have a lower case letter\n" +
//       "- Password should have a upper case letter\n" +
//       "- Password should have a number or acceptable characters";

//   // final VoidCallback onBackPressed;
//   // final VoidCallback onCreateAccountPressed;

//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
//     TextEditingController _firstnameController = TextEditingController();
//     TextEditingController _lastNameController = TextEditingController();
//     TextEditingController _phoneController = TextEditingController();
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     TextEditingController _confirmPasswordController = TextEditingController();
//     void validate() {
//       //Validate all field
//       String isEmpty = "";
//       isEmpty += _firstnameController.text.isEmpty ? "1" : "0";
//       isEmpty += _lastNameController.text.isEmpty ? "1" : "0";
//       // isEmpty += _phoneController.text.isEmpty ? "1" : "0";
//       isEmpty += "0"; //Mobile Phone is not required
//       isEmpty += _emailController.text.isEmpty ? "1" : "0";
//       // isEmpty+=_firstnameController.text.isEmpty?"1":"0";
//       signUpProvider.isEmpty(isEmpty);

//       //Valide mail
//       signUpProvider.isValidEmail = RegExp(
//               r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//           .hasMatch(_emailController.text);

//       signUpProvider.isValidPassword =
//           RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$')
//                   .hasMatch(_passwordController.text) ||
//               RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,20}$')
//                   .hasMatch(_passwordController.text);

//       signUpProvider.checkConfirm(
//           _passwordController.text, _confirmPasswordController.text);
//       // signUpProvider.validatePassword(_passwordController.text);
//       //Validate password
//       // if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       //   signUpProvider.changeIsValidValue();
//       // }
//     }

//     return Scaffold(
//       body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: ChangeNotifierProvider(
//             create: (_) => SignUpProvider(),
//             child: ListView(
//               children: [
//                 // if (onBackPressed == null) verticalSpaceLarge,
//                 // if (onBackPressed == null) verticalSpaceRegular,
//                 // if (onBackPressed != null)
//                 //   IconButton(
//                 //     padding: EdgeInsets.zero,
//                 //     alignment: Alignment.centerLeft,
//                 //     icon: Icon(
//                 //       Icons.arrow_back_ios,
//                 //       color: Colors.black,
//                 //     ),
//                 //     onPressed: onBackPressed,
//                 //   ),
//                 verticalSpaceLarge,
//                 Text(
//                   welcome,
//                   style: ktsMediumTitleText,
//                 ),
//                 verticalSpaceMedium,
//                 Form(
//                     // key: _formKey,
//                     child: Column(
//                   children: [
//                     CustomeSignUpField(
//                         customInputFieldType: CustomInputFieldType.text,
//                         controller: _firstnameController,
//                         isShowIcon: false,
//                         label: 'First Name',
//                         hintText: 'Jezeniel'),
//                     signUpProvider.isEmptyField[0]
//                         ? const CustomErrorBox(
//                             message: "First Name is required",
//                           )
//                         : Container(),
//                     verticalSpaceSmall,
//                     CustomeSignUpField(
//                         customInputFieldType: CustomInputFieldType.text,
//                         controller: _lastNameController,
//                         isShowIcon: false,
//                         label: 'Last Name',
//                         hintText: 'Zapanta'),
//                     signUpProvider.isEmptyField[1]
//                         ? const CustomErrorBox(
//                             message: "Second Name is required",
//                           )
//                         : Container(),
//                     verticalSpaceSmall,
//                     CustomeSignUpField(
//                         customInputFieldType: CustomInputFieldType.text,
//                         controller: _phoneController,
//                         isShowIcon: false,
//                         label: 'Mobile Number',
//                         hintText: 'Enter your mobile number'),
//                     signUpProvider.isEmptyField[2]
//                         ? const CustomErrorBox(
//                             message: "Mobile Phone is required",
//                           )
//                         : Container(),
//                     verticalSpaceSmall,
//                     CustomeSignUpField(
//                         customInputFieldType: CustomInputFieldType.text,
//                         controller: _emailController,
//                         isShowIcon: false,
//                         label: 'Email Address',
//                         hintText: 'Enter your email address'),
//                     signUpProvider.isEmptyField[3]
//                         ? const CustomErrorBox(
//                             message: "Email is required",
//                           )
//                         : signUpProvider.isValidEmail
//                             ? Container()
//                             : const CustomErrorBox(
//                                 message: "Email is invalid",
//                               ),
//                     verticalSpaceSmall,
//                     CustomeSignUpField(
//                         customInputFieldType: CustomInputFieldType.password,
//                         controller: _passwordController,
//                         isShowIcon: false,
//                         label: 'Password',
//                         hintText: 'Enter Password'),
//                     signUpProvider.isValidPassword
//                         ? Container()
//                         : const CustomErrorBox(
//                             message: "Password is invalid",
//                           ),
//                     verticalSpaceSmall,
//                     Text(rule, style: ktsMediumInputText),
//                     verticalSpaceSmall,
//                     CustomeSignUpField(
//                         customInputFieldType: CustomInputFieldType.password,
//                         controller: _confirmPasswordController,
//                         isShowIcon: false,
//                         label: 'Comfirm Password',
//                         hintText: 'Re-type password'),
//                     signUpProvider.isMatch
//                         ? Container()
//                         : const CustomErrorBox(
//                             message: "Confirm Password is not match",
//                           ),
//                   ],
//                 )),
//                 verticalSpaceSmall,
//                 Row(children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       child: Text(
//                         "Back",
//                         style: ktsButton,
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         fixedSize: const Size(165, 50),
//                         primary: kcPrimaryColor,
//                         side: BorderSide(width: 1.0, color: kcPrimaryColor),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                   horizontalSpaceSmall,
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         fixedSize: MaterialStateProperty.all<Size?>(
//                             const Size(165, 50)),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(kcPrimaryColor),
//                       ),
//                       onPressed: validate,
//                       child: Text(
//                         'Sign Up',
//                         style: ktsButton,
//                       ),
//                     ),
//                   ),
//                 ]),
//               ],
//             ),
//           )),
//     );
//   }
// }
