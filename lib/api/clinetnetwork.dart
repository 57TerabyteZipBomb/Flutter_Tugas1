import 'package:http/http.dart' as http;

class ClientNetwork {
  static const String baseUrl = "https://mediadwi.com/api/";

  //post method
  static Future<http.Response> postData(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse(baseUrl + endpoint);
    return await http.post(url, body: body);
  }
}