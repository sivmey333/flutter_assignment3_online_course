import 'package:flutter/material.dart';
import 'package:my_assignment3/Screen/schedule_details.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedule'),
      ),
      body: DropUpListScreen(),
    );
  }
}