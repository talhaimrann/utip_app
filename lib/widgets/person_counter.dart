import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int splitCount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _splitCount = splitCount;

  final ThemeData theme;
  final int _splitCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onIncrement,
          icon: Icon(Icons.add),
          color: theme.colorScheme.primary,
        ),
        Text(_splitCount.toString(), style: theme.textTheme.titleMedium),
        IconButton(
          onPressed: onDecrement,
          icon: Icon(Icons.remove),
          color: theme.colorScheme.primary,
        ),
      ],
    );
  }
}
