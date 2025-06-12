// screens/student_screen.dart
import 'package:flutter/material.dart';
import 'manage_screen.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Danh sách sinh viên và sách đã mượn",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: studentLoans.entries.map((entry) {
                  return Card(
                    child: ListTile(
                      title: Text(entry.key),
                      subtitle: Text(entry.value.isEmpty
                          ? "Chưa mượn sách"
                          : "Đã mượn: ${entry.value.join(', ')}"),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
