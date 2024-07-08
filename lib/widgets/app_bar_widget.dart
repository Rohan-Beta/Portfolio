// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/globals.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AppBarWidget extends StatefulWidget {
  final double opacity;
  final ItemScrollController itemScrollController;

  const AppBarWidget({
    super.key,
    required this.opacity,
    required this.itemScrollController,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final desktopHeader = PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: DeskTopBar(
        screenSize: screenSize,
        widget: widget,
        itemScrollController: widget.itemScrollController,
      ),
    );

    return ScreenHeleper(
      mobile: mobileHeader(),
      tablet: desktopHeader,
      desktop: desktopHeader,
    );
  }
}

class DeskTopBar extends StatelessWidget {
  final Size screenSize;
  final AppBarWidget widget;
  final ItemScrollController? itemScrollController;

  const DeskTopBar({
    super.key,
    required this.screenSize,
    required this.widget,
    this.itemScrollController,
  });

  InkWell menuItem({required int toPage, required String title}) {
    return InkWell(
      onTap: () => itemScrollController?.scrollTo(
        index: toPage,
        duration: Duration(seconds: 2),
        curve: Curves.easeOut,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 24),
            menuItem(toPage: 0, title: "Home"),
            SizedBox(width: 24),
            menuItem(toPage: 1, title: "About"),
            SizedBox(width: 24),
            menuItem(toPage: 2, title: "Projects"),
            SizedBox(width: 24),
            menuItem(toPage: 3, title: "Education"),
            SizedBox(width: 24),
            menuItem(toPage: 4, title: "Skills"),
            SizedBox(width: 24),
            menuItem(toPage: 5, title: "Contact"),
          ],
        ),
      ),
    );
  }
}

Widget mobileHeader() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          GestureDetector(
            onTap: () => Globals.scaffoldKey.currentState!.openEndDrawer(),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    ),
  );
}

class HeaderLogo extends StatelessWidget {
  HeaderLogo({super.key});

  final style = GoogleFonts.oswald(
      color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: name.characters.first, style: style),
            TextSpan(text: ".", style: style),
          ],
        ),
      ),
    );
  }
}
