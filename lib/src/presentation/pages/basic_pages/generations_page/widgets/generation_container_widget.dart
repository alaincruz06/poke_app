import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/generation_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/pages/details_pages/generation_details_page/generation_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

Widget generationContainer(
  BuildContext context,
  String name,
) {
  return InkWell(
    onTap: () async {
      GenerationModel generationModel = await GenerationProvider().getGenerationByIdOrName(name);
      final route = MaterialPageRoute(
          builder: (context) => GenerationDetailsPage(
                generationModel: generationModel,
              ));

      Navigator.push(context, route);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: GenerationProvider().getGenerationByIdOrName(name),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              GenerationModel generationModel = snapshot.data!;
              return ListTile(
                title: Row(
                  children: [
                    Text('${generationModel.id.toString()}:'),
                    _getNameSpanish(Localizations.localeOf(context).languageCode, generationModel),
                  ],
                ),
                subtitle: Text(generationModel.mainRegion!.name!.capitalize()),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            }
          }),
    ),
  );
}

//Spanish Name
Widget _getNameSpanish(String language, GenerationModel generationModel) {
  bool existSpanish = false;
  for (var i = 0; i < generationModel.names!.length; i++) {
    if (generationModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      generationModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      generationModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
      textAlign: TextAlign.justify,
    );
  }
}
