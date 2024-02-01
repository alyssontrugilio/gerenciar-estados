import 'dart:async';

import 'package:academia_do_flutter/bloc_pattern/imc_state.dart';

class ImcBlocPatternController {
  final _imcSteamController = StreamController<ImcState>();

  void dispose() {
    _imcSteamController.close();
  }
}
