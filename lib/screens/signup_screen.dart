import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/custom_sign_up_field.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final String welcome = "Join the exciting adventure!";
//   final String firstInfo = "First name";
//   final String secondInfo = "Last name";
//   final String thirdInfo = "Mobile Number";
//   final String fourthInfo = "Email Address";
//   final String fifthInfo = "Password";
//   final String sixthInfo = "Confirm Password";
//   final String rule = "Password should be 8-20 characters\n" +
//       "Password should have a lower case letter\n" +
//       "Password should have a upper case letter\n" +
//       "Password should have a number or acceptable characters";

//   String? _firstName;
//   String? _secondName;
//   String? _mobileNumber;
//   String? _email;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();

//   Widget _buildFirstName() {
//     return TextFormField(
//       decoration: InputDecoration(labelText: 'Name'),
//       maxLength: 10,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Name is Required';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _firstName = value;
//       },
//     );
//   }

//   Widget _buildForm(String label, String? _value) {
//     return TextFormField(
//       decoration: InputDecoration(labelText: label),
//       maxLength: 10,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return label + ' is required';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _value = value;
//       },
//     );
//   }
//   // Widget _buildSecondName() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Name'),
//   //     maxLength: 10,
//   //     validator: (value) {
//   //       if (value == null || value.isEmpty) {
//   //         return 'Name is Required';
//   //       }
//   //       return null;
//   //     },
//   //     onSaved: (value) {
//   //       _firstName = value;
//   //     },
//   //   );
//   // }
//   // Widget _buildPhoneNumber() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Name'),
//   //     maxLength: 10,
//   //     validator: (value) {
//   //       if (value == null || value.isEmpty) {
//   //         return 'Name is Required';
//   //       }
//   //       return null;
//   //     },
//   //     onSaved: (value) {
//   //       _firstName = value;
//   //     },
//   //   );
//   // }
//   // Widget _buildEmail() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Name'),
//   //     maxLength: 10,
//   //     validator: (value) {
//   //       if (value == null || value.isEmpty) {
//   //         return 'Name is Required';
//   //       }
//   //       return null;
//   //     },
//   //     onSaved: (value) {
//   //       _firstName = value;
//   //     },
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             margin: const EdgeInsets.all(24),
//             child: Form(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       welcome,
//                       style: kcMediumTitleText,
//                     ),
//                     CustomeSignUpField(
//                             customInputFieldType: CustomInputFieldType.text,
//                             controller: _emailController,
//                           ),
//                     SizedBox(
//                       height: 100,
//                     ),
//                     RaisedButton(
//                       child: Text(
//                         'Create',
//                         style: kcMediumTitleText,
//                       ),
//                       onPressed: () => {},
//                     )
//                   ]),
//             )));
//   }
// }
class SignUpScreen extends StatelessWidget {
  final String welcome = "Join the exciting adventure!";
  final String firstInfo = "First name";
  final String secondInfo = "Last name";
  final String thirdInfo = "Mobile Number";
  final String fourthInfo = "Email Address";
  final String fifthInfo = "Password";
  final String sixthInfo = "Confirm Password";
  final String rule = "- Password should be 8-20 characters\n" +
      "- Password should have a lower case letter\n" +
      "- Password should have a upper case letter\n" +
      "- Password should have a number or acceptable characters";

  // final VoidCallback onBackPressed;
  // final VoidCallback onCreateAccountPressed;

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final signInProvider = Provider.of<SignInProvider>(context);
    TextEditingController _firstnameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    void signIn() {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        // signInProvider.changeIsValidValue();
      }
    }

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              // if (onBackPressed == null) verticalSpaceLarge,
              // if (onBackPressed == null) verticalSpaceRegular,
              // if (onBackPressed != null)
              //   IconButton(
              //     padding: EdgeInsets.zero,
              //     alignment: Alignment.centerLeft,
              //     icon: Icon(
              //       Icons.arrow_back_ios,
              //       color: Colors.black,
              //     ),
              //     onPressed: onBackPressed,
              //   ),
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
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _lastNameController,
                  isShowIcon: false,
                  label: 'Last Name',
                  hintText: 'Zapanta'),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _phoneController,
                  isShowIcon: false,
                  label: 'Mobile Number',
                  hintText: 'Enter your mobile number'),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.text,
                  controller: _emailController,
                  isShowIcon: false,
                  label: 'Email Address',
                  hintText: 'Enter your email address'),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.password,
                  controller: _passwordController,
                  isShowIcon: false,
                  label: 'Password',
                  hintText: 'Enter Password'),
              verticalSpaceSmall,
              Text(rule, style: ktsMediumInputText),
              verticalSpaceSmall,
              CustomeSignUpField(
                  customInputFieldType: CustomInputFieldType.password,
                  controller: _confirmPasswordController,
                  isShowIcon: false,
                  label: 'Comfirm Password',
                  hintText: 'Re-type password'),
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
                    onPressed: () {},
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
