import 'package:academia_do_flutter/widgets/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImcSetStatePage extends StatefulWidget {
  const ImcSetStatePage({super.key});

  @override
  State<ImcSetStatePage> createState() => _ImcSetStatePageState();
}

class _ImcSetStatePageState extends State<ImcSetStatePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = 0.0;

  Future<void> _calcularImc(
      {required double peso, required double altura}) async {
    setState(() {
      imc = 0;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      imc = peso / (altura * altura);
    });
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
        title: const Text('Imc SetState'),
      ),
      body: Column(
        children: [
          ImcGauge(
            imc: imc,
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
                      var formValid = formKey.currentState?.validate() ?? false;

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
    );
  }
}
