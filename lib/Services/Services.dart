import 'dart:convert';

import 'package:git_finder/Models/Followers.dart';
import 'package:git_finder/Models/GitUser.dart';
import 'package:git_finder/Models/Repositories.dart';
import 'package:http/http.dart' as http;

class Services{

  static const baseURL = "https://api.github.com/users/";

  static Future getUser(String userName) async
  {
    try{
      final respond = await http.get(baseURL+userName);
      if(200 == respond.statusCode){
        return parseUser(respond.body);
      }
      else{
        return GitUser();
      }
    }
    catch(e){
      print("Error "+e.toString());
      return e;
    }
  }

  static GitUser parseUser(String responseBody){
    GitUser gitUser = GitUser.fromJson(json.decode(responseBody));
    return gitUser;
  }


  //https://api.github.com/users/murli0038/followers
  static Future getFollowers(String followersUrl) async{
    try{
      final respond = await http.get(followersUrl);
      if(200 == respond.statusCode){
        return parseFollows(respond.body);
      }
      else{
        return List<Follower>();
      }
    }
    catch(e){
      print("Error "+e.toString());
      return List<Follower>();
    }
  }

  //https://api.github.com/users/murli0038/following
  static Future getFollowings(String login) async{

    String url = baseURL+login+"/following";

    try{
      final respond = await http.get(url);
      if(200 == respond.statusCode){
        return parseFollows(respond.body);
      }
      else{
        return List<Follower>();
      }
    }
    catch(e){
      print("Error "+e.toString());
      return List<Follower>();
    }
  }

  static List<Follower> parseFollows(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Follower> followers = parsed.map<Follower>((json) => Follower.fromJson(json)).toList();
    return followers;
  }

  static Future getRepositories(String repoURL) async{
    try{
      final respond = await http.get(repoURL);
      if(200 == respond.statusCode){
        return parseRepos(respond.body);
      }
      else{
        return List<Repository>();
      }
    }
    catch(e){
      print("Error "+e.toString());
      return List<Repository>();
    }
  }

  static List<Repository> parseRepos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Repository> repos = parsed.map<Repository>((json) => Repository.fromJson(json)).toList();
    return repos;
  }



}