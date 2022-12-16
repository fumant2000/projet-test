
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_app/widgets/storyCircle.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.3),
        title: Text('My Stories', style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(child: StoryCircle()),
    );
  }
}