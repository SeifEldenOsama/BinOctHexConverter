import 'package:flutter/material.dart';

class InputButtons extends StatelessWidget {
  final int base;
  final ValueChanged<String> onPressed;

  const InputButtons({super.key, required this.base, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final symbols = List.generate(
      base,
          (i) => i < 10 ? i.toString() : String.fromCharCode(55 + i),
    );

    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: symbols
          .map((char) => ElevatedButton(
        onPressed: () => onPressed(char),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(char),
      ))
          .toList(),
    );
  }
}
