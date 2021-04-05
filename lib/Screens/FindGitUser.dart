import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_finder/Models/GitUser.dart';
import 'package:git_finder/Screens/Followers.dart';
import 'package:git_finder/Screens/Followings.dart';
import 'package:git_finder/Screens/Repositories.dart';
import 'package:git_finder/Utils/AppAssets.dart';
import 'package:git_finder/Utils/AppColors.dart';
import 'package:git_finder/Utils/AppTextStyle.dart';
import 'package:git_finder/Utils/ScreenSize.dart';

class FindGitUserScreen extends StatefulWidget {

  final GitUser gitUser;
  const FindGitUserScreen({this.gitUser,});

  @override
  _FindGitUserScreenState createState() => _FindGitUserScreenState();
}

class _FindGitUserScreenState extends State<FindGitUserScreen> {

  GitUser gitUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      gitUser = widget.gitUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.whiteColor
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
      body: Padding(
        padding: ScreenSize.padding5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.globalColor,
                    image: DecorationImage(
                      image:  gitUser.avatarUrl != null ? NetworkImage(gitUser.avatarUrl) : AssetImage(AppAssets.githubLogo)
                    )
                  )
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(gitUser.name.toString(), style: AppTextStyle.userNameTextStyle()),
                    SizedBox(height: 5,),
                    Text(gitUser.login.toString(),style: AppTextStyle.userIdTextStyle(),),
                    SizedBox(height: 5,),
                    SizedBox(width:ScreenSize.screenWidth(context)/ 1.5,child: Text(gitUser.bio.toString(),style: AppTextStyle.userIdTextStyle(),)),
                    SizedBox(height: 5,),
                    Text(gitUser.followers.toString()+" Followers  "+gitUser.following.toString()+" Following",style: AppTextStyle.userFollowTextStyle(),),
                    SizedBox(height: 5,),
                  ],
                )
              ],
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: ScreenSize.padding15,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ReUsableContainer(
                        titleText: "Login ID",
                        bodyText: gitUser.id.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Node ID",
                        bodyText: gitUser.nodeId.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Gravatar ID",
                        bodyText: gitUser.gravatarId.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "URL",
                        bodyText: gitUser.url.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "HTML URL",
                        bodyText: gitUser.htmlUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Followers URL",
                        bodyText: gitUser.followersUrl.toString(),
                        isShowDetail: true,
                        detailPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FollowerScreen(followersUrl: gitUser.followersUrl,)));
                        },
                      ),
                      ReUsableContainer(
                        titleText: "Following URL",
                        bodyText: gitUser.followingUrl.toString(),
                        isShowDetail: true,
                        detailPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingsScreen(login: gitUser.login,)));
                        },
                      ),
                      ReUsableContainer(
                        titleText: "Glits URL",
                        bodyText: gitUser.gistsUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Starred URL",
                        bodyText: gitUser.starredUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Subscription URL",
                        bodyText: gitUser.subscriptionsUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Organizations URL",
                        bodyText: gitUser.organizationsUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Repositories URL",
                        bodyText: gitUser.reposUrl.toString(),
                        isShowDetail: true,
                        detailPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoriesScreen(reposUrl: gitUser.reposUrl)));
                        },
                      ),
                      ReUsableContainer(
                        titleText: "Events URL",
                        bodyText: gitUser.eventsUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Received events URL",
                        bodyText: gitUser.receivedEventsUrl.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Type",
                        bodyText: gitUser.type.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Site Admin",
                        bodyText: gitUser.siteAdmin.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Company",
                        bodyText: gitUser.company.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Blog",
                        bodyText: gitUser.blog.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Location",
                        bodyText: gitUser.location.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Email",
                        bodyText: gitUser.email.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Hireable",
                        bodyText: gitUser.hireable.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Tweeter Username",
                        bodyText: gitUser.twitterUsername.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Public Repos",
                        bodyText: gitUser.publicRepos.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Public Gists",
                        bodyText: gitUser.publicGists.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Created at",
                        bodyText: gitUser.createdAt.toString(),
                        isShowDetail: false,
                      ),
                      ReUsableContainer(
                        titleText: "Updated at",
                        bodyText: gitUser.updatedAt.toString(),
                        isShowDetail: false,
                      ),
                    ],
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

class ReUsableContainer extends StatelessWidget {

  final String titleText;
  final String bodyText;
  final bool isShowDetail;
  final Function detailPressed;

  const ReUsableContainer({
    Key key, this.titleText, this.bodyText, this.isShowDetail, this.detailPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenSize.padding10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.person)
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(width: ScreenSize.screenWidth(context) / 1.9,
                    child: Text(
                      bodyText.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        color: AppColors.greyColor
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Visibility(
            visible: isShowDetail,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.globalColor,size: 15,),
              onPressed: detailPressed,
            ),
          )
        ],
      ),
    );
  }
}
