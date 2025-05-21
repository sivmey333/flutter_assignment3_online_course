// widgets/dropup_button.dart
import 'package:flutter/material.dart';

class DropUpButton extends StatefulWidget {
  const DropUpButton({super.key});

  @override
  State<DropUpButton> createState() => _DropUpButtonState();
}

class _DropUpButtonState extends State<DropUpButton> {
  bool _isMenuVisible = false;

  final List<Map<String, dynamic>> menuItems = [
    {'label': 'Edit', 'color': Colors.blue[500]},
    {'label': 'Delete', 'color': Colors.red.shade400},
  ];

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void _selectItem(String label) {
    setState(() {
      _isMenuVisible = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Selected: $label")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.more_horiz),
          iconSize: 24,
          tooltip: 'More options',
          onPressed: _toggleMenu,
        ),
        if (_isMenuVisible)
          Positioned(
            top: -80, // Drop-up position
            right: -20,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                width: 120,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuItems.map((item) {
                    return _buildMenuItem(item['label'], item['color']);
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMenuItem(String label, Color? bgColor) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () => _selectItem(label),
        child: Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
