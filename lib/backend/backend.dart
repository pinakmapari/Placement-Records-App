// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

Map jsonData = {};
String url = 'http://10.0.2.2:3000';
int statusCode = 0;

class Backend {
  Map getData() {
    return jsonData;
  }

  int getStatusCode() {
    return statusCode;
  }

  //insert company
  void insertCompany() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:3000/api/company/company'));
    request.body = json.encode({
      "company_name": "TCS-7",
      "cgpa_cutoff": "8",
      "hr_mail": "hr@g.com",
      "ctc_offered": 5,
      "role": "SDE",
      "domain": "Start up",
      "year": "2020",
      "location": "Pune"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Map> fetchData(String page) async {
    final response = await http.get(url + page);
    statusCode = response.statusCode;
    if (response.statusCode == 200) {
      String data = response.body;

      jsonData = jsonDecode(data);
      return jsonData;
    } else {
      return {"errorMessage": 'Error fetching data'};
    }
  }
}
