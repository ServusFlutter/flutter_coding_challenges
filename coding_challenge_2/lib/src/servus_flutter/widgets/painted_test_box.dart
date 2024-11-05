import 'package:flutter/material.dart';

class PaintedTestBox extends StatelessWidget {
  final GlobalKey challengerWidgetKey;
  final Widget challengerWidget;

  const PaintedTestBox({
    super.key,
    required this.challengerWidget,
    required this.challengerWidgetKey,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: challengerWidgetKey,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: challengerWidget,
      ),
    );
  }
}
