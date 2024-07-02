// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        child: LayoutBuilder(
          builder: (context, constraints) {
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 24),
                        Text(
                          helloTag,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
