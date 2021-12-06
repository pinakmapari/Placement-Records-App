// // ignore_for_file: avoid_print, unused_element

// import 'dart:convert';
// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Map jsonData = {};
// String url = 'http://10.0.2.2:3000';
// int statusCode = 0;

// class Backend extends StatefulWidget {
//   const Backend({Key? key}) : super(key: key);

//   Backend createState() => Backend();
//   @override
//   // ignore: no_logic_in_create_state
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

// class _BackendState extends State<Backend> {
//   @override
//   bool visible = false;
//   Future webCall() async {
//     // Showing CircularProgressIndicator using State.
//     setState(() {
//       visible = true;
//     });

//     // API URL
//     var url = 'https://flutter-examples.000webhostapp.com/submit_data.php';

//     // Store all data with Param Name.
//     var data = json.encode({
//       "company_name": "TCS-7",
//       "cgpa_cutoff": "8",
//       "hr_mail": "hr@g.com",
//       "ctc_offered": 5,
//       "role": "SDE",
//       "domain": "Start up",
//       "year": "2020",
//       "location": "Pune"
//     });
//     // Starting Web Call with data.
//     var response = await http.post(url, body: json.encode(data));

//     // Getting Server response into variable.
//     var message = jsonDecode(response.body);

//     // If Web call Success than Hide the CircularProgressIndicator.
//     if (response.statusCode == 200) {
//       setState(() {
//         visible = false;
//       });
//     }
//   }
// }

// //insert company
// Future insertCompany() async {
  
//   var headers = {'Content-Type': 'application/json'};
//   var request = http.Request(
//       'POST', Uri.parse('http://10.0.2.2:3000/api/company/company'));
//   request.body = json.encode({
//     "company_name": "TCS-7",
//     "cgpa_cutoff": "8",
//     "hr_mail": "hr@g.com",
//     "ctc_offered": 5,
//     "role": "SDE",
//     "domain": "Start up",
//     "year": "2020",
//     "location": "Pune"
//   });
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }

// Future<Map> fetchData(String page) async {
//   final response = await http.get(url + page);
//   statusCode = response.statusCode;
//   if (response.statusCode == 200) {
//     String data = response.body;
//     jsonData = jsonDecode(data);
//     return jsonData;
//   } else {
//     return {"errorMessage": 'Error fetching data'};
//   }
// }
