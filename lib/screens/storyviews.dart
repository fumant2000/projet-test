import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/widgets/progressbar.dart';
import 'package:test_app/widgets/storyA.dart';
import 'package:test_app/widgets/storyB.dart';
import 'package:test_app/widgets/storyC.dart';

class StoryViews extends StatefulWidget {
  const StoryViews({ Key? key }) : super(key: key);

  @override
  State<StoryViews> createState() => _StoryViewsState();
}

class _StoryViewsState extends State<StoryViews> {
int currentStoryIndex = 0 ;
List<double>percentValue = [] ;
@override
void initState(){
  super.initState();
  for(int i=0; i<stories.length; i++){
    percentValue.add(0);
  }
  _watchStories();
}

void _onTapDown(TapDownDetails details){
  final double screenwidth=MediaQuery.of(context).size.width;
  final double dx = details.globalPosition.dx;
  if(dx<screenwidth/2){
    setState(() {
      if(currentStoryIndex>0){
        percentValue[currentStoryIndex-1]=0;
        percentValue[currentStoryIndex]=0;
        currentStoryIndex--;
      }
    });
     } else{
        setState(() {
          if(currentStoryIndex<stories.length-1){
            percentValue[currentStoryIndex]=1;
            currentStoryIndex++;
          }else{
            percentValue[currentStoryIndex]=1;
          }
        });
      }
}

void _watchStories(){
  Timer.periodic(Duration(milliseconds: 50), (timer) {
    setState(() {
      if(percentValue[currentStoryIndex] + 0.01<1){
       percentValue[currentStoryIndex]+=0.01;
      }else{
        percentValue[currentStoryIndex]=1;
        timer.cancel();

        if(currentStoryIndex<stories.length-1){
          currentStoryIndex++;
          _watchStories();
        }else{
          Navigator.pop(context);
        }
      }
    });

   });
}



 

List<Widget> stories=[
  const StoryA(),
  const StoryB(),
  const StoryC(),
];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (details)=>_onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            stories[currentStoryIndex],
            StoryProgressBar(percentValue: percentValue)
          ],
        ),
      )
    );
  }
}