import 'dart:convert';

import 'package:vnpass/common/url/domain.dart';
import 'package:vnpass/model/server_response.dart';
import 'package:http/http.dart' as http;

Future<ServerResponse> setWalletPassword(String token, String accountPassword, String walletPassword) async {
  var url = Uri.https(Domain.devDomain, Endpoints.walletPassword);
  var res = await http.patch(url, headers: {
    'Authorization': "Bearer $token"
  }, body: {
    'accountPassword': accountPassword,
    'walletPassword': walletPassword
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    return ServerResponse.fromJson(json);
  } else {
    throw Exception("Fail to patch api");
  }
}