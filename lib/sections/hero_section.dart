import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:typethis/typethis.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {

  bool showSecondText = false;

  @override
  void initState() {
    super.initState();
    _showSecondTextWithDelay();
  }

  void _showSecondTextWithDelay() async {
    await Future.delayed(Duration(milliseconds: 1800)); // Adjust the delay as needed
    setState(() {
      showSecondText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    double hei= MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Flex(
        direction: wid>600?Axis.horizontal:Axis.vertical,
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RotatedBox(
                    quarterTurns: wid>600?45:0,
                    child: Text("Scroll down ".toUpperCase(), style: TextStyle(fontSize: 20),)),
                Icon(CupertinoIcons.arrow_down),
              ],
            ),
          ),
          Flexible(
            child: Container(
              // color: Colors.blue,
              width: 650,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flex(
                        direction: wid>700?Axis.horizontal:Axis.vertical,
                      children: [
                        TypeThis(
                          string: "\<Software ".toUpperCase(),
                          style: TextStyle(fontSize: 60, height: 1),
                          showBlinkingCursor: false,
                          speed: 200,
                        ),
                        showSecondText?TypeThis(
                          string: "Engineer/>".toUpperCase(),
                          style: TextStyle(fontSize: 60, height: 1),
                          showBlinkingCursor: false,
                          speed: 200,
                        ):SizedBox(),
                      ],
                    ),
                    // Text("\<Software Engineer/>".toUpperCase(),style: TextStyle(fontSize: 60, height: 1), textAlign: TextAlign.center, ),
                    SizedBox(height: 10,),
                    Text("Software Engineer graduate from Koya University with strong skills in Flutter and web development. Effective communicator and collaborative team player.", maxLines: 10, style: TextStyle(fontSize: 20,), textAlign: TextAlign.center, ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}

