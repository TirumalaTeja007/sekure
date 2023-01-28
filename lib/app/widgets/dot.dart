import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color? color;
  final double size;

  const Dot({
    Key? key,
    this.color,
    this.size = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
