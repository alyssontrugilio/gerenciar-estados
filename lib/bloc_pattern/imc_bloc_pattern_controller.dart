import 'dart:async';

import 'package:academia_do_flutter/bloc_pattern/imc_state.dart';

class ImcBlocPatternController {
  final _imcSteamController = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));

  Stream<ImcState> get imcOut => _imcSteamController.stream;

  Future<void> calcularImc(
      {required double peso, required double altura}) async {
    _imcSteamController.add(ImcStateLoadgin());
    await Future.delayed(const Duration(seconds: 1));
    _imcSteamController.add(ImcState(imc: peso / (altura * altura)));
  }

  void dispose() {
    _imcSteamController.close();
  }
}
