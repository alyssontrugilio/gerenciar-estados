import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range.dart';

class ImcGauge extends StatelessWidget {
  final double imc;
  const ImcGauge({
    super.key,
    required this.imc,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
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
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        ),
      ],
    );
  }
}
