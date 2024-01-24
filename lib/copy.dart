// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      child: MaterialApp(
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
    return const MaterialApp(
      home: Home(),
    );
  }
}

List<Tab> tabs = const <Tab>[
  Tab(
    child: Text("CHATS",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        )),
  ),
  Tab(
    child: Text("Profile",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        )),
  ),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                  fontWeight: FontWeight.w700,
                )),
            backgroundColor: const Color(0xff008069),
            actions: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    size: 25,
                    Icons.search,
                    color: Colors.white,
                  )),
              Image.asset(
                "assets/Group.png",
                width: 20,
                height: 20,
              ),
            ],
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: const TabBarView(children: [HomePage(), Profile()]),
        );
      }),
    );
  }
}
