import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {

  static Future<List> postFile(String endpoint, String field, String filePath) async {
    var uri = Uri.parse('https://10.0.2.2:7157/$endpoint');
    
    var request = http.MultipartRequest('POST', uri);
    request.fields['bankName'] = 'FNB';
    request.files.add(
      await http.MultipartFile.fromPath('statement', filePath)
    );

    var res = await request.send();
    if (res.statusCode == 200) {
      print('Request sent successfully');
    } else {
      print('Request failed with status code: ${res.statusCode}');
    }
    if (res.statusCode == 200) {
      var val = await http.Response.fromStream(res);
      List jsonResponse = json.decode(val.body);
      return jsonResponse;
    }
    return [];
  }
  Future<void> sendRequest(String bankName, File statement) async {
    var uri = Uri.parse('https://localhost:7157/');
    
    var request = http.MultipartRequest('POST', uri);
    request.fields['bankName'] = bankName;
    request.files.add(
      await http.MultipartFile.fromPath('statement', statement.path)
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Request sent successfully');
    } else {
      print('Request failed with status code: ${response.statusCode}');
    }
  }

}