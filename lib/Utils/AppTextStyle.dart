import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_finder/Utils/AppColors.dart';

class AppTextStyle {
  static TextStyle splashTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w100
    );
  }

  static TextStyle getUserButtonTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0
    );
  }

  static TextStyle userNameTextStyle(){
   return TextStyle(
        fontSize: 18,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold
    );
  }
  static TextStyle userIdTextStyle(){
    return TextStyle(
        fontSize: 15,
        color: AppColors.greyColor,
        fontWeight: FontWeight.bold
    );
  }
  static TextStyle userFollowTextStyle(){
    return TextStyle(
        fontSize: 15,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle appbarHeadingTextStyle(){
    return TextStyle(
        fontSize: 24,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold
    );
  }


  static TextStyle followerNameTextStyle(){
    return TextStyle(
        fontSize: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold
    );
  }
  static TextStyle followerRepoTextStyle(){
    return TextStyle(
        fontSize: 15,
        color: AppColors.greyColor,
        fontWeight: FontWeight.normal
    );
  }


}
