// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.amber,
    Colors.cyan,
    Colors.brown,
  ];

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
                      mainAxisSize: MainAxisSize.min,
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
                        SizedBox(height: 16),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "I'm a",
                                style: TextStyle(
                                    fontFamily: "Horizon",
                                    fontSize: 40,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 12),
                              DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontFamily: "Horizon",
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText("App Developer"),
                                    RotateAnimatedText("Software Developer"),
                                    RotateAnimatedText("Flutter Developer"),
                                    RotateAnimatedText("ML Developer"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            miniDescription,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Download CV",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          //     AnimatedTextKit(
                          //   animatedTexts: [
                          //     ColorizeAnimatedText(
                          //       "Download CV",
                          //       textStyle: TextStyle(
                          //         fontSize: 30,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //       colors: colorizeColors,
                          //     ),
                          //   ],
                          // ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    flex: ScreenHeleper.isMobile(context) ? 0 : 3,
                    child: Lottie.asset("Myassets/animation/yoga.json"),
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
