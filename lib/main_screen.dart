import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('실로폰')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            keybord('도', Colors.red),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: keybord('레', Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: keybord('미', Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: keybord('파', Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: keybord('솔', Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: keybord('라', Colors.blueGrey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: keybord('시', Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 56),
              child: keybord('도', Colors.red),
            ),
          ],
        ));
  }

  Widget keybord(String text, Color color) {
    return Container(
      width: 50,
      height: double.infinity,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
