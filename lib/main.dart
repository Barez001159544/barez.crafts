import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_portfolio/controllers/theme_changer.dart';
import 'package:personal_portfolio/sections/home_page.dart';
import 'package:personal_portfolio/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context)=> ThemeChanger(),
          )
        ],
            child: const MyApp(),
      // DevicePreview(
        //   enabled: !kReleaseMode,
        //   tools: [
        //     ...DevicePreview.defaultTools
        //   ],
        //   builder: (context)=>const MyApp(),
        // ),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barez Crafts',
      theme: cTheme,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToHomePage() async {
    await Future.delayed(Duration(seconds: 7));
    Navigator.push(context, PageTransition(type: PageTransitionType.theme, duration: Duration(seconds: 1), curve: Curves.easeInOut, child: MyHomePage()));
  }
  final   List _allAsset = [
    "images/my-portrait.jpg",
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ThemeChanger>(context, listen: false).getDefaultTheme();
    });
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.addPostFrameCallback((_) async {
      if(context != null) {
        for(var asset in _allAsset) {
          precacheImage(AssetImage(asset), context);
        }
      }
    });
    goToHomePage();
  }
  @override
  Widget build(BuildContext context) {
    double wid= MediaQuery.of(context).size.width;
    ThemeData cTheme = Provider.of<ThemeChanger>(context).isDark ? darkTheme : lightTheme;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                width: (wid*0.8),
                height: 30,
                transform: Matrix4.skewX(.9),
                decoration: BoxDecoration(
                  color: cTheme.primaryColorDark,
                ),
            ).animate().scaleX(alignment: Alignment.centerLeft,duration: Duration(seconds: 6), curve: Curves.slowMiddle,),
            Container(
              width: (wid*0.8),
              height: 30,
              color: Colors.transparent,
              child: Center(child: Text("Barez Azad".toUpperCase(), style: TextStyle(color: cTheme.primaryColorLight, fontSize: 20),)),
            )
          ],
        ),
      ),
    );
  }
}
