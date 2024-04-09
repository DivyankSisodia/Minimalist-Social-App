import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: FaIcon(
        icon,
        size: 25,
        color: Colors.black,
      ),
    );
  }
}
