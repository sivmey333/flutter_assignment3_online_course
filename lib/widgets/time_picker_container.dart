// import 'package:flutter/material.dart';

// class TimePickerContainer extends StatefulWidget {
//   const TimePickerContainer({super.key});

//   @override
//   State<TimePickerContainer> createState() => _TimePickerContainerState();
// }

// class _TimePickerContainerState extends State<TimePickerContainer> {
//   TimeOfDay? _selectedTime;

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime ?? TimeOfDay.now(),
//     );

//     if (picked != null && picked != _selectedTime) {
//       setState(() {
//         _selectedTime = picked;
//       });
//     }
//   }

//   String _formatTime(TimeOfDay? time) {
//     if (time == null) return 'Select Time';
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     return TimeOfDay.fromDateTime(dt).format(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _selectTime(context),
//       child: Container(
//         height: 150,
//         //width: 120,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.blue[100],
//           border: Border.all(color: Colors.blue, width: 2),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               _formatTime(_selectedTime),
//               style: const TextStyle(fontSize: 16),
//             ),
//             const Icon(Icons.access_time, size: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';

class TimePickerContainer extends StatefulWidget {
  const TimePickerContainer({super.key});

  @override
  State<TimePickerContainer> createState() => _TimePickerContainerState();
}

class _TimePickerContainerState extends State<TimePickerContainer> {
  TimeOfDay? _selectedTime;
  Timer? _timer;
  bool _alertShown = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimerMonitor() {
    _timer?.cancel(); // Cancel any previous timer
    _alertShown = false;

    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (_selectedTime == null || _alertShown) return;

      final now = DateTime.now();
      final selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      final difference = selectedDateTime.difference(now);

      if (difference.inMinutes == 15 && difference.inSeconds < 900) {
        _alertShown = true; // prevent multiple alerts

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('⏰ Only 15 minutes left until your scheduled time!'),
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 4),
            ),
          );
        }
      }
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });

      _startTimerMonitor(); // Start monitoring after time selection
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Select Time';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        height: 150,
        //width: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          //color: Colors.blue[100],
          image: const DecorationImage(
            image: AssetImage('images/time2.jpeg'),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatTime(_selectedTime),
              style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.access_time, size: 30, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
