import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);
  //página con la info de los atributos que devuelve la api para guiar al usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).help,
            style: Theme.of(context).textTheme.headline6),
      ),
      body: Center(child: Text('Hola Mundo')),
    );
  }
}
