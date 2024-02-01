import 'package:academia_do_flutter/bloc_pattern/imc_bloc_pattern_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/imc_gauge.dart';

class ImcBlocPatternPage extends StatefulWidget {
  const ImcBlocPatternPage({super.key});

  @override
  State<ImcBlocPatternPage> createState() => _ImcBlocPatternPageState();
}

class _ImcBlocPatternPageState extends State<ImcBlocPatternPage> {
  final controller = ImcBlocPatternController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imc ChangeNotifier'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImcGauge(imc: 0),
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

                          // controller.calcularImc(altura, peso);
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
