import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_finder/Models/Followers.dart';
import 'package:git_finder/Services/Services.dart';
import 'package:git_finder/Utils/AppColors.dart';
import 'package:git_finder/Utils/AppText.dart';
import 'package:git_finder/Utils/AppTextStyle.dart';
import 'package:git_finder/Utils/ScreenSize.dart';
import 'package:git_finder/Widgets/ShimmerWidget.dart';

class FollowerScreen extends StatefulWidget {
  String followersUrl;

  FollowerScreen({this.followersUrl});

  @override
  _FollowerScreenState createState() => _FollowerScreenState();
}

class _FollowerScreenState extends State<FollowerScreen> {
  List<Follower> followers = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getFollowers(widget.followersUrl).then((valueFromURL) {
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
          AppText.followersText.toString(),
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
                        child: Row(
                          children: [
                            Padding(
                              padding: ScreenSize.padding10,
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.greyColor,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(followers[index].avatarUrl.toString()))),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(followers[index].login.toString(), style: AppTextStyle.followerNameTextStyle()),
                                      SizedBox(height: 2,),
                                      Text(followers[index].htmlUrl.toString(), style: AppTextStyle.followerRepoTextStyle()),
                                      SizedBox(height: 2,),
                                      Text(followers[index].id.toString(), style: AppTextStyle.userIdTextStyle()
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
