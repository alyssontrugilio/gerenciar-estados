import 'package:academia_do_flutter/bloc_pattern/imc_bloc_pattern_page.dart';
import 'package:academia_do_flutter/changeNotifier/imc_change_notifier_page.dart';
import 'package:academia_do_flutter/setState/imc_setstate_page.dart';
import 'package:academia_do_flutter/value_notifier/value_notifier_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcSetStatePage()),
              child: const Text('setState'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcValueNotifierPage()),
              child: const Text('ValueNotifier'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () =>
                  _goToPage(context, const ImcChangeNotifierPage()),
              child: const Text('ChangeNotifier'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcBlocPatternPage()),
              child: const Text('Streams (Bloc Pattern)'),
            )
          ],
        ),
      ),
    );
  }
}
