import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/imc_gauge.dart';

class ImcValueNotifierPage extends StatefulWidget {
  const ImcValueNotifierPage({super.key});

  @override
  State<ImcValueNotifierPage> createState() => _ImcValueNotifierPageState();
}

class _ImcValueNotifierPageState extends State<ImcValueNotifierPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = ValueNotifier(0.0);

  Future<void> _calcularImc(
      {required double peso, required double altura}) async {
    imc.value = 0;

    await Future.delayed(const Duration(seconds: 1));

    imc.value = peso / (altura * altura);
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imc ValueNotifier'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<double>(
              valueListenable: imc,
              builder: (_, imcValue, __) {
                return ImcGauge(
                  imc: imcValue,
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: pesoController,
                      autocorrect: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Peso (Kg)'),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: alturaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Altura'),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                        )
                      ],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        var formValid =
                            formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          var formatter = NumberFormat.simpleCurrency(
                            locale: 'pt_BR',
                            decimalDigits: 2,
                          );
                          double peso =
                              formatter.parse(pesoController.text) as double;

                          double altura =
                              formatter.parse(alturaController.text) as double;
                          _calcularImc(peso: peso, altura: altura);
                        }
                      },
                      child: const Text('Calcular IMC'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
