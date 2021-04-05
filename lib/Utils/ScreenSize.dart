import 'package:flutter/material.dart';

class ScreenSize{
  // static const ScreenHeight = MediaQuery.of(context).size.height;

  //Full Screen Size
  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  //Splash Logo Size
  static double gitHubLogoHeight(BuildContext context){
    return 80;
  }

  static const padding15 = EdgeInsets.all(15.0);
  static const padding5 = EdgeInsets.all(5.0);
  static const padding10 = EdgeInsets.all(10.0);



}