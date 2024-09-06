import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Color(0xf0f0f0f0),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}