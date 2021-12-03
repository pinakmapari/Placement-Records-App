// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  final String studentid;
  const StudentDetails({Key? key, required this.studentid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print all details of a particular company

    return Scaffold(
      appBar: AppBar(title: Text('Student Details'),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Student Id : ' + '1',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Student Name: ' + 'Sejal',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Department : ' + 'CE',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Skill Set : ' + 'C++, Python',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'E-mail : ' + 'sejalpekam@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
             
            ],
          ),
        ),
      ),
    );
  }
}
