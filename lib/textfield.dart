// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
void main() {
  runApp(const MaterialApp(
    home: MyTextFormField(),
  ));
}

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({super.key});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final _formkey = GlobalKey<FormState>();
  // var checkerEmail = true;
  // ignore: prefer_typing_uninitialized_variables
  var _ebtn;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void textvaliadtor() {
    final formstate = _formkey.currentState;
    if (formstate!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login Faild')));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                      onChanged: (value) {
                        setState(
                            () => _ebtn = _formkey.currentState!.validate());
                        // setState(() {

                        //    checkerEmail==true?checkerEmail=false:checkerEmail=true;
                        // });
                      },
                      controller: _emailController,
                      // onSaved: (newValue) {
                      //   _emailController = newValue.toString();
                      // },
                      decoration:
                          const InputDecoration(labelText: "Enter your name"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        // ignore: unnecessary_null_comparison
                        if (value == null || value.isEmpty) {
                          return 'Please your email';
                        } else if (value.length <= 10) {
                          return 'Please enter valid email';
                        } else if (value.contains("@") == false) {
                          return 'Please enter @ email';
                        } else {
                          return null;
                        }
                      }),
                  TextFormField(
                      onChanged: (value) {
                        setState(
                            () => _ebtn = _formkey.currentState!.validate());
                      },
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: "Enter your Paaword"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        // ignore: unnecessary_null_comparison
                        if (value == null || value.isEmpty) {
                          return 'Please your Password';
                        } else if (value.length < 6) {
                          return 'Your password is to small';
                        } else if (value.contains(RegExp(r'[A-Z]')) == false ||
                            value.contains(RegExp(r'[0-9]')) == false ||
                            value.contains(RegExp(r'[!@#$%^&*()]')) == false) {
                          return 'Please Strong Creditals';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    child: _ebtn == true
                        ? ElevatedButton(
                            onPressed: textvaliadtor,
                            child: const Icon(Icons.login))
                        : null,
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
