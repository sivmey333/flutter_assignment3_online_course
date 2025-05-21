import 'package:flutter/material.dart';
import 'package:my_assignment3/Screen/add_schedule_screen.dart';
import 'package:my_assignment3/widgets/drop_up_lists.dart';
import 'package:my_assignment3/widgets/top_list.dart';

class DropUpListScreen extends StatefulWidget {
  const DropUpListScreen({super.key});

  @override
  State<DropUpListScreen> createState() => _DropUpListScreenState();
}

class _DropUpListScreenState extends State<DropUpListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          const TopList(),
          const SizedBox(height: 16),

          // Row with title and button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Schedule',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 7, 75, 131),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Angkor',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button action here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddScheduleScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.add, size: 25, color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          DropUpList(),
        ],
        ),
      ),
    );
  }
  
}
// widgets/dropup_list.dart
