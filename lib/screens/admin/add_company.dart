import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:placement_records/mysql.dart';
import 'package:placement_records/screens/admin/company.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  _AddCompanyState createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final _formKey = GlobalKey<FormState>();
  late String companyId;
  late String companyName;

  late FToast fToast;
  late double cutoff;
  late String location;
  late String role;
  late String domain;
  late double package;
  late String hr_mail;
  late int year;

  void _addCompany(double CGPA_cutoff, String Location, String role,
      String HR_Mail_id, double ctc_offered, String year, String companyName) {}
  void initState() {
    //loadData();
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  // List CompanyData = [];
  loadData(double CGPA_cutoff, String Location, String role, String HR_Mail_id,
      double ctc_offered, int year, String companyName, String domain) async {
    var headers = {'Content-Type': 'application/json'};
    var url = 'http://localhost:5001/api/company/company';
    // var request = http.Request(
    //     'POST', Uri.parse('http://localhost:5001/api/company/company'));
    Map data = {
      "company_name": companyName,
      "cgpa_cutoff": CGPA_cutoff,
      "location": Location,
      "hr_mail": HR_Mail_id,
      "ctc_offered": ctc_offered,
      "role": role,
      "domain": domain,
      "year": year
    };
    //request.headers.addAll(headers);

    //http.StreamedResponse streamedResponse = await request.send();

    //var response = await http.Response.fromStream(streamedResponse);
    //var jsonBody = json.encode(response.body);

    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;

    // setState(() {
    //   courierCompanyList = jsonBody["courier_list"];

    //   if (courierCompanyList == null) {
    //     courierIsEmpty = true;
    //   } else {
    //     courierIsEmpty = false;
    //     print(courierCompanyList);
    //   }
    // });
  }

  showToast(String message, Color? c, IconData? i) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: c,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(i),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Company Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Company Id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 1) {
                        return 'Enter some number';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => companyId = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Company Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'Enter at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => companyName = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'CGPA Cutoff',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 1) {
                        return 'Enter at least 1 digit';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) =>
                        setState(() => cutoff = double.parse(value!)),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'Enter at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => location = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Enter at least 2 characters';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => role = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Domain',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Enter at least 2 characters';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => domain = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Package',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 1) {
                        return 'Enter at least 1 digit';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) =>
                        setState(() => package = double.parse(value!)),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'HR Mail Id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 1) {
                        return 'Enter a valid mail address';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => hr_mail = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Year',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length != 4) {
                        return 'Enter a valid year';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) =>
                        setState(() => year = int.parse(value!)),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 40.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _submit();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    try {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();

      if (isValid) {
        _formKey.currentState!.save();
        loadData(cutoff, location, role, hr_mail, package, year, companyName,
            domain);
      }
      await showToast('Company Added Successfully!', Colors.green, Icons.check);
      _formKey.currentState!.reset();
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => CompanyPage()),
      //     (Route<dynamic> route) => false);

    } catch (e) {
      print('Error: $e');
      showToast(
          'Something went wrong. \nKindly try again.', Colors.red, Icons.error);
    }
  }
}
