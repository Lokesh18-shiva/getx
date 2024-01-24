// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:getx/product_model.dart';
import './services.dart';
// import './user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigationpage.dart';

final userDataProvider = FutureProvider<List<TestModel>>((ref) async {
  return ref.watch(apiDataRetrive).getusers();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        body: _data.when(
            data: (_data) {
              final List time = [
                "9.19am",
                "2.39am",
                "3.49am",
                "4.59am",
                "5.29am",
                "6.09am",
              ];
              // final List<TestModel> userlist = _data
              //     .map((e) => e)
              //     .toList(); // to get json data through the map
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _data.length,
                          itemBuilder: ((context, index) {
                            TestModel model = _data[index];
                            return GestureDetector(
                              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: ((context) => ChartPage(index: index)))),
                              child: ListTile(
                                  title: Text(model.firstname.toString()),
                                  subtitle: Text(model.lastname.toString()),
                                  trailing:Text(time[index]),
                                  leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(model.avatar.toString()))),
                            );

                            //  Card(
                            //   child: Column(
                            //     children: [
                            //       Text(model.id.toString()),
                            //       Text(model.email.toString()),
                            //       Text(model.firstname.toString()),
                            //       Text(model.lastname.toString()),
                            //       Text(model.avatar.toString()),
                            //     ],
                            //   ),
                            // );
                          })))
                ],
              );
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
