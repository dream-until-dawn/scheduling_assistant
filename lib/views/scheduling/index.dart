import 'package:flutter/material.dart';

class SchedulingPage extends StatelessWidget {
  const SchedulingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      children: [
        Text('排班', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),

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
