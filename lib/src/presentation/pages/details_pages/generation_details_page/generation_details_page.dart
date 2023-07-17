import 'package:flutter/material.dart';
import 'package:poke_app/src/domain/models/generation_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:translator/translator.dart';

class GenerationDetailsPage extends StatelessWidget {
  GenerationDetailsPage({Key? key, required this.generationModel}) : super(key: key);
  final GenerationModel generationModel;
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Localizations.localeOf(context).languageCode == "es"
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Text(
                          generationModel.names!
                              .where((element) => element.language!.name!.contains("es"))
                              .first
                              .name!,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Text(
                          generationModel.names!
                              .where((element) => element.language!.name!.contains("en"))
                              .first
                              .name!,
                          style: Theme.of(context).textTheme.headline6),
                    ),
            ],
          ),
          Row(
            children: [
              Text(
                '${S.of(context).mainRegion} : ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(generationModel.mainRegion!.name!.capitalize()),
            ],
          ),
        ])),
      ),
    );
  }
}
