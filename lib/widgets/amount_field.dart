import 'package:flutter/material.dart';

class BuildAmountField extends StatelessWidget {
  const BuildAmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'Bill Amount',
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
