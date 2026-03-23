import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercentage,
    required this.onChanged,
    required int divisions,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: 0.5,
      value: _tipPercentage,
      divisions: 5,
      onChanged: onChanged,
    );
  }
}
