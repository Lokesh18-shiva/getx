// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:getx/services.dart';
// import 'package:getx/user_model.dart';

import 'services.dart';
import 'user_model.dart';

final userApidataProvider = FutureProvider<List<Usermodel>>((ref) {
  return ref.watch(userprovider).getusers();
});

class AnotherPage extends ConsumerWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userApidataProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Scaffold(
          body: data.when(
              data: (data) {
                // List<Usermodel> userlist = _data.map((e) => e).toList();
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (c, i) {
                      return Column(
                        children: [
                          Text(
                            data[i].address!.street.toString(),
                          ),
                          Text(
                            data[i].address!.suite.toString(),
                          ),
                          Text(
                            data[i].address!.city.toString(),
                          ),
                          Text(
                            data[i].address!.zipcode.toString(),
                          ),
                          Text(
                            data[i].address!.street.toString(),
                          ),
                        ],
                      );
                    });
              },
              error: (err, s) => const Text('error'),
              loading: (() => const Center(
                    child: CircularProgressIndicator(),
                  ))),
        ));
  }
}
