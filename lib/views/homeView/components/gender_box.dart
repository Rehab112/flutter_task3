import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  Border border;
  MaterialButton button;

  GenderBox({required this. border, required this. button});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[900],
        border: border,
      ),
      child: button,
    );
  }
}
