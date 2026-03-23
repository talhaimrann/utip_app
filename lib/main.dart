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
              borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    );
  }
}
