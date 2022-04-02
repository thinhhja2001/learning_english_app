import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/styles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: kcGreyColor,
    //   appBar: AppBar(
    //     leading: BackButton(color: Colors.black),
    //     backgroundColor: kcWhiteColor,
    //     title: new Text("History", style: ktsTitleAppBar),
    //   ),
    //   body: Expanded(
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Container(child: SvgPicture.asset("assets/images/Rating.svg")),
    //           Text("No item here!"),
    //           ElevatedButton(
    //             onPressed: () {},
    //             child: Text("Try again"),
    //             style: ButtonStyle(
    //                 foregroundColor:
    //                     MaterialStateProperty.all<Color>(kcWhiteColor),
    //                 backgroundColor: MaterialStateProperty.all<Color>(
    //                     kcSecondBackgroundButton),
    //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                     RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                   // side: BorderSide(color: Colors.red)
    //                 ))),
    //           ),
    //         ]),
    //   ),
    // );
    //     Expanded(
    //   child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         SvgPicture.asset("assets/images/Rating.svg"),
    //         Text("No item here!"),
    //         ElevatedButton(
    //           onPressed: () {},
    //           child: Text("Try again"),
    //           style: ButtonStyle(
    //               foregroundColor:
    //                   MaterialStateProperty.all<Color>(kcWhiteColor),
    //               backgroundColor: MaterialStateProperty.all<Color>(
    //                   kcSecondBackgroundButton),
    //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                   RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(5.0),
    //                 // side: BorderSide(color: Colors.red)
    //               ))),
    //         ),
    //       ]),
    // );
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: kcWhiteColor,
        title: new Text("History", style: ktsTitleAppBar),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/empty_box.png",
              height: 100,
              width: 100,
            ),
            Text("No item here!"),
            ElevatedButton(
              onPressed: () {},
              child: Text("Try again"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(kcWhiteColor),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kcPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    // side: BorderSide(color: Colors.red)
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
