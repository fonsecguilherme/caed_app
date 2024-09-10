import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.packageAmout,
    required this.color,
    required this.percentage,
    required this.title,
  });

  final int packageAmout;
  final Color color;
  final int percentage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                color: color,
                height: 10,
                width: 10,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title),
                  ],
                ),
                Text('$packageAmout pacotes'),
              ],
            ),
          ],
        ),
        Text(
          '$percentage%',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff828282),
          ),
        )
      ],
    );
  }
}
