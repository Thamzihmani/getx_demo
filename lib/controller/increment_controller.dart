import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class IncrementController extends GetxController{
  int counterValue = 0;
  int get value => counterValue;
  void increment(){
    counterValue++;
    update();
    if (kDebugMode) {
      print("Value : $counterValue");
    }
  }
}