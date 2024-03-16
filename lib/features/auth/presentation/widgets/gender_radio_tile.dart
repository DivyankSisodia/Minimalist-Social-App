import 'package:flutter/material.dart';

class GenderRadioTile extends StatelessWidget {
  const GenderRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.selctedValue,
    required this.onChanged,
  });

  final String title;
  final String value;
  final String? selctedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Radio.adaptive(
          value: value,
          groupValue: selctedValue,
          onChanged: onChanged,
        )
      ],
    );
  }
}
