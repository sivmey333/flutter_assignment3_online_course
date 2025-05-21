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
          color: Colors.amber[100],
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
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today, size: 20),
          ],
        ),
      ),
    );
  }
}