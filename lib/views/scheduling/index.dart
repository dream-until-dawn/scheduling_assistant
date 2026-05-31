import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class SchedulingPage extends StatelessWidget {
  const SchedulingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '排班',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    context.go('/scheduling/edit/new');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueAccent, // 主色调
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    '新建排班',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          '已有的排班模板',
          style: TextStyle(fontSize: 15, color: Colors.grey[120]),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
