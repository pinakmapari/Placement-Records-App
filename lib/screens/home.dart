// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:placement_records/components/cityfilter.dart';
import 'package:placement_records/components/rangeslider.dart';

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
  late String cityName;
  late int year;
  late double min, max;
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
                        onPressed: () => print("Submit pressed"),
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
