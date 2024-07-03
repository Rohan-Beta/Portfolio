// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/MyData/project_data.dart';
import 'package:portfolio/MyModel/project_model.dart';
import 'package:portfolio/utilss/constants.dart';
import 'package:portfolio/utilss/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: ScreenHeleper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHeleper.isMobile(context) ? 0 : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: ScreenHeleper.isMobile(context) ? 300 : 10),
                      Text(
                        "Project",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          height: 1.3,
                        ),
                      ),
                      Wrap(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 700,
                              maxWidth: 400,
                            ),
                            child: Text(
                              "This are my top 4 project",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: projectData
                                .map(
                                  (ProjectModel) => SizedBox(
                                    width: constraints.maxWidth / 2.0 - 20.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(ProjectModel.image),
                                        SizedBox(height: 5),
                                        Text(
                                          ProjectModel.description,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: captionColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: FaIcon(FontAwesomeIcons.github),
                                          color: Color(
                                            0xFFD9DEEC,
                                          ),
                                          iconSize: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
