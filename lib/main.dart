import 'package:flutter/material.dart';
import 'package:tip_calculator/providers/tip_calculator_model.dart';
import 'package:tip_calculator/widgets/bill_amount_field.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/tops_slider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TipCalculatorModel(),
      child: const MyApp(),
    ),
  );
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
    final model = Provider.of<TipCalculatorModel>(context);

    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("UTip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryFixedDim,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Total per Person", style: style),
                  Text(
                    "Price: \$${model.totalPerPerson.toStringAsFixed(2)}",
                    style: style.copyWith(
                      fontSize: theme.textTheme.displaySmall?.fontSize,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: BillAmountField(
                      billAmount: model.billTotal.toStringAsFixed(2),
                      onChanged: (value) {
                        model.updateBillTotal(double.tryParse(value) ?? 0.0);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: PersonCounter(
                      theme: theme,
                      personCount: model.personCount,
                      onDecrement: () => {
                        if (model.personCount > 1)
                          model.updatePersonCount(model.personCount - 1),
                      },
                      onIncrement: () =>
                          model.updatePersonCount(model.personCount + 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip", style: theme.textTheme.titleMedium),
                        Text(
                          "\$${model.tipAmount.toStringAsFixed(2)}",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${model.tipPercentage.toStringAsFixed(2)}% Tip",
                    style: theme.textTheme.titleMedium,
                  ),
                  TipsSlider(
                    tipPercentage: model.tipPercentage,
                    onChanged: model.updateTipPercentage,
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
