import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SayacController extends GetxController {
  var _sayac = 0.obs;

  get getValue => _sayac.value;

  set setValue(newValue) => _sayac.value = newValue;

  void Arttir() {
    _sayac = _sayac + 1;
    Get.snackbar(
      'snackbar',
      'message',
      backgroundColor: Colors.teal,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  void Azalt() {
    _sayac = _sayac - 1;
  }
}
