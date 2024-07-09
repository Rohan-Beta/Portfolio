// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenHeleper(
      mobile: _buildUi(ScreenHeleper.mobileMaxWidth(context)),
      tablet: _buildUi(tableMaxWidth),
      desktop: _buildUi(desktopMaxWidth),
    );
  }

  _buildUi(double width) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final style = GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 24,
                height: 1.3,
              );
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                child: Flex(
                  direction: ScreenHeleper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHeleper.isMobile(context) ? 0 : 3,
                      child: Lottie.asset(
                        "Myassets/animation/coder.json",
                        width: 500,
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: ScreenHeleper.isMobile(context) ? 0 : 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(aboutFirst, style: style),
                          Text(aboutLast, style: style),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
