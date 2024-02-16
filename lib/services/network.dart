import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  String url;
  Networking(this.url);

  Future GetData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed To get Data From APi;  $response.statusCode');
    }
  }
}
