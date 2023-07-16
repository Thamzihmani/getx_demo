import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/increment_controller.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  IncrementController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body:  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Y value"),
              Obx(() => Text(controller.y.toString()))
            ]),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Third Page",
            onPressed: () {
              Get.back();
            },
            tooltip: 'Previous Page',
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            heroTag: "Decrement",
            onPressed: () {
              controller.decrementY();
            },
            tooltip: 'Decrement Y',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
