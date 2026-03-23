import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _splitCount = 1;

  void _incrementSplit() {
    setState(() {
      _splitCount++;
    });
  }

  void _decrementSplit() {
    if (_splitCount > 1) {
      setState(() {
        _splitCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('UTip')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text('Total per Person', style: style),
                Text(
                  '\$10',
                  style: style.copyWith(
                    fontSize: theme.textTheme.displaySmall?.fontSize,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Bill Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        // Handle bill amount change
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split', style: theme.textTheme.titleMedium),

                      PersonCounter(
                        theme: theme,
                        splitCount: _splitCount,
                        onIncrement: _incrementSplit,
                        onDecrement: _decrementSplit,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
