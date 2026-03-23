import 'package:flutter/material.dart';
import 'package:utip/widgets/amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

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
  double _tipPercentage = 0.15;
  var _billAmount = '0';

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
      body: SingleChildScrollView(
        child: Column(
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
                    '\$$_billAmount',
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
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      BuildAmountField(
                        onChanged: (value) {
                          // Handle bill amount change
                          setState(() {
                            _billAmount = value;
                          });
                        },
                        billAmount: '100',
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tip', style: theme.textTheme.titleMedium),
                          Text('\$15', style: theme.textTheme.titleMedium),
                        ],
                      ),

                      Text('${(_tipPercentage * 100).round()}%'),

                      TipSlider(
                        tipPercentage: _tipPercentage,
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
