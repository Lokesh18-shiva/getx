import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx/product_model.dart';
import 'package:http/http.dart';
// import './user_model.dart';

const String endpiont = 'https://reqres.in/api/users?page=2';

class ApiServices {
  Future<List<TestModel>> getusers() async {
    Response request = await get(Uri.parse(endpiont));
    if (request.statusCode == 200) {
      final List result = jsonDecode(request.body)['data'];
      return result.map((e) => TestModel.fromJson(e)).toList();// to sent json data through the map
    } else {
      throw Exception(request.reasonPhrase);
    }
  }
}
final apiDataRetrive = Provider<ApiServices>((ref) =>ApiServices());

