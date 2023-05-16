import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:learn_flutter_with_firebase/view/widgets/Custom_radioListTile.dart';

import '../../constance.dart';
import '../../core/view_model/radio_view_model.dart';
import '../../helper/enum_radio_button.dart';



class DeliveryTime extends StatefulWidget {
  const DeliveryTime({super.key});

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivary;
  Color color=Colors.white;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadioViewModel>(
      init: RadioViewModel(),
      builder:(controller)=>  Expanded(
        child: SingleChildScrollView(
          child: Container(
            // color: ThemeMode.system==ThemeMode.dark? color:Colors.black,
            height: MediaQuery.of(context).size.height*.6,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomDelevery.listTileStyle(
                  tiltleText: 'Standerd_Delivery'.tr,
                  subtitleText: 'Des_Standerd_Delivery'.tr,
                  value: Delivery.StandardDelivary,
                  onChanged: (value) {
                    controller.changeRadio(value);
                  },
                  groupValue: controller.delivery.value,
                ),
                CustomDelevery.listTileStyle(
                  tiltleText: 'Next_Day_Delivery'.tr,
                  subtitleText: 'Des_Next_Day_Delivery'.tr,
                  value: Delivery.NextDayDelivary,
                  onChanged: (value) {
                    controller.changeRadio(value);
                  },
                  groupValue: controller.delivery.value,
                ),
                CustomDelevery.listTileStyle(
                  tiltleText: 'Nominated_Delivery'.tr,
                  subtitleText: 'Des_Nominated_Delivery'.tr,
                  value: Delivery.NomainatedDelivary,
                  onChanged: (value) {
                    controller.changeRadio(value);
                  },
                  groupValue: controller.delivery.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
