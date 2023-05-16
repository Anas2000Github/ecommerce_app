
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/helper/enum_radio_button.dart';

class RadioViewModel extends GetxController{

  RxInt get activeStep =>_activeStep;
  RxInt _activeStep = 0.obs;

  final Rx<Delivery> _delivery = Delivery.StandardDelivary.obs;
  Rx<Delivery> get delivery => _delivery;


  changeRadio(Delivery value){
    _delivery.value=value;
    update();
  }


}