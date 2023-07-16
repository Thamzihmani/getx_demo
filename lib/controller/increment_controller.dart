import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class IncrementController extends GetxController{
  int _x = 0;
  int get x => _x;

  RxInt _y = 0.obs;
  RxInt get y => _y;

  void incrementX(){
    _x++;
    update();
    if (kDebugMode) {
      print("Increment X Value : $_x");
    }
  }

  void decrementX(){
    _x--;
    update();
    if (kDebugMode) {
      print("Decrement X Value : $_x");
    }
  }

  void incrementY(){
    _y.value++;
    if (kDebugMode) {
      print("Increment Y Value : $_y");
    }
  }

  void decrementY(){
    _y.value--;
    if (kDebugMode) {
      print("Decrement Y Value : $_y");
    }
  }
}