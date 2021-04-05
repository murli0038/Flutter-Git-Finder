import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_finder/Models/Repositories.dart';
import 'package:git_finder/Services/Services.dart';
import 'package:git_finder/Utils/AppColors.dart';
import 'package:git_finder/Utils/AppText.dart';
import 'package:git_finder/Utils/AppTextStyle.dart';
import 'package:git_finder/Utils/ScreenSize.dart';
import 'package:git_finder/Widgets/ShimmerWidget.dart';

class RepositoriesScreen extends StatefulWidget {

  String reposUrl;
  RepositoriesScreen({this.reposUrl});

  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {

  List<Repository> followers = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getRepositories(widget.reposUrl).then((valueFromURL){
      followers = valueFromURL;
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          AppText.repositoriesText.toString(),
          style: AppTextStyle.appbarHeadingTextStyle(),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: AppColors.transparentColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: isLoading
          ? ShimmerWidget()
          : ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        children: [
          ListView.builder(
            reverse: true,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: followers == null ? 0 : followers.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[4],
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(followers[index].name.toString(), style: AppTextStyle.followerNameTextStyle()),
                            SizedBox(height: 2,),
                            Text(followers[index].fullName.toString(), style: AppTextStyle.followerRepoTextStyle()),
                            SizedBox(height: 2,),
                            Text(followers[index].htmlUrl.toString(), style: AppTextStyle.followerRepoTextStyle()),
                            SizedBox(height: 2,),
                            Text(followers[index].language.toString(), style: AppTextStyle.userIdTextStyle()
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
