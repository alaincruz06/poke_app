import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';

class EvolutionsPage extends StatelessWidget {
  const EvolutionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).evolutions, style: Theme.of(context).textTheme.headline6),
      ),
      body: Center(child: Text('Hola Mundo')),
    );
  }
}
