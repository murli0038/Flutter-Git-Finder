import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_finder/Models/GitUser.dart';
import 'package:git_finder/Screens/FindGitUser.dart';
import 'package:git_finder/Services/Services.dart';
import 'package:git_finder/Utils/AppAssets.dart';
import 'package:git_finder/Utils/AppColors.dart';
import 'package:git_finder/Utils/AppText.dart';
import 'package:git_finder/Utils/AppTextStyle.dart';
import 'package:git_finder/Utils/AppToasts.dart';
import 'package:git_finder/Utils/ScreenSize.dart';
import 'package:git_finder/Widgets/BackGroundContainer.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  TextEditingController _controller = TextEditingController();
  bool isClearShow = false;
  GitUser gitUser;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gitUser = GitUser();
  }

  _StartScreenState(){
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          isClearShow = false;
        });
      } else {
        setState(() {
          isClearShow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blackColor,
        height: ScreenSize.screenHeight(context),
        width: ScreenSize.screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppAssets.githubLogo,height: ScreenSize.gitHubLogoHeight(context),)),
            SizedBox(height: 15,),
            Text(AppText.splashText,style: AppTextStyle.splashTextStyle(),),
            Padding(
              padding: ScreenSize.padding15,
              child: BackgroundContainer(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.search,color: AppColors.globalColor,),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: Platform.isAndroid ? 198 : 210,
                            child: TextField(
                              cursorColor: AppColors.globalColor,
                              autocorrect: true,
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: "Search...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              _controller.clear();
                            });
                          },
                          child: Visibility(visible: isClearShow, child: Icon(Icons.clear,color: AppColors.globalColor,)))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ScreenSize.screenWidth(context) / 2,
              child: Padding(
                padding: ScreenSize.padding5,
                child: ElevatedButton(
                  child: isLoading ? SizedBox(height: 20,width: 20,child: CircularProgressIndicator(backgroundColor: AppColors.blackColor,valueColor:new AlwaysStoppedAnimation<Color>(Colors.white),)) :
                  Text(AppText.getUserText.toUpperCase(),style: AppTextStyle.getUserButtonTextStyle(),),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if(_controller.text.isNotEmpty){
                      setState(() {
                        isLoading = true;
                      });
                      Services.getUser(_controller.text).then((valueFromURL){
                        setState(() {
                          if(valueFromURL.runtimeType == GitUser){
                            gitUser = valueFromURL;
                            print(gitUser.toJson());
                            isLoading = false;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FindGitUserScreen(gitUser: gitUser)));
                          }
                          else{
                            isLoading = false;
                            print(valueFromURL);
                            AppToast.showFlutterToast(valueFromURL.toString());
                          }
                        });
                      });
                    }
                    else{
                      AppToast.showFlutterToast("Enter git username, like eg. murli0038");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.whiteColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
