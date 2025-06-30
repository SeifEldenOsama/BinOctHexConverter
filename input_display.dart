import 'package:flutter/material.dart';

class InputDisplay extends StatelessWidget {
  final String value;
  final VoidCallback onClear;

  const InputDisplay({super.key, required this.value, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value),
      readOnly: true,
      style: const TextStyle(fontSize: 24),
      decoration: InputDecoration(
        labelText: "Input",
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: onClear,
        ),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
