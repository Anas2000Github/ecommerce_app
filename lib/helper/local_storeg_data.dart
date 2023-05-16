
import 'dart:convert';

import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{
  Future<UserModel?> get getUser async {

    try{
      UserModel userModel =await _getUserData();
      if(userModel==null){
        return null;
      }
      return userModel;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await  preferences.setString(CACHED_USER_DATA, jsonEncode(userModel.toJson()));
  }

  _getUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getString(CACHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value!));
  }


  void deleteUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}