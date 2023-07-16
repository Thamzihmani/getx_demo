import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/list_controller.dart';
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
  final ListController _listController = Get.put(ListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("X value"),
          GetBuilder<IncrementController>(
              builder: (_) => Center(
                    child: Text("${_controller.x}"),
                  )),
          const SizedBox(
            height: 50,
          ),
          const Text("Y value"),
          Obx(
            () => Center(
              child: Text("${_controller.y}"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(() => Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
              itemBuilder: (context, index) => Text("${_listController.list[index]}"),
              itemCount: _listController.list.length,
            )),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Page navigation",
            onPressed: () {
              Get.to(() => const FirstPage());
            },
            tooltip: 'Next page',
            child: const Icon(Icons.arrow_forward_outlined),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            heroTag: "Increment",
            onPressed: () {
              _controller.incrementX();
              _listController.addListFn(_controller.x);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
