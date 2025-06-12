import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const email = "uth@gmail.com";
    const code = "123456";
    const password = "********";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
            Image.asset('assets/images/logo.png', height: 80),
            const Text("SmartTasks",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 16),
            const Text("Confirm", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("We are here to help you!"),
            const SizedBox(height: 24),
            const TextField(
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: email,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.verified_user),
                hintText: code,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              readOnly: true,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: password,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Submit"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }
}
