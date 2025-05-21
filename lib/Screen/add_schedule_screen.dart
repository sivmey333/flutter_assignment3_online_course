import 'package:flutter/material.dart';
import 'package:my_assignment3/widgets/date_picker_container.dart';
import 'package:my_assignment3/widgets/time_picker_container.dart';

class AddScheduleScreen extends StatelessWidget {
  const AddScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 34, 162, 132),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Add Schedule", style: TextStyle(fontFamily: 'Tagesschrift',color: Colors.white),)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Title', style: TextStyle(fontFamily: 'Angkor', fontSize: 18),),
              const SizedBox(height: 15),

              // Top TextField
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                  labelStyle: TextStyle(fontFamily: 'Tagesschrift', fontSize: 15),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Date and Time Container Row
              Text('Set Date and Time', style: TextStyle(fontFamily: 'Angkor', fontSize: 18)),
              const SizedBox(height: 15),
              Container(

                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Row(
                  children: [
                    Expanded(child: CalendarPopupContainer()),
                    SizedBox(width: 10),
                    TimePickerContainer(),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Bottom TextField
              Text('Description', style: TextStyle(fontFamily: 'Angkor', fontSize: 18)),
              const SizedBox(height: 15),
              const TextField(
      
                maxLines: 8,
                decoration: InputDecoration(
                
                  labelText: 'Enter Description',
                  labelStyle: TextStyle(fontFamily: 'Tagesschrift', fontSize: 15),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 20),

              // Button Row
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // New action
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue, width: 1),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text('New',style: TextStyle(color: Colors.white),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Cancel action
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey, width: 1),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Save action
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.green, width: 1),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text('Save',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
