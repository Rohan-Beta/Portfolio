// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ScreenHelepr extends StatefulWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenHelepr({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  State<ScreenHelepr> createState() => _ScreenHeleprState();
}

class _ScreenHeleprState extends State<ScreenHelepr> {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double mobileMaxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * .8;

  static double deviceMaxHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1200) {
            return widget.desktop;
          } else if (constraints.maxHeight >= 800 &&
              constraints.maxWidth < 1200) {
            return widget.tablet;
          } else {
            return widget.mobile;
          }
        },
      ),
    );
  }
}