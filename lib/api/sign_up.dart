import 'dart:convert';

import 'package:vnpass/common/url/domain.dart';
import 'package:vnpass/model/server_response.dart';
import 'package:http/http.dart' as http;

Future<ServerResponse> signup(String phone, String password, String name, String email) async {
  var url = Uri.https(Domain.devDomain, Endpoints.signUp);
  var res = await http.post(url, body: {
    'phone': phone,
    'password': password,
    'name': name,
    'email': email
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    return ServerResponse.fromJson(json);
  } else {
    throw Exception("Fail to get api");
  }
}