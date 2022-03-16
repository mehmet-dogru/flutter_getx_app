import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/sayac_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final SayacController _controller = Get.put(SayacController());

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyCol(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.Arttir();
              print(_controller.getValue);
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.Azalt();
              print(_controller.getValue);
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}

class MyCol extends StatelessWidget {
  final SayacController _findController = Get.find();
  MyCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'you have clicked button',
          style: TextStyle(fontSize: 32),
        ),
        GetX<SayacController>(
          builder: (_controller) => Text(
            _controller.getValue.toString(),
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Obx(
          () => Text(
            _findController.getValue.toString(),
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ],
    );
  }
}
