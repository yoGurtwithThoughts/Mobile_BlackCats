import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeInWidget({required this.child, required this.delay, super.key});

  @override
  State<FadeInWidget> createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) setState(() => opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      child: widget.child,
    );
  }
}