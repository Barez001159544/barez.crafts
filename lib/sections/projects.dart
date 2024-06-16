import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/theme_changer.dart';
import '../themes.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class MyProjects{
  String name;
  String tools;
  String description;
  String link;

  MyProjects(
      this.name,
      this.tools,
      this.description,
      this.link,
      );
}

List myProjects=[                         //-------------------------------------------------------------------------------------------------//
  MyProjects("RCMS", "Flutter & REST Api", "Enhancing residential life within residents by streamlining processes and utilizing FIB Payment.", "https://github.com/Barez001159544/graduation_project.git"),
  MyProjects("Comic-I", "Flutter & REST Api", "A dynamic, immersive comic reader app, featuring an intuitive UI and seamless functionality.", "https://github.com/Barez001159544/comici.git"),
  MyProjects("Batam Nuts System", "Flutter & REST Api", "A specialized system that streamlines and enhances warehouse-to-client supply chains in Batam.", "https://github.com/Barez001159544/batam_nuts_system.git"),
  MyProjects("BTC-Exchange", "Flutter & WebSocket", "The project fetches real-time BTC and USD prices from Kraken WebSocket.", "https://github.com/Barez001159544/datacode_test_project.git"),
  MyProjects("QR Attendance System", "HTML, CSS, JS, PHP & SQL", "Web-based application simplifies student attendance tracking.", "https://github.com/Barez001159544/attendances.git"),
];

class _ProjectsState extends State<Projects> with TickerProviderStateMixin{
  bool isHoverRight=false;
  bool isHoverLeft=false;
  PageController pageViewController= PageController();
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    double hei= MediaQuery.of(context).size.height;
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Scaffold(
      body: Column(
        children: [
          Text("Projects".toUpperCase(),style: TextStyle(fontSize: 60, height: 1), textAlign: TextAlign.center, ),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: myProjects.length,
                    scrollDirection: wid>600?Axis.horizontal:Axis.vertical,
                    controller: pageViewController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (cPage){
                      print(cPage);
                      setState(() {
                        currentPage=cPage;
                      });
                    },
                    itemBuilder: (context, index){
                  return InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(myProjects[index].link))) {
                      throw Exception('Could not launch');
                      }
                    },
                    child: Tooltip(
                      message: "Show on GitHub",
                      preferBelow: false,
                      verticalOffset: 100,
                      textStyle: TextStyle(
                        color: cTheme.primaryColorDark,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Container(
                        // color: Colors.brown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(myProjects[index].name.toString().toUpperCase(),style: TextStyle(fontSize: 40), textAlign: TextAlign.center, ),
                            Text(myProjects[index].tools.toString().toUpperCase(),style: TextStyle(fontSize: 20), textAlign: TextAlign.center, ),
                          Flexible(
                            child: Container(
                              width: 400,
                              // color: Colors.blue,
                              child: Text(textAlign: TextAlign.center, myProjects[index].description, maxLines: 10, style: TextStyle(fontSize: 20),),
                            ),
                          ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Center(
                  child: Flex(
                    direction: wid>600?Axis.horizontal:Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          pageViewController.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
                        },
                        child: RotatedBox(
                          quarterTurns: wid>600?90:-45,
                          child: MouseRegion(
                            onHover: (p){
                              // print("object");
                              setState(() {
                                isHoverLeft=true;
                              });
                            },
                            onExit: (p){
                              // print("no-object");
                              setState(() {
                                isHoverLeft=false;
                              });
                            },
                            child: AnimatedScale(
                              scale: (isHoverLeft && currentPage!=0)?1.08:1,
                              duration: Duration(milliseconds: 100),
                              child: Container(
                                // color: Colors.yellow,
                                padding: EdgeInsets.only(left: wid>600?20:0),
                                  child: SvgPicture.asset(
                                    width: 100,
                                  height: 100,
                                  "images/chevron.svg",
                                  color: currentPage==0?Colors.grey:cTheme.primaryColorDark,
                                  semanticsLabel: 'Acme Logo'
                              ),
                                  // child: Text(
                                  //   String.fromCharCode(wid>600?CupertinoIcons.left_chevron.codePoint:CupertinoIcons.chevron_up.codePoint),
                                  //   style: TextStyle(
                                  //     inherit: false,
                                  //     color: currentPage==0?Colors.grey:cTheme.primaryColorDark,
                                  //     fontSize: 140,
                                  //     fontWeight: FontWeight.w100,
                                  //     fontFamily: CupertinoIcons.exclamationmark_circle.fontFamily,
                                  //     package: CupertinoIcons.exclamationmark_circle.fontPackage,
                                  //   ),
                                  // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          pageViewController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
                        },
                        child: RotatedBox(
                          quarterTurns: wid>600?0:45,
                          child: MouseRegion(
                            onHover: (p){
                              // print("object");
                              setState(() {
                                isHoverRight=true;
                              });
                            },
                            onExit: (p){
                              // print("no-object");
                              setState(() {
                                isHoverRight=false;
                              });
                            },
                            child: AnimatedScale(
                              scale: (isHoverRight && currentPage!=myProjects.length-1)?1.08:1,
                              duration: Duration(milliseconds: 100),
                              child: Container(
                                // color: Colors.yellow,
                                padding: EdgeInsets.only(left: wid>600?20:0),
                                child: SvgPicture.asset(
                                    width: 100,
                                    height: 100,
                                    "images/chevron.svg",
                                    color: currentPage==myProjects.length-1?Colors.grey:cTheme.primaryColorDark,
                                    semanticsLabel: 'Acme Logo'
                                ),
                                // child: Text(
                                //   String.fromCharCode(wid>600?CupertinoIcons.left_chevron.codePoint:CupertinoIcons.chevron_up.codePoint),
                                //   style: TextStyle(
                                //     inherit: false,
                                //     color: currentPage==0?Colors.grey:cTheme.primaryColorDark,
                                //     fontSize: 140,
                                //     fontWeight: FontWeight.w100,
                                //     fontFamily: CupertinoIcons.exclamationmark_circle.fontFamily,
                                //     package: CupertinoIcons.exclamationmark_circle.fontPackage,
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: wid>600?40:120,
                    right: 0,
                    left: 0,
                    child: Text("${currentPage+1}/${myProjects.length}",style: TextStyle(fontSize: 40, color: Colors.grey), textAlign: TextAlign.center, )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
