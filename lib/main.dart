// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import './Homepage.dart';
import './profile.dart';

// import 'Homepage.dart';

void main() {
  runApp(const MyApp());             
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const S_APP(),
      ),
    );
  }
}

class S_APP extends StatelessWidget {
  const S_APP({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

List<Tab> tabs = const <Tab>[
  Tab(
    child: Text("Chats",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        )),
  ),
  Tab(
    child: Text("Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        )),
  ),
];

class Home extends ConsumerWidget {
  Home({super.key});
  final colorsProvider = StateProvider((ref) => true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final y = ref.watch(colorsProvider);
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text("WhatsApp",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            backgroundColor: const Color(0xff008069),
            actions: [

              GestureDetector(
                  child: colors == true
                      ? const Icon(Icons.airplanemode_active_sharp)
                      : const Icon(Icons.airplanemode_inactive_rounded),
                  onTap: () {
                    final c = ref.read(colorsProvider.notifier);

                    c.state == true ? c.state = false : c.state = true;
                  }
                  // ,onLongPress: ()=>Get.dialog(time[index],
                  // //  colors.toString(),
                  // // reverseAnimationCurve: Curves.easeInOutBack,
                  // // forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
                  // // snackPosition: SnackPosition.TOP
                  // ),
                  ),
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    size: 25,
                    Icons.search,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/Group.png",
                  width: 20,
                  height: 20,
                ),
              ),
            ],
            bottom: TabBar(
              overlayColor: MaterialStateProperty.all(
                const Color(0xff008069),
              ),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: tabs,
            ),
          ),
          body: const TabBarView(children: [HomePage(), Profile()]),
        );
      }),
    );
  }
}
