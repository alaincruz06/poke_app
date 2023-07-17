import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/move_provider.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_provider.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/move_ailment_model.dart';
import 'package:poke_app/src/domain/models/move_model.dart';
import 'package:poke_app/src/domain/models/move_target_model.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/domain/models/stat_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:translator/translator.dart';

class MachineDetailsPage extends StatelessWidget {
  MachineDetailsPage({Key? key, required this.moveModel, required this.idToShow}) : super(key: key);

  final MoveModel moveModel;
  final int idToShow;
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Localizations.localeOf(context).languageCode == "es"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: Text(
                              '$idToShow : ${moveModel.names!.where((element) => element.language!.name!.contains("es")).first.name!}',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: Text(
                              '$idToShow : ${moveModel.names!.where((element) => element.language!.name!.contains("en")).first.name!}',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${S.of(context).damage_class} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Localizations.localeOf(context).languageCode == "es"
                      ? FutureBuilder(
                          future: translator.translate(moveModel.damageClass!.name!,
                              from: 'en', to: 'es'),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              Translation translation = snapshot.data;
                              return Text(
                                translation.text.capitalize(),
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          },
                        )
                      : Text(
                          moveModel.damageClass!.name!.capitalize(),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${S.of(context).type} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Localizations.localeOf(context).languageCode == "es"
                      ? FutureBuilder(
                          future: translator.translate(moveModel.type!.name!, from: 'en', to: 'es'),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              Translation translation = snapshot.data;
                              return Text(
                                translation.text.capitalize(),
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          },
                        )
                      : Text(
                          moveModel.type!.name!.capitalize(),
                        ),
                ],
              ),
              FutureBuilder(
                future: MoveProvider().getMoveTargetByIdOrName(moveModel.target!.name!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const LoadingWidget();
                  } else {
                    MoveTargetModel moveTargetModel = snapshot.data!;
                    final String moveTargetModelName = moveTargetModel.names!
                        .where((element) => element.language!.name!.contains("en"))
                        .first
                        .name!;
                    final String moveTargetModelDescription = moveTargetModel.descriptions!
                        .where((element) => element.language!.name!.contains("en"))
                        .first
                        .description!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Localizations.localeOf(context).languageCode == "es"
                            ? FutureBuilder(
                                future:
                                    translator.translate(moveTargetModelName, from: 'en', to: 'es'),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    Translation translation = snapshot.data;
                                    return Text(
                                      '${translation.text} : ',
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    );
                                  } else {
                                    return const LoadingWidget();
                                  }
                                },
                              )
                            : Text(
                                moveModel.type!.name!.capitalize(),
                              ),
                        Localizations.localeOf(context).languageCode == "es"
                            ? FutureBuilder(
                                future: translator.translate(moveTargetModelDescription,
                                    from: 'en', to: 'es'),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    Translation translation = snapshot.data;
                                    return Flexible(child: Text(translation.text));
                                  } else {
                                    return const LoadingWidget();
                                  }
                                },
                              )
                            : Text(
                                moveModel.type!.name!.capitalize(),
                              ),
                      ]),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).characteristics,
                    style: Theme.of(context).textTheme.headline6),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('${S.of(context).power} : ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveModel.power.toString()),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('${S.of(context).pp} : ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveModel.pp.toString()),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('${S.of(context).accuracy} : ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveModel.accuracy.toString()),
                ]),
              ),
              moveModel.effectChance != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text('${S.of(context).effect_chance} : ',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(moveModel.effectChance.toString()),
                      ]),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('${S.of(context).priority} : ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveModel.priority.toString()),
                ]),
              ),
              const Divider(),
              Text('${S.of(context).effects} / ${S.of(context).effects_short}',
                  style: Theme.of(context).textTheme.headline6),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: moveModel.effectEntries!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String effect = moveModel.effectEntries!
                        .where((element) => element.language!.name!.contains("en"))
                        .first
                        .effect!;
                    final String shortEffect = moveModel.effectEntries![index].shortEffect!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Localizations.localeOf(context).languageCode == "es"
                                ? FutureBuilder(
                                    future: translator.translate(effect, from: 'en', to: 'es'),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        Translation translation = snapshot.data;
                                        return Text(
                                          translation.text,
                                          textAlign: TextAlign.justify,
                                        );
                                      } else {
                                        return const LoadingWidget();
                                      }
                                    },
                                  )
                                : Text(
                                    effect,
                                    textAlign: TextAlign.justify,
                                  )),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Localizations.localeOf(context).languageCode == "es"
                                ? FutureBuilder(
                                    future: translator.translate(shortEffect, from: 'en', to: 'es'),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        Translation translation = snapshot.data;
                                        return Text(
                                          translation.text,
                                          textAlign: TextAlign.justify,
                                        );
                                      } else {
                                        return const LoadingWidget();
                                      }
                                    },
                                  )
                                : Text(
                                    shortEffect,
                                    textAlign: TextAlign.justify,
                                  )),
                      ],
                    );
                  }),
              /*    moveModel.statChanges != null
                  ? Column(
                      children: [
                        const Divider(),
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: moveModel.statChanges!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(S.of(context).stats,
                                      style: Theme.of(context).textTheme.headline6),
                                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                    Text(
                                        '${moveModel.statChanges![index].stat.name.capitalize()} : ',
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text(moveModel.statChanges![index].change.toString()),
                                  ]),
                                ],
                              );
                            }),
                      ],
                    )
                  : const SizedBox(), */
              Text(S.of(context).meta, style: Theme.of(context).textTheme.headline6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${S.of(context).ailment} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder(
                    future: MoveProvider().getMoveAilmentByIdOrName(moveModel.meta!.ailment!.name!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const LoadingWidget();
                      } else {
                        MoveAilmentModel moveAilmentModel = snapshot.data;
                        String ailmentSpanishName = moveAilmentModel.names!
                            .where((element) => element.language!.name!.contains("en"))
                            .first
                            .name!;
                        return Localizations.localeOf(context).languageCode == "es"
                            ? FutureBuilder(
                                future:
                                    translator.translate(ailmentSpanishName, from: 'en', to: 'es'),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const LoadingWidget();
                                  } else {
                                    Translation translation = snapshot.data;
                                    return Text(
                                      translation.text,
                                    );
                                  }
                                },
                              )
                            : Text(ailmentSpanishName);
                      }
                    },
                  ),
                ],
              ),
              moveModel.meta!.critRate != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).critRate} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.critRate.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.drain != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).drain} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.drain.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.flinchChance != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).flinch_chance} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.flinchChance.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.healing != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).healing} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.healing.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.maxHits != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).maxHits} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.maxHits.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.maxTurns != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).maxTurns} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.maxTurns.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.minHits != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).minHits} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.minHits.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.minTurns != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).minTurns} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.minTurns.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.meta!.statChance != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          '${S.of(context).statChance} : ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(moveModel.meta!.statChance.toString())
                      ]),
                    )
                  : const SizedBox(),
              moveModel.statChanges!.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: moveModel.statChanges!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const Divider(),
                            Row(
                              children: [
                                FutureBuilder(
                                  future: MoveProvider()
                                      .getMoveStatAffectedByIdOrName(moveModel.statChanges![index]),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return const LoadingWidget();
                                    } else {
                                      StatModel statModel = snapshot.data;
                                      final String statModelName = statModel.names!
                                          .where(
                                              (element) => element.language!.name!.contains("es"))
                                          .first
                                          .name!;
                                      return Localizations.localeOf(context).languageCode == "es"
                                          ? FutureBuilder(
                                              future: translator.translate(statModelName,
                                                  from: 'en', to: 'es'),
                                              builder:
                                                  (BuildContext context, AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  Translation translation = snapshot.data;
                                                  return Text(
                                                    '${translation.text} : ',
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  );
                                                } else {
                                                  return const LoadingWidget();
                                                }
                                              },
                                            )
                                          : Text(
                                              '$statModelName : ',
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            );
                                    }
                                  },
                                ),
                                Text(moveModel.statChanges![index].change.toString())
                              ],
                            ),
                          ],
                        );
                      })
                  : const SizedBox(),
              const Divider(),
              Text(S.of(context).learned_by_pokemon, style: Theme.of(context).textTheme.headline6),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: moveModel.learnedByPokemon!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                      title: FutureBuilder(
                        future: PokemonProvider()
                            .getPokemonByIdOrName(moveModel.learnedByPokemon![index].name!),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const LoadingWidget();
                          } else {
                            PokemonModel pokemonModel = snapshot.data!;
                            return Text(pokemonModel.name!.capitalize());
                          }
                        },
                      ),
                      children: [
                        FutureBuilder(
                            future: PokemonProvider()
                                .getPokemonByIdOrName(moveModel.learnedByPokemon![index].name!),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const LoadingWidget();
                              } else {
                                PokemonModel pokemonModel = snapshot.data!;
                                return ListTile(
                                  leading: Image.network(pokemonModel.sprites!.frontDefault!),
                                  title: Text(pokemonModel.name!.capitalize()),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                );
                              }
                            }),
                      ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
