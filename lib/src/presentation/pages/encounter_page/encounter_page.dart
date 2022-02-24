import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';

class EncounterPage extends StatelessWidget {
  const EncounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).encounterMethods, style: Theme.of(context).textTheme.headline6),
      ),
      body: Center(child: Text('Hola Mundo')),
    );
  }
}
