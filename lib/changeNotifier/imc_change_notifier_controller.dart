import 'package:flutter/material.dart';

class ImcChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;

  Future<void> calcularImc(double altura, double peso) async {
    imc = 0;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));

    imc = peso / (altura * altura);
    notifyListeners();
  }
}
