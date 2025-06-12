import 'package:flutter/material.dart';

Map<String, List<String>> studentLoans = {};

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  final TextEditingController studentController =
  TextEditingController(text: " ");


  final Map<String, bool> bookSelections = {
    "Sách 01": true,
    "Sách 02": true,
    "Sách 03": false,
    "Sách 04": false,
  };

  void handleAddLoan() {
    final student = studentController.text;
    final selectedBooks = bookSelections.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    studentLoans[student] = selectedBooks;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Đã mượn sách"),
        content: Text("$student đã mượn: ${selectedBooks.join(', ')}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Hệ thống\nQuản lý Thư viện",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            const Text("Sinh viên", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: studentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Thay đổi"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text("Danh sách sách", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: bookSelections.keys.map((book) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: CheckboxListTile(
                        value: bookSelections[book],
                        onChanged: (val) {
                          setState(() {
                            bookSelections[book] = val ?? false;
                          });
                        },
                        title: Text(book),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: handleAddLoan,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Text("Thêm", style: TextStyle(fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
