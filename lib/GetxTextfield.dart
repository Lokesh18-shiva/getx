// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:getx/New%20folder/homepage.dart';

// ignore: must_be_immutable
void main() {
  runApp(ProviderScope(
    child: GetMaterialApp(
      home: MyGetTextField(),
    ),
  ));
}

class MyGetTextField extends ConsumerWidget {
  MyGetTextField({super.key});
  final _formkey = GlobalKey<FormState>();
  // var checkerEmail = true;
  // ignore: prefer_typing_uninitialized_variables

  final _ebtnn = StateProvider((ref) => false);
  final _hidee = StateProvider((ref) => true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _UserController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ebtn = ref.watch(_ebtnn);
    final _hide = ref.watch(_hidee);
    // var ebtn;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/pro.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                          ref.read(_ebtnn.notifier).state =
                              _formkey.currentState!.validate();
                        },
                        controller: _UserController,
                        decoration:
                            const InputDecoration(labelText: "Enter your Name"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          // ignore: unnecessary_null_comparison
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name';
                          } else if (value.contains(RegExp(r'[0-9]')) == true ||
                              value.contains(RegExp(r'[!@#$%^&*()]')) == true ) {
                            return 'Please Remove SpecialCharacter or space';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        onChanged: (value) {
                          ref.read(_ebtnn.notifier).state =
                              _formkey.currentState!.validate();
                        },
                        controller: _emailController,
                        // onSaved: (newValue) {
                        //   _emailController = newValue.toString();
                        // },
                        decoration: const InputDecoration(
                            labelText: "Enter your Email"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          // ignore: unnecessary_null_comparison
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (value.length <= 10 ||
                              value.contains(RegExp(r'[A-Z]'))) {
                            return 'Please enter valid email or Its In Cap';
                          } else if (value.contains("@") == false || value.contains(".com") == false) {
                            return 'Please enter @ email';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        obscureText: _hide,
                        obscuringCharacter: '*',
                        onChanged: (value) {
                          ref.read(_ebtnn.notifier).state =
                              _formkey.currentState!.validate();
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                            suffix: GestureDetector(
                              child: _hide
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onTap: () {
                                final v = ref.read(_hidee.notifier);
                                _hide ? v.state = !_hide : v.state = !_hide;
                              },
                            ),
                            labelText: "Enter your Paaword"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          // ignore: unnecessary_null_comparison
                          if (value == null || value.isEmpty) {
                            return 'Please your Password';
                          } else if (value.length < 6) {
                            return 'Your password is to small';
                          } else if (value.contains(RegExp(r'[A-Z]')) ==
                                  false ||
                              value.contains(RegExp(r'[0-9]')) == false ||
                              value.contains(RegExp(r'[!@#$%^&*()/_.]')) ==
                                  false) {
                            return 'Please Strong Creditals';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        child: ElevatedButton(
                            // style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                            onPressed: _ebtn
                                ? () {
                                    final formstate = _formkey.currentState;
                                    if (formstate!.validate()) {
                                      Get.snackbar(
                                        _UserController.text.trim(),
                                        "${_emailController.text.trim().toLowerCase()} + ${_passwordController.text.trim()}",
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('Login Faild')));
                                    }
                                  }
                                : null,
                            child: const Text('Submit')))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
