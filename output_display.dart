import 'package:flutter/material.dart';

class OutputDisplay extends StatelessWidget {
  final String value;
  final AnimationController animation;

  const OutputDisplay({
    super.key,
    required this.value,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
      child: TextField(
        controller: TextEditingController(text: value),
        readOnly: true,
        style: const TextStyle(fontSize: 24, color: Colors.greenAccent),
        decoration: InputDecoration(
          labelText: "Output",
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
