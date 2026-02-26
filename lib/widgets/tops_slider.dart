import 'package:flutter/material.dart';

class TipsSlider extends StatelessWidget {
  const TipsSlider({
    super.key,
    required double tipPercentage,
    required this.onChanged,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercentage,
      onChanged: onChanged,
      min: 0,
      max: 100,
      divisions: 20,
      label: "${_tipPercentage.toStringAsFixed(2)}%",
    );
  }
}
