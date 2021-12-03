// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  final String companyid;
  const CompanyDetails({Key? key, required this.companyid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print all details of a particular company

    return Scaffold(
      appBar: AppBar(title: Text('Company Details'),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Company Id : ' + '1',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Company Name: ' + 'XYZ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'CGPA Cutoff : ' + '8.5',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Location : ' + 'Hyderabad',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Role : ' + 'SDE',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Domain : ' + 'Web',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Package : ' + '15 LPA',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Year : ' + '2019',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
