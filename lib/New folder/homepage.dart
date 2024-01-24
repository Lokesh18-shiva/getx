import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Another.dart';
// import 'package:getx/Another.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:getx/Riverpod.dart';

class GetsController extends GetxController {
  RxInt count = 0.obs;

  increment() {
    // ignore: unrelated_type_equality_checks
    if (count == 20) {
      count = 0.obs;
      return Get.snackbar("title", 'j');
    }
    count.value++;
  }
}

class Homepage extends GetView<GetsController> {
  Homepage({super.key});
  @override
  final GetsController controller = Get.put(GetsController());
Future<String> example( ref) async {
  return Future.value('foo');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.increment;
          Get.to(const AnotherPage());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.changeTheme(Get.isDarkMode
                          ? ThemeData.light()
                          : ThemeData.dark());
                      Get.defaultDialog(
                          title: 'GetX Alert',
                          middleText: 'Simple GetX alert',
                          textConfirm: 'Okay',
                          confirmTextColor: Colors.white,
                          textCancel: 'Cancel');
                    },
                    child: const Icon(Icons.abc_outlined)),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Obx(() => Center(
                    child: Text(
                      controller.count.toString(),
                    ),
                  )),
            ),
            Container(
              color: Colors.lightBlueAccent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GetX<GetsController>(
                  init: GetsController(),
                  builder: (builder) => Center(
                      child: TextButton(
                          onPressed: () {
                            Get.to(const AnotherPage());
                          },
                          child: Text("2${controller.count.toString()}")))),
            )
          ],
        ),
      ),
    );
  }
}
