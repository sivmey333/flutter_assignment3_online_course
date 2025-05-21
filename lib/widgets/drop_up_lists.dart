import 'package:flutter/material.dart';
import 'package:my_assignment3/widgets/dropup_container.dart';

class DropUpList extends StatelessWidget {
  const DropUpList({super.key});

  static const List<Map<String, String>> items = [
    {'text': 'Learn Khmer Subject', 'label': 'Monday'},
    {'text': 'Learn English', 'label': 'Tuesday'},
    {'text': 'Review the lesson', 'label': 'Wednesday'},
    {'text': 'Learn Math', 'label': 'Thursday'},
    {'text': 'Learn Biology', 'label': 'Friday'},
    {'text': 'Review the lesson', 'label': 'Saturday'},
    {'text': 'Do Exercises', 'label': 'Sunday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: DropUpContainer(
            text: item['text']!,
            label: item['label']!,
            labelsize: '16',
          ),
        );
      }).toList(),
    );
  }
}
