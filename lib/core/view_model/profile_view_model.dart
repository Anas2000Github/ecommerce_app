
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_flutter_with_firebase/helper/local_storeg_data.dart';

import '../../model/user_model.dart';

class ProfileViewModel extends GetxController{

  ValueNotifier<bool> _loading= ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  String _imagePath = 'default';
  String get imagePath => _imagePath;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();

  }
  setThemeMode(ThemeMode theme){
    Get.changeThemeMode(theme);
    update();
  }




  final LocalStorageData localStorageData = Get.find();

  UserModel?  _userModel;
  UserModel? get userModel => _userModel;


  void getCurrentUser()async {
    _loading.value=true;
    await localStorageData.getUser.then((value) {

        _userModel=value;

      updateCurrentUser(_userModel!.name.toString(),userModel!.email.toString());

    });
    _loading.value=false;
    update();
  }

  Future<void> signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void updateCurrentUser(String newName,String newEmail)async{

      _userModel!.name = newName;
      _userModel!.email = newEmail;
      // _userModel!.pic = imagePath;
    localStorageData.setUser(_userModel!);
    update();
  }

  // Future getImage() async{
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.gallery);
  //   if(image !=null){
  //     imagePath =image.path.toString();
  //   }
  // }



}