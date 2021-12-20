// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:placement_records/components/cityfilter.dart';
import 'package:placement_records/components/rangeslider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:placement_records/screens/displayData.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController yearController = TextEditingController();
  List cityNames = [
    "Pune",
    "Mumbai",
    "Delhi",
    "Bengluru",
    "Hyderabad",
    "Kolkata"
  ];
  String cityName = "NA";
  int year = -1;
  double min = -1, max = -1;

  // List CompanyData = [];
  loadData(String cityName, int year, double min, double max) async {
    var headers = {'Content-Type': 'application/json'};
    var url = 'http://localhost:5001/api/company/displaybyfilter';
    // var request = http.Request(
    //     'POST', Uri.parse('http://localhost:5001/api/company/company'));
    // Map data = {
    //   "location": cityName,
    //   "year": year,
    //   "ctcFrom": min,
    //   "ctcTo": max
    // };

    Map data = {};
    if (cityName != "NA") {
      // data["location"] = cityName;
      data.putIfAbsent("location", () => cityName);
    }
    if (min != -1 && max != -1) {
      data.putIfAbsent("ctcFrom", () => min);
      data.putIfAbsent("ctcTo", () => max);
    }
    if (year != -1) {
      data.putIfAbsent("year", () => year);
    }
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    //print("${response.statusCode}");
    //print("${response.body}");
    List<dynamic> companyList;
    Map<String, dynamic> decodedData = json.decode(response.body);
    print("decoded data: $decodedData ");
    companyList = decodedData["company"];

    setState(() {
      companyList = decodedData["company"] as List;
    });
    return companyList;
  }

  String search = '';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placement Records App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Color(0xffE3EEFF),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE3EEFF),
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE3EEFF),
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    hintText: "Search",
                  ),
                  onChanged: (value) => search = value,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Text('Enter Package Range: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE3EEFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          hintText: 'Min LPA',
                        ),
                        onChanged: (value) =>
                            setState(() => min = double.parse(value)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE3EEFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          hintText: 'Max LPA',
                        ),
                        onChanged: (value) =>
                            setState(() => max = double.parse(value)),
                      ),
                    ),
                  ],
                ),
              ),

              //RangeSliderLabelWidget(),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter City: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    //CityFilter(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE3EEFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          hintText: 'Enter city',
                        ),
                        onChanged: (value) => setState(() => cityName = value),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Enter Year: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: yearController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE3EEFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          //labelText: 'Academic Year',
                          hintText: 'Enter year',
                        ),
                        onChanged: (value) =>
                            setState(() => year = int.parse(value)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        child: Text(
                          "     Submit    ",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
                          var decodedData =
                              await loadData(cityName, year, min, max);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DisplayData(data: decodedData),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[400],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
