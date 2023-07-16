import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/increment_controller.dart';
import 'package:getx_demo/views/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  IncrementController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body:  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Get.to(()=>const ThirdPage());
            },
            tooltip: 'Next Page',
            child: const Icon(Icons.arrow_forward_outlined),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            heroTag: "Increment",
            onPressed: () {
              controller.incrementY();
            },
            tooltip: 'Increment Y',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
