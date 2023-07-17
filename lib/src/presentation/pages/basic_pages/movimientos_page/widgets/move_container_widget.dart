import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/move_model.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/details_pages/machine_details_page/machine_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class MoveContainer extends StatelessWidget {
  const MoveContainer({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MoveProvider().getMoveByIdOrName(name),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        } else {
          final MoveModel moveModel = snapshot.data;

          return ListTile(
            title: _getItemNameSpanish(Localizations.localeOf(context).languageCode, moveModel),
            subtitle: Text(S.of(context).power +
                ': ${moveModel.power.toString()}   ' +
                S.of(context).pp +
                ': ${moveModel.pp.toString()}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) =>
                    MachineDetailsPage(moveModel: moveModel, idToShow: moveModel.id),
              );

              Navigator.push(context, route);
            },
          );
        }
      },
    );
  }
}

Widget _getItemNameSpanish(String language, MoveModel moveModel) {
  bool existSpanish = false;
  for (var i = 0; i < moveModel.names!.length; i++) {
    if (moveModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      moveModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      moveModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
      textAlign: TextAlign.justify,
    );
  }
}
