import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.251.43/api/";

  static addAuth(Map data) async {
    print(data);
    var url = Uri.parse("${baseUrl}add_name");
    try {
      final res = await http.post(url, body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        //
        print("failed to connect");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
