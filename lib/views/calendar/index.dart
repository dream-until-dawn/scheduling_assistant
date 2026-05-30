import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      children: [
        Text('日历', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),

        const SizedBox(height: 6),

        Text(
          '2026年5月',
          style: TextStyle(fontSize: 15, color: Colors.grey[120]),
        ),

        const SizedBox(height: 24),

        // CalendarWidget(),
      ],
    );
  }
}
