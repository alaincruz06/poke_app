import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/evolution_chain_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/location_model.dart';
import 'package:poke_app/src/domain/models/move_model.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/domain/models/pokemon_species_model.dart';
import 'package:poke_app/src/domain/models/type_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class EvolutionsDetailsPage extends StatelessWidget {
  const EvolutionsDetailsPage(
      {Key? key,
      required this.evolutionChainModel,
      required this.fromPokemon,
      required this.toPokemon})
      : super(key: key);

  final EvolutionChainModel evolutionChainModel;
  final PokemonModel fromPokemon;
  final PokemonModel toPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(S.of(context).evolution + " (" + evolutionChainModel.id.toString() + ")",
              style: Theme.of(context).textTheme.headline6)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        foregroundImage: NetworkImage(fromPokemon.sprites!.frontDefault!),
                      ),
                      Text(fromPokemon.name!.capitalize(),
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        foregroundImage: NetworkImage(toPokemon.sprites!.frontDefault!),
                      ),
                      Text(toPokemon.name!.capitalize(),
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  )
                ],
              ),
            ),
            evolutionChainModel.babyTriggerItem != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(S.of(context).babyTriggerItem + ": "),
                      FutureBuilder(
                        future: _getItemSpanishName(Localizations.localeOf(context).languageCode,
                            evolutionChainModel.babyTriggerItem),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: LoadingWidget());
                          } else {
                            return snapshot.data;
                          }
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).requirements, style: Theme.of(context).textTheme.headline6),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.item != null
                        ? Row(
                            children: [
                              Text(S.of(context).item + ": "),
                              FutureBuilder(
                                future: _getItemSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.item!.name!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.gender !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).gender + ": "),
                              Text(evolutionChainModel
                                  .chain!.evolvesTo!.first.evolutionDetails!.first.gender
                                  .toString()),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.heldItem !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).heldItem + ": "),
                              FutureBuilder(
                                future: _getItemSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.heldItem!.id!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.knownMove !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).knownMove + ": "),
                              FutureBuilder(
                                future: _getMoveSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.knownMove!.id!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel
                                .chain!.evolvesTo!.first.evolutionDetails!.first.knownMoveType !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).knownMoveType + ": "),
                              FutureBuilder(
                                future: _getPokemonTypeSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.knownMoveType!.name!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.location !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).location + ": "),
                              FutureBuilder(
                                future: _getLocationSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.location!.id!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel
                                .chain!.evolvesTo!.first.evolutionDetails!.first.minAffection !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).minAffection + ": "),
                              Text(evolutionChainModel
                                  .chain!.evolvesTo!.first.evolutionDetails!.first.minAffection
                                  .toString()),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.minBeauty !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).minBeauty + ": "),
                              Text(evolutionChainModel
                                  .chain!.evolvesTo!.first.evolutionDetails!.first.minBeauty
                                  .toString()),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel
                                .chain!.evolvesTo!.first.evolutionDetails!.first.minHappiness !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).minHappiness + ": "),
                              Text(evolutionChainModel
                                  .chain!.evolvesTo!.first.evolutionDetails!.first.minHappiness
                                  .toString()),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.minLevel !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).minLevel + ": "),
                              Text(evolutionChainModel
                                  .chain!.evolvesTo!.first.evolutionDetails!.first.minLevel
                                  .toString()),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first
                                .needsOverworldRain ==
                            true
                        ? Row(
                            children: [
                              Text(S.of(context).needsOverworldRain + ": "),
                              Text(S.of(context).yes),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel
                                .chain!.evolvesTo!.first.evolutionDetails!.first.partySpecies !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).partySpecies + ": "),
                              FutureBuilder(
                                future: _getSpecieSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.partySpecies!.id!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.partyType !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).partyType + ": "),
                              FutureBuilder(
                                future: _getTypeSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.partyType!.id!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first
                                .relativePhysicalStats !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).relativePhysicalStats + ": "),
                              _getRelativeStats(
                                  evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                      .first.relativePhysicalStats,
                                  context)
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!.first.timeOfDay !=
                            ""
                        ? Row(
                            children: [
                              Text(S.of(context).timeOfDay + ": "),
                              Text(evolutionChainModel
                                  .chain!.evolvesTo!.first.evolutionDetails!.first.timeOfDay!),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel
                                .chain!.evolvesTo!.first.evolutionDetails!.first.tradeSpecies !=
                            null
                        ? Row(
                            children: [
                              Text(S.of(context).tradeSpecies + ": "),
                              FutureBuilder(
                                future: _getSpecieSpanishName(
                                    Localizations.localeOf(context).languageCode,
                                    evolutionChainModel.chain!.evolvesTo!.first.evolutionDetails!
                                        .first.tradeSpecies!.id!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    return snapshot.data;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    evolutionChainModel
                                .chain!.evolvesTo!.first.evolutionDetails!.first.turnUpsideDown ==
                            true
                        ? Row(
                            children: [
                              Text(S.of(context).turnUpsideDown + ": "),
                              Text(S.of(context).yes),
                            ],
                          )
                        : const SizedBox(),
                  ],
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _getRelativeStats(int value, BuildContext context) {
  if (value == 1) {
    return Text(S.of(context).attackBiggerDefense);
  } else if (value == 0) {
    return Text(S.of(context).attackEqualsDefense);
  } else {
    return Text(S.of(context).attackLesserDefense);
  }
}

Future<Widget> _getItemSpanishName(String language, String itemName) async {
  bool existSpanish = false;
  ItemModel itemModel = await ItemProvider().getItemByIdOrName(itemName);
  for (var i = 0; i < itemModel.names!.length; i++) {
    if (itemModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      itemModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      itemModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
      textAlign: TextAlign.justify,
    );
  }
}

Future<Widget> _getMoveSpanishName(String language, String moveName) async {
  bool existSpanish = false;
  MoveModel moveModel = await MoveProvider().getMoveByIdOrName(moveName);
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

Future<Widget> _getPokemonTypeSpanishName(String language, String typeName) async {
  bool existSpanish = false;
  TypeModel typeModel = await PokemonProvider().getTypeByIdOrName(typeName);
  for (var i = 0; i < typeModel.names!.length; i++) {
    if (typeModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      typeModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      typeModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
      textAlign: TextAlign.justify,
    );
  }
}

Future<Widget> _getLocationSpanishName(String language, String locationName) async {
  bool existSpanish = false;
  LocationModel locationModel = await LocationProvider().getLocationByIdOrName(locationName);
  for (var i = 0; i < locationModel.names!.length; i++) {
    if (locationModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      locationModel.names!.where((element) => element.language!.name!.contains("es")).first.name! +
          " (" +
          locationModel.region!.name!.capitalize() +
          ")",
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      locationModel.names!.where((element) => element.language!.name!.contains("en")).first.name! +
          " (" +
          locationModel.region!.name!.capitalize() +
          ")",
      textAlign: TextAlign.justify,
    );
  }
}

Future<Widget> _getSpecieSpanishName(String language, String specieName) async {
  bool existSpanish = false;
  PokemonSpeciesModel pokemonSpeciesModel =
      await PokemonSpeciesProvider().getSpecieByIdOrName(specieName);
  for (var i = 0; i < pokemonSpeciesModel.names!.length; i++) {
    if (pokemonSpeciesModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      pokemonSpeciesModel.names!
          .where((element) => element.language!.name!.contains("es"))
          .first
          .name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      pokemonSpeciesModel.names!
          .where((element) => element.language!.name!.contains("en"))
          .first
          .name!,
      textAlign: TextAlign.justify,
    );
  }
}

Future<Widget> _getTypeSpanishName(String language, String typeName) async {
  bool existSpanish = false;
  TypeModel typeModel = await PokemonProvider().getTypeByIdOrName(typeName);
  for (var i = 0; i < typeModel.names!.length; i++) {
    if (typeModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      typeModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      typeModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
      textAlign: TextAlign.justify,
    );
  }
}
