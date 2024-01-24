import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:getx/user_model.dart';
import 'package:http/http.dart';

import 'user_model.dart';

class ApiServices {
  String url = 'https://jsonplaceholder.typicode.com/users';
  Future<List<Usermodel>> getusers() async {
    Response response = await get(Uri.parse(url));
    // print(response);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => Usermodel.fromJson(e))).toList();//sent to factory to rewrite the subclass and data in usermodel
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userprovider = Provider<ApiServices>((ref) => ApiServices());
