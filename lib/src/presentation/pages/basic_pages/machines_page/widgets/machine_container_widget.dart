import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/machine_provider.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/machine_model.dart';
import 'package:poke_app/src/domain/models/move_model.dart';
import 'package:poke_app/src/domain/models/version_group_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/details_pages/machine_details_page/machine_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class MachineContainer extends StatelessWidget {
  const MachineContainer({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MachineProvider().getMachineByIdOrName(name),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        } else {
          final MachineModel machineModel = snapshot.data;

          return FutureBuilder(
            future: MoveProvider().getMoveByIdOrName(machineModel.move!.name!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const LoadingWidget();
              } else {
                MoveModel moveModel = snapshot.data!;
                return FutureBuilder(
                  future: ItemProvider().getItemByIdOrName(machineModel.item!.name!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      ItemModel itemModel = snapshot.data!;
                      return FutureBuilder(
                          future: MachineProvider()
                              .getVersionGroupByIdOrName(machineModel.versionGroup!.name!),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const LoadingWidget();
                            } else {
                              VersionGroupModel versionGroupModel = snapshot.data!;
                              return ListTile(
                                  leading: Image.network(itemModel.sprites!.spritesDefault!),
                                  title: Text(_getItemNameSpanish(
                                      Localizations.localeOf(context).languageCode, itemModel)),
                                  subtitle: Text(
                                    _getMoveNameSpanish(
                                            Localizations.localeOf(context).languageCode,
                                            moveModel) +
                                        '\n' +
                                        _getVersions(versionGroupModel, context),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  isThreeLine: true,
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                        builder: (context) => MachineDetailsPage(
                                            moveModel: moveModel, idToShow: machineModel.id));

                                    Navigator.push(context, route);
                                  });
                            }
                          });
                    }
                  },
                );
              }
            },
          );
        }
      },
    );
  }
}

//Spanish Name
String _getItemNameSpanish(String language, ItemModel itemModel) {
  bool existSpanish = false;
  for (var i = 0; i < itemModel.names!.length; i++) {
    if (itemModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return itemModel.names!.where((element) => element.language!.name!.contains("es")).first.name!;
  } else {
    return itemModel.names!.where((element) => element.language!.name!.contains("en")).first.name!;
  }
}

String _getMoveNameSpanish(String language, MoveModel moveModel) {
  bool existSpanish = false;
  for (var i = 0; i < moveModel.names!.length; i++) {
    if (moveModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return moveModel.names!.where((element) => element.language!.name!.contains("es")).first.name!;
  } else {
    return moveModel.names!.where((element) => element.language!.name!.contains("en")).first.name!;
  }
}

//TODO check versions names
String _getVersions(VersionGroupModel versionGroupModel, BuildContext context) {
  List<String> versionsList = [];
  for (var versions in versionGroupModel.versions!) {
    versionsList.add(versions.name!.capitalize());
  }
  if (versionsList.length == 1) {
    return S.of(context).version + ': ' + versionsList.first.capitalize();
  } else {
    String versionsNames = versionsList.join(', ');
    return S.of(context).versions + ': ' + versionsNames;
  }
}
