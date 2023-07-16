import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/helper/init_dependency.dart';
import 'package:getx_demo/views/home_page.dart';

//import 'helper/init_controller.dart' as di;

/*Future<void> main()async {
  await di.init();
  runApp(const MyApp());
}*/

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //Initializing the getX controllers
      initialBinding: InitDept(),
      title: 'GetX App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GetX Demo App'),
    );
  }
}
