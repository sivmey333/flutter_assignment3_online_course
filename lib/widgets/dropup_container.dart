// widgets/dropup_container.dart
import 'package:flutter/material.dart';
import 'package:my_assignment3/widgets/dropup_button.dart';
//import 'package:my_assignment3/widgets/dropup_button.dart';

class DropUpContainer extends StatelessWidget {
  final String text;
  final String label;

  const DropUpContainer({super.key, required this.text, required this.label, required String labelsize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Your',
        //       style: const TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ],
        // ),
        Stack(
          children: [
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade700.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       Text(
                        text,
                        style: const TextStyle(fontSize: 16, fontFamily: 'Tagesschrift'),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Text(
                      //   label,
                      //   style: const TextStyle(fontSize: 16),
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    const DropUpButton(),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  color: Colors.white,
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Angkor'),
                  ),
                ),
              ),
            ],
        )
      ],
      
    );
  }
}
