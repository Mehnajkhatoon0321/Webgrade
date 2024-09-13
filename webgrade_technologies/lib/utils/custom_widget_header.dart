import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


class CustomHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onYearTap;

  CustomHeader({required this.focusedDay, required this.onYearTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onYearTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Text(
            DateFormat('yyyy').format(focusedDay),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
