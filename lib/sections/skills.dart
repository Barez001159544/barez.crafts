import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../controllers/theme_changer.dart';
import '../themes.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class SkillsIKnow{
  String name;
  int percentage;
  SkillsIKnow(this.name, this.percentage);
}

List mySkills=[
  SkillsIKnow('Flutter/Dart', 90),
  SkillsIKnow('HTML/CSS', 90),
  SkillsIKnow('PHP/SQL', 75),
  SkillsIKnow('English', 80),
];

List mySkills2=[
  SkillsIKnow('JS', 60),
  SkillsIKnow('Adobe Xd', 80),
  SkillsIKnow('MS Office', 90),
  SkillsIKnow('Arabic', 50),
];

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    double hei= MediaQuery.of(context).size.height;
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Skills".toUpperCase(),style: TextStyle(fontSize: 60, height: 1), textAlign: TextAlign.center, ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: wid*0.5-10,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(mySkills.length, (index) {
                    return Tooltip(
                      preferBelow: false,
                      message: "${mySkills[index].percentage}",
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Flex(
                          direction: wid>500?Axis.horizontal:Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${mySkills[index].name}".toUpperCase(), style: TextStyle(fontSize: 20),),
                            SizedBox(width: 20,),
                            Stack(
                              children: [
                                Container(
                                  width: wid>500?wid*0.25:wid*0.35,
                                  height: 30,
                                  transform: Matrix4.skewX(.9),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                                Container(
                                  width: (wid>500?wid*0.25:wid*0.35)*(mySkills[index].percentage/100),
                                  height: 30,
                                  transform: Matrix4.skewX(.9),
                                  decoration: BoxDecoration(
                                    color: cTheme.primaryColorDark,
                                  )
                                ).animate().scaleX(alignment: Alignment.centerLeft,duration: Duration(seconds: 2), curve: Curves.easeInOut,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                width: wid*0.5-10,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(mySkills2.length, (index) {
                    return Tooltip(
                      preferBelow: false,
                      message: "${mySkills2[index].percentage}",
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Flex(
                          direction: wid>500?Axis.horizontal:Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${mySkills2[index].name}".toUpperCase(), style: TextStyle(fontSize: 20),),
                            SizedBox(width: 20,),
                            Stack(
                              children: [
                                Container(
                                  width: wid>500?wid*0.25:wid*0.35,
                                  height: 30,
                                  transform: Matrix4.skewX(.9),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                                Container(
                                    width: (wid>500?wid*0.25:wid*0.35)*(mySkills2[index].percentage/100),
                                    height: 30,
                                    transform: Matrix4.skewX(.9),
                                    decoration: BoxDecoration(
                                      color: cTheme.primaryColorDark,
                                    )
                                ).animate().scaleX(alignment: Alignment.centerLeft,duration: Duration(seconds: 2), curve: Curves.easeInOut,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
