// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  //final String companyid;
  final details;
  const CompanyDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print all details of a particular company

    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company Id : ' + '${details['company_id']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Company Name: ' + '${details['company_name']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'CGPA Cutoff : ' + '${details['cgpa_cutoff']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Location : ' + '${details['location']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Role : ' + '${details['role']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Domain : ' + '${details['domain']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Package : ' + '${details['ctc_offered']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'HR Mail Id : ' + '${details['hr_mail']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Year : ' + '${details['year']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
