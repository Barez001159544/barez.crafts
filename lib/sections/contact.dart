import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_portfolio/components/custom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/theme_changer.dart';
import '../themes.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

bool fbHover=false;
bool igHover=false;
bool liHover=false;
bool ghHover=false;

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    double hei= MediaQuery.of(context).size.height;
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Scaffold(
      body: Flex(
        direction: wid>900?Axis.horizontal:Axis.vertical,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: (wid>900?hei/2:150)-40,
                    padding: EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                        child: Text("Get in touch".toUpperCase(),style: TextStyle(fontSize: 60, height: 1), textAlign: TextAlign.center,).animate().slideY(duration: Duration(seconds: 2), begin: 1, curve: Curves.easeInOutQuart))),
                Flexible(
                  child: Container(
                    color: cTheme.primaryColorDark,
                    height: hei/2-40,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    // color: Colors.blue,
                    child: Text(textAlign: TextAlign.center, "This website is fully developed in Flutter. Check out the source code on my GitHub and follow me for more.", maxLines: 10, style: TextStyle(fontSize: 20, color: cTheme.primaryColorLight),).animate().slideY(duration: Duration(seconds: 1), curve: Curves.easeInOutQuart),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  socialBoxes('https://www.facebook.com/profile.php?id=100009746616856&mibextid=ZbWKwL', (wid>900?hei/2:200)-40, wid>900?hei/2:wid/2, cTheme.primaryColorLight, FontAwesomeIcons.facebookF, wid>900?hei/2-100:200-50, cTheme.primaryColorDark, fbHover, (){
                    setState(() {
                      fbHover=true;
                    });
                  },
                      (){
                    setState(() {
                      fbHover=false;
                    });
                      }),
                  socialBoxes('https://www.instagram.com/barez_azad_1/', (wid>900?hei/2:200)-40, wid>900?hei/2:wid/2, cTheme.primaryColorDark, FontAwesomeIcons.instagram, wid>900?hei/2-100:200-50, cTheme.primaryColorLight, igHover, (){
                    setState(() {
                      igHover=true;
                    });
                  },
                          (){
                        setState(() {
                          igHover=false;
                        });
                      }),
                ],
              ),
              //----------
              Row(
                children: [
                  socialBoxes('https://www.linkedin.com/in/barez-azad-76066b27a/', (wid>900?hei/2:200)-40, wid>900?hei/2:wid/2, cTheme.primaryColorDark, FontAwesomeIcons.linkedinIn, wid>900?hei/2-100:200-50, cTheme.primaryColorLight, liHover, (){
                    setState(() {
                      liHover=true;
                    });
                  },
                          (){
                        setState(() {
                          liHover=false;
                        });
                      }),
                  socialBoxes('https://github.com/Barez001159544', (wid>900?hei/2:200)-40, wid>900?hei/2:wid/2, cTheme.primaryColorLight, FontAwesomeIcons.github, wid>900?hei/2-100:200-50, cTheme.primaryColorDark, ghHover, (){
                    setState(() {
                      ghHover=true;
                    });
                  },
                          (){
                        setState(() {
                          ghHover=false;
                        });
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget socialBoxes(String url, double height, double width, Color backgroundColor, IconData icon, double iconSize, Color iconColor, bool isHover, void onHover(), void hoverOut()){
  return InkWell(
    onTap: () async{
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch');
      }
    },
    child: MouseRegion(
      onHover: (p){
        // print("object");
        onHover();
      },
      onExit: (p){
        // print("no-object");
        hoverOut();
      },
      child: Container(
        height: height,
        width: width,
        color: backgroundColor,
        child: Center(
          child: AnimatedScale(
            scale: isHover?(height>200?1.1:1.05):1,
              duration: Duration(milliseconds: 1000),
              curve: Curves.elasticOut,
              child: FaIcon(icon, size: iconSize, color: iconColor,)),
        ),
      ),
    ),
  );
}