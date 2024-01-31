import 'package:academia_do_flutter/widgets/imc_gauge_range.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcSetStatePage extends StatefulWidget {
  const ImcSetStatePage({super.key});

  @override
  State<ImcSetStatePage> createState() => _ImcSetStatePageState();
}

class _ImcSetStatePageState extends State<ImcSetStatePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

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
          SfRadialGauge(
            title: const GaugeTitle(
              text: 'IMC',
            ),
            axes: [
              RadialAxis(
                showAxisLine: false,
                showTicks: false,
                showLabels: false,
                minimum: 12.5,
                maximum: 47.9,
                ranges: [
                  ImcGaugeRangeWidget(
                    color: Colors.blue,
                    start: 12.5,
                    end: 18.5,
                    label: 'MAGREZA',
                  ),
                  ImcGaugeRangeWidget(
                    color: Colors.green,
                    start: 18.5,
                    end: 24.9,
                    label: 'NORMAL',
                  ),
                  ImcGaugeRangeWidget(
                    color: Colors.amber,
                    start: 24.9,
                    end: 29.9,
                    label: 'SOBREPESO',
                  ),
                  ImcGaugeRangeWidget(
                    color: Colors.red[500]!,
                    start: 29.9,
                    end: 39.9,
                    label: 'OBESIDADE',
                  ),
                  ImcGaugeRangeWidget(
                    color: Colors.red[900]!,
                    start: 39.9,
                    end: 47.9,
                    label: 'OBESIDADE GRAVE',
                  ),
                ],
                pointers: const [
                  NeedlePointer(
                    value: 15,
                    enableAnimation: true,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: pesoController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    label: Text('Peso'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: alturaController,
                  decoration: const InputDecoration(
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
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Calcular IMC'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
