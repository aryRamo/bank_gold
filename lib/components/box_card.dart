import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Gradient? degrade;
  
  final Widget filho;
  const BoxCard({super.key, this.degrade, required this.filho});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          gradient: degrade, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: filho,
      ),
    );
  }
}
