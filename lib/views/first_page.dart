import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/increment_controller.dart';
import 'package:getx_demo/views/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  IncrementController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("X value"),
          GetBuilder<IncrementController>(
              builder: (controller) =>
                  Center(child: Text("${controller.x}"))),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Second Page",
            onPressed: () {
              Get.to(()=>const SecondPage());
            },
            tooltip: 'Next Page',
            child: const Icon(Icons.arrow_forward_outlined),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            heroTag: "Decrement",
            onPressed: () {
              controller.decrementX();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
