// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice/result.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../widgets/home/statistics/history_container.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kcGreyColor,
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: kcWhiteColor,
          title: const Text("History", style: ktsTitleAppBar),
        ),
        body: FutureBuilder(
            future: FirebaseHandler.getHistoryResult(),
            builder: (context, AsyncSnapshot<List<Result>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.black));
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something error"));
              }
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/empty_box.png",
                        height: 100,
                        width: 100,
                      ),
                      const Text("No item here!"),
                      verticalSpaceSmall,
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text("Try again"),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(kcWhiteColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kcPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red)
                            ))),
                      ),
                    ],
                  ),
                );
              }
              List<Result> lResult = snapshot.data!.map((doc) => doc).toList();
              if (lResult.isNotEmpty) {
                lResult.sort((a, b) => b.time!.compareTo(a.time!));
              }
              return ListView.builder(
                  itemCount: lResult.length,
                  itemBuilder: (context, index) =>
                      HistoryContainer(historyResult: lResult[index]));
              // lResult.forEach((result) { HistoryContainer(historyResult: result,)});
            }));
  }
}
