import 'package:flutter/material.dart';

class CalendarPopupContainer extends StatefulWidget {
  const CalendarPopupContainer({super.key});

  @override
  State<CalendarPopupContainer> createState() => _CalendarPopupContainerState();
}

class _CalendarPopupContainerState extends State<CalendarPopupContainer> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        //width: 80,
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          //color: Colors.amber[100],
          image: const DecorationImage(
            image: AssetImage('images/date1.avif'),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDate == null
                  ? 'Select a date'
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: const TextStyle(fontSize: 18, fontFamily: 'Tagesschrift', fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 100, 176)),
            ),
            const Icon(Icons.calendar_today, size: 30 , color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
