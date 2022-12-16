import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
  double percentValue=0.1;
   MyProgressBar({ Key? key, required this.percentValue }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 3,
      percent: percentValue,
      progressColor: Colors.grey,
      backgroundColor: Colors.black,
    );
  }
}
class StoryProgressBar extends StatelessWidget {
   StoryProgressBar({ Key? key, required this.percentValue }) : super(key: key);

  List<double>percentValue=[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            child: MyProgressBar(percentValue: percentValue[0])
            ),
            Expanded(
            child: MyProgressBar(percentValue: percentValue[1])
            ),
            Expanded(
            child: MyProgressBar(percentValue: percentValue[2])
            ),
        ],
      ),

     );
  }
}