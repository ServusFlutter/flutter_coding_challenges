import 'package:flutter/material.dart';

class SizedTestBox extends StatelessWidget {
  final Widget child;

  const SizedTestBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
      ),
      child: SizedBox(
        height: 350,
        width: 350,
        child: child,
      ),
    );
  }
}
