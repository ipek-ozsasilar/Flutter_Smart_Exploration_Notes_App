import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    required this.icon, required this.color, required this.size, super.key,
  });

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size);
  }
}
