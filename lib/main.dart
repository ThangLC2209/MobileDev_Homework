import 'package:flutter/material.dart';

void main() {
  runApp(const AgeCheckerApp());
}

class AgeCheckerApp extends StatelessWidget {
  const AgeCheckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  const AgeCheckerScreen({super.key});

  @override
  State<AgeCheckerScreen> createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String result = '';

  void checkAge() {
    FocusScope.of(context).unfocus(); // Ẩn bàn phím
    final name = nameController.text;
    final age = int.tryParse(ageController.text);

    if (name.isEmpty || age == null || age <= 0 || age > 120) {
      setState(() {
        result = 'Vui lòng nhập đầy đủ họ tên và tuổi hợp lệ (1-120).';
      });
      return;
    }

    String category;
    if (age > 65) {
      category = 'Người già';
    } else if (age >= 6) {
      category = 'Người lớn';
    } else if (age >= 2) {
      category = 'Trẻ em';
    } else {
      category = 'Em bé';
    }

    setState(() {
      result = '$name thuộc nhóm: $category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'THỰC HÀNH 01',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Họ và tên',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Tuổi',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: checkAge,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('Kiểm tra'),
              ),
              const SizedBox(height: 24),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
