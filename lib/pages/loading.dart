// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:world_time/model/world_time_class.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpTime() async {
    WorldTime worldTime = WorldTime(location: 'Pakistan', url: 'Asia/Karachi');
    await worldTime.getTime().then((value) {
      // print('loadig: ${worldTime.date}');
      // print('loadig: ${worldTime.time}');
      Navigator.pushReplacementNamed(
        context, '/home',
        arguments: {
          'name': worldTime.location,
          'time': worldTime.time,
        },
        );
        
    });
  }

  @override
  void initState() {
    setUpTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Loading Screen'),
        ],
      ),
    );
  }
}
