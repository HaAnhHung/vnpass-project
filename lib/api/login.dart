import 'dart:convert';

import 'package:vnpass/common/url/domain.dart';
import 'package:vnpass/model/server_response.dart';
import 'package:http/http.dart' as http;

Future<ServerResponse> login(String phone, String pass, {String? name, String? email}) async {
  var url = Uri.https(Domain.devDomain, Endpoints.login);
  var res = await http.post(url, headers: {
    'phone': phone,
    'password': pass,
    'name': name ?? "",
    'email': email ?? ""
  });
  if (res.statusCode == 200) {
    ServerResponse serverResponse = ServerResponse.fromJson(jsonDecode(res.body));
    return serverResponse;
  } else {
    throw Exception("Fail to get api");
  }
}