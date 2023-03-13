import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String? text;
  final Color color;
  const CustomCardWidget({Key? key, this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: Center(
        child: Text(
          text ?? "",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
