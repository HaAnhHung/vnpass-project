import 'dart:convert';

import 'package:vnpass/common/url/domain.dart';
import 'package:vnpass/model/server_response.dart';
import 'package:http/http.dart' as http;

Future<ServerResponse> getWallet(String token) async {
  var url = Uri.https(Domain.devDomain, Endpoints.getWallet);
  var res = await http.get(url, headers: {
    'Authorization': "Bearer $token"
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    return ServerResponse.fromJson(json);
  } else {
    throw Exception("Fail to get api");
  }
}