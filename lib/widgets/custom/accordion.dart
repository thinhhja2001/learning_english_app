// ignore_for_file: must_be_immutable, prefer_initializing_formals

import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  Widget? header;

  final Widget? content;

  final double paddingListHorizontal;

  final double paddingListTop;

  final double paddingListBottom;

  Color? headerBackgroundColor;

  double? borderRadius;

  Color? contentBackgroundColor;

  double? contentBorderWidth;

  double? contentHorizontalPadding;

  double? contentVerticalPadding;

  EdgeInsets? headerPadding;

  Accordion({
    Key? key,
    Widget? header,
    required this.content,
    Color? headerBackgroundColor,
    double? borderRadius,
    Color? contentBackgroundColor,
    double? contentBorderWidth,
    double? contentHorizontalPadding,
    double? contentVerticalPadding,
    this.paddingListTop = 20.0,
    this.paddingListBottom = 40.0,
    this.paddingListHorizontal = 10.0,
    EdgeInsets? headerPadding,
  }) : super(key: key) {
    this.header = header;
    this.headerBackgroundColor = headerBackgroundColor;
    this.borderRadius = borderRadius ?? 10;
    this.contentBackgroundColor = contentBackgroundColor ?? Colors.white;
    this.contentBorderWidth = contentBorderWidth ?? 1;
    this.headerPadding = headerPadding ??
        const EdgeInsets.symmetric(horizontal: 15, vertical: 7);
    this.contentHorizontalPadding = contentHorizontalPadding ?? 10;
    this.contentVerticalPadding = contentVerticalPadding ?? 10;
  }
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        InkWell(
          onTap: () => setState(() {
            _showContent = !_showContent;
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            alignment: Alignment.center,
            padding: widget.headerPadding,
            decoration: BoxDecoration(
              color: widget.headerBackgroundColor ??
                  Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(
                top: const Radius.circular(10),
                bottom: Radius.circular(_showContent ? 0 : 10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: widget.header,
                  ),
                ),
                RotatedBox(
                    quarterTurns: _showContent ? 2 : 0,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white60,
                      size: 20,
                    )),
              ],
            ),
          ),
        ),
        _showContent
            ? Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: widget.headerBackgroundColor ??
                      Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(widget.borderRadius!)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    widget.contentBorderWidth ?? 1,
                    0,
                    widget.contentBorderWidth ?? 1,
                    widget.contentBorderWidth ?? 1,
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            bottom:
                                Radius.circular(widget.borderRadius! / 1.02))),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: widget.contentBackgroundColor,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(
                                  widget.borderRadius! / 1.02))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.contentHorizontalPadding!,
                          vertical: widget.contentVerticalPadding!,
                        ),
                        child: Center(
                          child: widget.content,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }
}
