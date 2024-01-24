import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import 'GetxTextfield.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(31, 190, 173, 173),
                    radius: 70,
                    backgroundImage: AssetImage("assets/pro.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, left: 80),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => MyGetTextField())));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                final List list1 = ['Name', 'About', 'Phone'];
                final List list2 = ['Me', '-', '9848487387'];
                final List<Icon> list3 = [
                  const Icon(Icons.person),
                  const Icon(Icons.error_outline_rounded),
                  const Icon(Icons.phone)
                ];
                return ListTile(
                  title: Text(
                    list1[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  subtitle: Text(
                    list2[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontSize: 20),
                  ),
                  leading: list3[index],
                );
              })
        ],
      ),
    );
  }
}
