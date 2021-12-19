// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class Back extends StatefulWidget {
  const Back({Key? key}) : super(key: key);

  @override
  _BackState createState() => _BackState();

  static void webcall() {
    print('hi');
  }

  static void insertCompany() {
    print('object');
  }
}

class _BackState extends State<Back> {
  @override
  bool visible = false;
  Future insertCompany() async {
    print('hi');
    // Showing CircularProgressIndicator using State.
    setState(() {
      visible = true;
    });

    // API URL
    var url = 'https://flutter-examples.000webhostapp.com/submit_data.php';

    // Store all data with Param Name.
    var data = json.encode({
      "company_name": "TCS-7",
      "cgpa_cutoff": "8",
      "hr_mail": "hr@g.com",
      "ctc_offered": 5,
      "role": "SDE",
      "domain": "Start up",
      "year": "2020",
      "location": "Pune"
    });
    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
