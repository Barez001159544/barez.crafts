import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/theme_changer.dart';
import '../themes.dart';

class FlutterSkills extends StatefulWidget {
  const FlutterSkills({super.key});

  @override
  State<FlutterSkills> createState() => _FlutterSkillsState();
}

List flutterKnowledge1=[
  "Clean Code",
  "MVVM Architecture",
  "Responsiveness",
  "Api Integration",
  "User Friendly UI",
  "State Management",
  "App Development",
  "Web Development",
  "WebSocket",
  "Design Thinking",
];
List flutterKnowledge2=[
  "MultiLingual",
  "Multiple Themes",
  "Provider",
  "Bloc",
  "HTTP & Dio",
  "App Store Publishing",
  "Play Store Publishing",
  "Testing and Debugging",
  "Animations",
  "Navigation",
];
class _FlutterSkillsState extends State<FlutterSkills> with TickerProviderStateMixin{
  late ScrollController _scrollController;
  late AnimationController _animationController;

  late ScrollController _scrollController2;
  late AnimationController _animationController2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    );

    _animationController.addListener(() {
      _scrollController.jumpTo(_animationController.value * _scrollController.position.maxScrollExtent);
    });

    _animationController.repeat(reverse: true);

    _scrollController2 = ScrollController();
    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    );

    _animationController2.addListener(() {
      _scrollController2.jumpTo((1 - _animationController2.value) * _scrollController2.position.maxScrollExtent);
    });

    _animationController2.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    _animationController2.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    double hei= MediaQuery.of(context).size.height;
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text("Flutter Skills".toUpperCase(),style: TextStyle(fontSize: 60, height: 1), textAlign: TextAlign.center, ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              width: 450,
              padding: EdgeInsets.symmetric(horizontal: 10),
              // color: Colors.blue,
              child: Text(textAlign: TextAlign.center, "Skilled Flutter developer, crafting both high-quality apps and websites. with a background of web development", maxLines: 10, style: TextStyle(fontSize: 20),),
            ),
          ),
          SizedBox(height: 50,),
          Column(
            children: [
              Container(
                width: wid,
                height: 50,
                // color: Colors.yellow,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: flutterKnowledge1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: index%2==0?cTheme.primaryColorDark:Colors.transparent,
                        border: Border.all(width: 1, color: index%2==0?Colors.transparent:cTheme.primaryColorDark),
                      ),
                      child: Center(
                        child: Text(flutterKnowledge1[index], style: TextStyle(color: index%2==0?cTheme.primaryColorLight:cTheme.primaryColorDark, fontFamily: "Segoe", fontStyle: FontStyle.italic, fontSize: 20)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                width: wid,
                height: 50,
                // color: Colors.yellow,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController2,
                  itemCount: flutterKnowledge2.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: index%2==0?cTheme.primaryColorDark:Colors.transparent,
                        border: Border.all(width: 1, color: index%2==0?Colors.transparent:cTheme.primaryColorDark),
                      ),
                      child: Center(
                        child: Text(flutterKnowledge2[index], style: TextStyle(color: index%2==0?cTheme.primaryColorLight:cTheme.primaryColorDark, fontFamily: "Segoe", fontStyle: FontStyle.italic, fontSize: 20)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
