import 'package:fluttertoast/fluttertoast.dart';
import 'package:git_finder/Utils/AppColors.dart';

class AppToast{

  static void showFlutterToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.whiteColor,
        textColor: AppColors.blackColor,
        fontSize: 16.0
    );
  }

}