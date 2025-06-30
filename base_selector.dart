import 'package:flutter/material.dart';

class BaseSelector extends StatelessWidget {
  final int inputBase;
  final int outputBase;
  final ValueChanged<int?> onInputChanged;
  final ValueChanged<int?> onOutputChanged;

  const BaseSelector({
    super.key,
    required this.inputBase,
    required this.outputBase,
    required this.onInputChanged,
    required this.onOutputChanged,
  });

  @override
  Widget build(BuildContext context) {
    const baseOptions = {2: "Binary", 8: "Octal", 10: "Decimal", 16: "Hex"};

    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            value: inputBase,
            decoration: const InputDecoration(
              labelText: "Input Base",
              filled: true,
              fillColor: Colors.deepPurple,
            ),
            dropdownColor: Colors.deepPurple,
            onChanged: onInputChanged,
            items: baseOptions.entries
                .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                .toList(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: outputBase,
            decoration: const InputDecoration(
              labelText: "Output Base",
              filled: true,
              fillColor: Colors.deepPurple,
            ),
            dropdownColor: Colors.deepPurple,
            onChanged: onOutputChanged,
            items: baseOptions.entries
                .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                .toList(),
          ),
        ),
      ],
    );
  }
}
