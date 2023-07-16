import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/views/first_page.dart';

import '../controller/increment_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final IncrementController _controller = Get.put(IncrementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GetBuilder<IncrementController>(builder: (controller) => Center(child: Text("${controller.value}"),)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Page navigation",
            onPressed: () {
             Get.to(()=>const FirstPage());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_forward_outlined),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(heroTag: "Increment",
            onPressed: () {
              _controller.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), 
    );
  }
}
