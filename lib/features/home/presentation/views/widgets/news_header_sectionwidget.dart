import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewSectionTitle extends StatelessWidget {
  const NewSectionTitle({super.key, required this.sectionHeader});
  final String sectionHeader;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Text(
        sectionHeader,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "PS",
            fontSize: 18,
            color: Color(0xff383A3E)),
      ).animate().slideY(),
    );
  }
}
