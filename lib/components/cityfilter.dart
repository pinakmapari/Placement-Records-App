// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CityFilter extends StatefulWidget {
  const CityFilter({Key? key}) : super(key: key);

  @override
  _CityFilterState createState() => _CityFilterState();
}

class _CityFilterState extends State<CityFilter> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: DropdownButton(
          value: _value,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            DropdownMenuItem(
              child: Text("Pune"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Mumbai"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("Delhi"),
              value: 3,
            ),
            DropdownMenuItem(
              child: Text("Bengluru"),
              value: 4,
            ),
            DropdownMenuItem(
              child: Text("Hyderabad"),
              value: 5,
            ),
            DropdownMenuItem(
              child: Text("Kolkata"),
              value: 6,
            )
          ],
          onChanged: (value) {
            setState(() {
              Object? _value = value;
            });
          },
          hint: Text("Select item")),
    );
  }
}
