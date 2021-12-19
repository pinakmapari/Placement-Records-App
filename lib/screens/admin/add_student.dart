import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  late String studentId;
  late String studentName;
  late FToast fToast;
  late String skill_set;
  late String department;
  late String mail_id;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  loadData(String studentName, String skill_set, String mail_id) async {
    var headers = {'Content-Type': 'application/json'};
    var url = 'http://localhost:5001/api/student/student';
    // var request = http.Request(
    //     'POST', Uri.parse('http://localhost:5001/api/company/company'));
    Map data = {
      "student_name": studentName,
      "department": "CS dept (hardcoded)",
      "skillset": skill_set,
      "student_mail": mail_id
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
        title: Text('Add Student Details'),
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
                      labelText: 'Student Id',
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
                    onSaved: (value) => setState(() => studentId = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Student Name',
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
                    onSaved: (value) => setState(() => studentName = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Skill Set',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    minLines: 1,
                    maxLines: 3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'Enter at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => skill_set = value!),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Enter a valid Email Address';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => setState(() => mail_id = value!),
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
        loadData(studentName, skill_set, mail_id);
      }
      await showToast('Student Added Successfully!', Colors.green, Icons.check);
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
