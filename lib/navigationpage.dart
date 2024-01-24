import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx/Homepage.dart';

import 'product_model.dart';

class ChartPage extends ConsumerWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index;
  const ChartPage({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);

    return data.when(
        data: (data) {
          TestModel model = data[index];
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.video_call),
                  ),
                  Icon(Icons.call),
                  Icon(Icons.more_vert)
                ],
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 8.0, left: 0),
                      child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(model.avatar.toString())),
                    ),
                    Text(
                      model.firstname.toString(),
                      style: const TextStyle(color: Colors.black38),
                    ),
                  ],
                ),

                // flexibleSpace: FlexibleSpaceBar(
                //   title: Text(model.firstname.toString()),
                //   background: CircleAvatar(
                //       // radius: 50,
                //       backgroundImage: NetworkImage(model.avatar.toString())),
                // ),
                // centerTitle: true,
                backgroundColor: const Color(0xff008069),
                // leading: CircleAvatar(
                //     backgroundImage: NetworkImage(model.avatar.toString())),
                elevation: 0,
              ),
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(model.firstname.toString().toUpperCase()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(model.lastname.toString().toUpperCase()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(model.email.toString().toUpperCase()),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, s) => Text(error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
