import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:provider/provider.dart";
import "package:url_launcher/url_launcher.dart";
import 'package:http/http.dart' as http;
import 'dart:html' as html;

import "../controllers/theme_changer.dart";
import "../themes.dart";

AppBar CustomAppBar(bool isClicked, AnimationController controller, AnimationController mController, AnimationController bController, void openMenu(), bool isHover, void onHover(), void hoverOut(), BuildContext context, PageController pageViewController, int pageIndex, void closeMenu()){
  // bool isHover=false;
  return AppBar(
    centerTitle: true,
    scrolledUnderElevation: 0,
    toolbarHeight: 80,
    backgroundColor: Theme.of(context).primaryColorLight,
    leading: IconButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconSize: 70,
      onPressed: () {
        if (isClicked) {
          controller.reverse();
          mController.reverse();
          bController.reverse();
        } else {
          controller.forward();
          mController.forward();
          bController.forward();
        }

        openMenu();
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          size: 24,
          progress: controller
      ),
    ),
    title: GestureDetector(
      onTap: (){
        downloadPDFF();
        // downloadPDF("https://www.dropbox.com/scl/fi/3dkjenwa3q6vgxom100g3/Barez-s-Resume.pdf?rlkey=ll7ukjg10tfq1phw6k8xpzo6c&st=23bsc1f3&dl=0");
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
        child:
        Tooltip(
          message: "Download Resume",
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
          ),
          textStyle: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
          child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(60)),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: AnimatedScale(
              scale: isHover?1.08:1,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "images/my-portrait.jpg",
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: (){
          controller.reverse();
          pageViewController.animateToPage(pageIndex, duration: Duration(seconds: 1), curve: Curves.easeOut);
          mController.reverse();
          closeMenu();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text("BAREZ AZAD", style: TextStyle(fontFamily: "MSYI", fontSize: 20),),
        ),
      ),
    ],
  );
}

// Future<void> downloadPDF(String url) async {  //download pdf as .pdf
//   try {
//     // Fetch the PDF file
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       // Create a Blob from the response data
//       final blob = html.Blob([response.bodyBytes], 'application/pdf');
//
//       // Create an anchor element and trigger the download
//       final anchor = html.AnchorElement(
//         href: html.Url.createObjectUrlFromBlob(blob),
//       )
//         ..setAttribute('download', 'Barez\'s Resume.pdf')
//         ..click();
//
//       // Revoke the object URL to free up resources
//       html.Url.revokeObjectUrl(anchor.href!);
//     } else {
//       print('Failed to download PDF: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error downloading PDF: $e');
//   }
// }

void downloadPDFF() {
    final url = 'https://drive.google.com/uc?export=download&id=1JhqpR2Fi1D52jwP1HwWgfLG6fn5ATLvA';
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = "resume";
    anchorElement.click();
}