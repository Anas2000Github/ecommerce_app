import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/auth_view_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel =Get.put(AuthViewModel());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           // GetX<AuthViewModel>(
           //   init:AuthViewModel(),
           //     builder: (value) => Text("${value.counter.value}")),
          // Obx(() => Text(viewModel.counter.value.toString())),
          //  ElevatedButton(onPressed: (){
          //       viewModel.increment();
          //      }, child: Text("increment"),),
        ],
      ),
    );
  }
}
// StateManagement

/// getBuilder -- not reactive
/// GetX  -- reactive -- stream
/// obx