// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_this, prefer_const_declarations, prefer_const_constructors_in_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:placement_records/components/utils.dart';

class RangeSliderLabelWidget extends StatefulWidget {
  RangeSliderLabelWidget({Key? key}) : super(key: key);

  @override
  _RangeSliderLabelWidgetState createState() => _RangeSliderLabelWidgetState();
}

class _RangeSliderLabelWidgetState extends State<RangeSliderLabelWidget> {
  RangeValues values = RangeValues(10, 70);
  RangeValues valuesBottom = RangeValues(0, 2);

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderThemeData(
          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSliderSideLabel(),
            const SizedBox(height: 16),
          ],
        ),
      );

  Widget buildSliderSideLabel() {
    final double min = 0;
    final double max = 80;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSideLabel(min),
          Expanded(
            child: RangeSlider(
              values: values,
              min: min,
              max: max,
              divisions: 15,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => setState(() => this.values = values),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }

  Widget buildLabel({
    required String label,
    required Color color,
  }) =>
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ).copyWith(color: color),
      );

  Widget buildSideLabel(double value) => Container(
        width: 30,
        child: Text(
          value.round().toString() + '\nLPA',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      );
}
