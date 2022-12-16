import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/storyviews.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index)=> GestureDetector(
        onTap: (){
          Get.to(StoryViews());
        },
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[300]
            ),
            
          ),
          ),
      )
    )
        );
}
}