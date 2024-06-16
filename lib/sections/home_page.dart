import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_portfolio/sections/projects.dart';
import 'package:personal_portfolio/sections/skills.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/custom_navigation_bar.dart';
import '../controllers/theme_changer.dart';
import '../themes.dart';
import 'about_me.dart';
import 'contact.dart';
import 'flutter_skills.dart';
import 'hero_section.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List sections=[
  HeroSection(),
  AboutMe(),
  Skills(),
  Projects(),
  FlutterSkills(),
  Contact(),
];

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  // The controller to change our animated icon
  late AnimationController controller;
  late AnimationController mController;
  late AnimationController bController;

  // Boolean to check state of our icon
  bool isClicked = false;
  @override
  void initState() {
    // Initializing our controller
    controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    mController = AnimationController(
      vsync: this,
    );
    bController = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    // Disposing controller
    // when its not needed
    controller.dispose();
    mController.dispose();
    bController.dispose();
    super.dispose();
  }

  PageController pageViewController= PageController();
  int currentPage=0;
  bool isHover=false;
  @override
  Widget build(BuildContext context) {
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Consumer<ThemeChanger>(
        builder: (_, tChanger, __) {
          return Scaffold(
            appBar: CustomAppBar(isClicked, controller, mController, bController, () {
              setState(() {
                isClicked = !isClicked;
              });
            }, isHover, (){
              setState(() {
                isHover=true;
              });
            }, (){
              setState(() {
                isHover=false;
              });
            }, context, pageViewController, 0, (){
              setState(() {
                isClicked = false;
              });
            }),
            body: Stack(
              children: [
                Stack(
                  children: [
                    PageView.builder(
                        itemCount: sections.length,
                        scrollDirection: Axis.vertical,
                        controller: pageViewController,
                        scrollBehavior: AppScrollBehavior(),
                        onPageChanged: (cPage){
                          print(cPage);
                          setState(() {
                            currentPage=cPage;
                          });
                        },
                        itemBuilder: (context,index){
                          return sections[index];
                        }),
                    Positioned(
                        right: 20,
                        bottom: 20,
                        child: SmoothPageIndicator(
                            axisDirection: Axis.vertical,
                            controller: pageViewController,  // PageController
                            count:  sections.length,
                            effect:  ExpandingDotsEffect(
                              dotWidth: 2.5,
                              dotHeight: 2.5,
                              dotColor: cTheme.primaryColorDark,
                              spacing: 2,
                              expansionFactor: 20,
                              activeDotColor: cTheme.primaryColorDark,
                            ),  // your preferred effect
                            onDotClicked: (index){

                            }
                        )
                    ),
                  ],
                ),
                IgnorePointer(
                  ignoring: !isClicked?true:false,
                  child: AnimatedOpacity(
                    opacity: isClicked?1:0,
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Theme.of(context).primaryColorLight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    menuItems("About me", currentPage, mController, 1, pageViewController, controller, bController, () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    }, context),
                                    menuItems("Skills", currentPage, mController, 2, pageViewController, controller, bController, () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    }, context),
                                    menuItems("Projects", currentPage, mController, 3, pageViewController, controller, bController, () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    }, context),
                                    menuItems("Flutter Skills", currentPage, mController, 4, pageViewController, controller, bController, () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    }, context),
                                    menuItems("Get in touch", currentPage, mController, 5, pageViewController, controller, bController, () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    }, context),
                                  ],
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: CustomSwitchBtn(tChanger.isDark, Colors.black, (val) {
                                    tChanger.changeTheme();
                                  }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        );
      }
    );
  }
}

Widget menuItems(String name, int currentPage, AnimationController controller, int pageIndex, PageController pageViewController, AnimationController menuBarController, AnimationController bController,  void closeMenu(), BuildContext context){
  return GestureDetector(
    onTap: (){
      pageViewController.animateToPage(pageIndex, duration: Duration(seconds: 1), curve: Curves.easeOut);
      menuBarController.reverse();
      closeMenu();
    },
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              // color: Colors.brown,
              child: Text(name.toUpperCase(), style: TextStyle(fontSize: 50, color: pageIndex==currentPage?Theme.of(context).primaryColorDark:Colors.grey),),
            ),
            pageIndex==currentPage?Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 1,
                color: Theme.of(context).primaryColorDark,
                child: Text(name.toUpperCase(), style: TextStyle(fontSize: 50, color: Colors.transparent),),
              ).animate(controller: bController).scaleX(duration: 2.seconds),
            ):SizedBox(),
          ],
        ),
      ],
    ),
  ).animate(controller: controller).slideY(duration: 1.seconds, curve: Curves.easeOut, begin: 1, end: 0);
}

class CustomSwitchBtn extends StatelessWidget {
  final bool value;
  final Color inactiveTrackColor;
  final Function(dynamic) doFunction;
  const CustomSwitchBtn(this.value, this.inactiveTrackColor, this.doFunction);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(width: 1, color: value?Colors.white:Colors.grey),
        color: value
            ? CupertinoColors.black
            : CupertinoColors.white,
      ),
      child: CupertinoSwitch(
        value: value,
        activeColor: value?Colors.black:CupertinoColors.white,
        trackColor: CupertinoColors.white,
        thumbColor: value?CupertinoColors.inactiveGray:CupertinoColors.activeOrange,
        onChanged: (v) {
          doFunction(v);
        }
      ),
    );
  }
}