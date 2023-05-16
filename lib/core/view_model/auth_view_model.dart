import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_flutter_with_firebase/core/services/firestore_user.dart';
import 'package:learn_flutter_with_firebase/helper/local_storeg_data.dart';
import 'package:learn_flutter_with_firebase/model/user_model.dart';
import 'package:learn_flutter_with_firebase/view/control_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends GetxController {


  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final FirebaseAuth _auth = FirebaseAuth.instance;

 // final FacebookLogin _facebookLogin = FacebookLogin();

  final LocalStorageData localStorageData = Get.find();

  late String email, password;
  String? name;

  final Rxn<User?> _user = Rxn<User>();

  String? get user => _user.value?.email;


RxBool change =false.obs;
  changeTheme(){
    if(change== true){
      Get.updateLocale(Locale('en','us'));
      change.value=false;
    }else{
      Get.updateLocale(Locale('ar','jo'));
      change.value=true;
    }

    update();
 }

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser!=null){
      getCurrentUserData(_auth.currentUser!.uid);
    }
    super.onInit();
  }



  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
    if (kDebugMode) {
      print(_auth.signInWithCredential(credential));
    }
  }

  ///faceBook login
  // void facebookSignInMethod() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);
  //
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken accessToken = result.accessToken!;
  //       final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
  //       final UserCredential userCredential = await _auth.signInWithCredential(facebookAuthCredential);
  //       saveUser(userCredential);
  //       Get.offAll(ControlView());
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //     Get.snackbar(
  //       'Error login account',
  //       e.toString(),
  //       colorText: Colors.black,
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }





  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async{
            getCurrentUserData(value.user!.uid);
                Get.offAll(ControlView());
              });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,

      ).then((user) => {
        saveUser(user),
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email!,
      name: name ?? user.user!.displayName!,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);

    /// inside setUser for save storage
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void getCurrentUserData(String uid) async{
   return await FireStoreUser().getCurrentUser(uid).then((value)  {
      setUser(UserModel.fromJson(value.data()));
  });
  }


}


