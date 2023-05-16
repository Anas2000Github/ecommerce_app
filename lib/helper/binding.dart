
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/auth_view_model.dart';
import 'package:learn_flutter_with_firebase/core/view_model/cart_view_model.dart';
import 'package:learn_flutter_with_firebase/helper/local_storeg_data.dart';
import 'package:learn_flutter_with_firebase/helper/theme_controller.dart';
import '../core/view_model/check_out_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/profile_view_model.dart';

class Binding extends Bindings{

  @override
  void dependencies() {
    Get.put(AuthViewModel());
    Get.put(ControlViewModel());
    Get.put(HomeViewModel());
    Get.put(CartViewModel());
    Get.put(LocalStorageData());
    Get.put(ProfileViewModel());
    Get.put(CheckOutViewModel());
    Get.put(ThemeController());
  }

}