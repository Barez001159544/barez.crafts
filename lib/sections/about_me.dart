import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../controllers/theme_changer.dart';
import '../themes.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    double hei= MediaQuery.of(context).size.height;
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Column(
        children: [
          Flexible(
            child: Container(
              // color: Colors.yellow,
              // width: wid*0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // padding: EdgeInsets.only(right: 10),
                    width: wid>500?425:wid*0.9,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      border: Border(
                        bottom: BorderSide(width: 1, color: cTheme.primaryColorDark),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2002", style: TextStyle(fontSize: 20),),
                        Text("${DateTime.now().year}", style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Flex(
                    direction: wid>500?Axis.horizontal:Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: wid>500?CrossAxisAlignment.end:CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/my-portrait.jpg",
                        width: wid>500?160:wid,
                        height: wid>500?160:240,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ).animate().shimmer(duration: 2.seconds, delay: 2.seconds,),
                      SizedBox(width: 10,),
                      Text("About me".toUpperCase(),style: TextStyle(fontSize: 60, height: 1), textAlign: TextAlign.center, ).animate().flip(begin: -10, duration: 2.seconds, curve: Curves.decelerate,),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Container(
                        width: wid>500?425:wid*0.9,
                        // height: 100,
                        // color: Colors.green,
                        child: Text(textAlign: TextAlign.center, "Barez Azad Ismail, ${(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).difference(DateTime(2002, 12, 18)).inDays/365).round()} yo, residing in Erbil, Kurdistan, Iraq. Consistently ranked among top 10 students. Passionate software engineer, task-oriented, and committed to high-quality results & team collaboration.", maxLines: 10, style: TextStyle(fontSize: 20),)),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}