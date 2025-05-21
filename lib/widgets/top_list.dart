import 'package:flutter/material.dart';

class TopList extends StatelessWidget {
  const TopList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180 + 32, // Height of containers + padding
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(''),
            ),
            const SizedBox(width: 16),
            Container(
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
