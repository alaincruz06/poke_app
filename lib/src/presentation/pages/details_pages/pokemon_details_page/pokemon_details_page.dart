import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/ability_model.dart' as ability_m;
import 'package:poke_app/src/domain/models/item_model.dart' as item_m;
import 'package:poke_app/src/domain/models/move_model.dart' as move_m;
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key, required this.pokemonName, required this.pokemonID})
      : super(key: key);

  final String pokemonName;
  final int pokemonID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(pokemonName.capitalize() + " (" + pokemonID.toString() + ") ",
              style: Theme.of(context).textTheme.headline6)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: PokemonProvider().getPokemonByIdOrName(pokemonName),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              PokemonModel pokemonModel = snapshot.data!;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(pokemonModel.sprites!.frontDefault!)),
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ),
                      //Stats
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pokemonModel.stats?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Text(pokemonModel.stats![index].stat!.name!.capitalize() + ": ",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(pokemonModel.stats![index].baseStat.toString()),
                            ]);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(S.of(context).height + ": "),
                          Text(decimetresToMetres(pokemonModel.height!).toString() + " m"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(S.of(context).weight + ": "),
                          Text(hectogramsToKilograms(pokemonModel.weight!).toString() + " Kg"),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: PokeColor().softBlue,
                    height: 2,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text(S.of(context).abilities, style: Theme.of(context).textTheme.headline6),
                  ),
                  //Abilities
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonModel.abilities?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: PokemonProvider()
                              .getAbilityByIdOrName(pokemonModel.abilities![index].ability!.name!),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              ability_m.AbilityModel abilityModel = snapshot.data!;
                              ability_m.AbilityModelEffectEntry abilityModelEffectEntry =
                                  abilityModel.effectEntries!.firstWhere((element) =>
                                      element.language!.name == "es" ||
                                      element.language!.name == "en");

                              return Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          S.of(context).name +
                                              ": " +
                                              abilityModel.name!.capitalize(),
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(S.of(context).is_main_series + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(abilityModel.isMainSeries!
                                              ? S.of(context).yes
                                              : S.of(context).no),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(S.of(context).generation + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(abilityModel.generation!.name!),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          S.of(context).effects +
                                              " / " +
                                              S.of(context).effects_short +
                                              ": ",
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "> " + abilityModelEffectEntry.effect!,
                                              textAlign: TextAlign.justify,
                                            ),
                                            Text("> " + abilityModelEffectEntry.shortEffect!,
                                                textAlign: TextAlign.justify),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                    },
                  ),

                  //Held Items
                  //TODO relacionar Items con Items page
                  Divider(
                    color: PokeColor().softBlue,
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).held_items,
                        style: Theme.of(context).textTheme.headline6),
                  ),

                  /*  pokemonModel.heldItems?.length == 0
                      ? Text(S.of(context).doesntcarryitems)
                      : FutureBuilder(
                          future: ItemProvider()
                              .getItemByIdOrName(pokemonModel.heldItems!.first.item!.name!),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              return InkWell(
                                onTap: () async {
                                  /*  ItemModel itemModel = await ItemProvider()
                                              .getItemByIdOrName(
                                                  pokemonModel.heldItems!.first.item!.name!);
                                          int itemID = itemModel.id;
                                          final route = MaterialPageRoute(
                                              builder: (context) => ItemDetailsPage(
                                                  itemName: pokemonModel.heldItems!.first.item!.name!,
                                                  itemID: itemID));

                                          Navigator.push(context, route); */
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        FutureBuilder(
                                          future: ItemProvider().getItemByIdOrName(
                                              pokemonModel.heldItems!.first.item!.name!),
                                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                                            if (!snapshot.hasData) {
                                              return const Center(child: LoadingWidget());
                                            } else {
                                              item_m.ItemModel itemModel = snapshot.data!;

                                              return CircleAvatar(
                                                radius: 40,
                                                backgroundColor:
                                                    Theme.of(context).scaffoldBackgroundColor,
                                                foregroundImage: NetworkImage(
                                                    itemModel.sprites!.spritesDefault!),
                                              );
                                            }
                                          },
                                        ),
                                        Text(
                                            pokemonModel.heldItems!.first.item!.name!.capitalize()),
                                        const Icon(Icons.arrow_forward_ios),
                                      ]),
                                ),
                              );
                            }
                          }), */
                  Divider(
                    color: PokeColor().softBlue,
                    height: 2,
                  ),
                  //Moves
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).moves, style: Theme.of(context).textTheme.headline6),
                  ),
                  //TODO relacionar moves con moves page
                  /*  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonModel.moves?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: MoveProvider()
                              .getMoveByIdOrName(pokemonModel.moves![index].move!.name!),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              move_m.MoveModel moveModel = snapshot.data!;

                              return Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(S.of(context).name + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          _getNameSpanish(
                                              Localizations.localeOf(context).languageCode,
                                              moveModel),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(S.of(context).accuracy + ": ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(moveModel.accuracy.toString()),
                                        Text(S.of(context).pp + ": ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(moveModel.pp.toString()),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(S.of(context).type + ": ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(moveModel.type!.name!.capitalize()),
                                        Text(S.of(context).damage_class + ": ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(moveModel.damageClass!.name!.capitalize()),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(S.of(context).power + ": ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(moveModel.power.toString()),
                                        Text(S.of(context).effect_chance + ": ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(moveModel.effectChance.toString()),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          S.of(context).effects +
                                              " / " +
                                              S.of(context).effects_short +
                                              ": ",
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                   _getMovesEffectSpanish
                                  ],
                                ),
                              );
                            }
                          });
                    },
                  ), */
                  Divider(
                    color: PokeColor().softBlue,
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text(S.of(context).locations, style: Theme.of(context).textTheme.headline6),
                  ),
                  /*   FutureBuilder(
                    future: PokemonProvider().getEncounterByIdOrName(pokemonID.toString()),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ;
                    },
                  ), */

                  //check location_area_encounters "/api/v2/pokemon/35/encounters"
                  //Check Types "/api/v2/type/18/"
                ]),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _getItemsShortEffectSpanish(String language, List<item_m.EffectEntry>? effects) {
    bool existSpanish = false;
    for (var i = 0; i < effects!.length; i++) {
      if (effects[i].language!.name!.contains("es")) {
        existSpanish = true;
      }
    }
    if (language == "es" && existSpanish) {
      return Text(
        effects.where((element) => element.language!.name!.contains("es")).first.shortEffect!,
        textAlign: TextAlign.justify,
      );
    } else {
      return Text(
        effects.where((element) => element.language!.name!.contains("en")).first.shortEffect!,
        textAlign: TextAlign.justify,
      );
    }
  }

  Widget _getMovesEffectSpanish(String language, List<move_m.EffectEntry>? effects) {
    bool existSpanish = false;
    for (var i = 0; i < effects!.length; i++) {
      if (effects[i].language!.name!.contains("es")) {
        existSpanish = true;
      }
    }
    if (language == "es" && existSpanish) {
      return Text(
        effects.where((element) => element.language!.name!.contains("es")).first.effect!,
        textAlign: TextAlign.justify,
      );
    } else {
      return Text(
        effects.where((element) => element.language!.name!.contains("en")).first.effect!,
        textAlign: TextAlign.justify,
      );
    }
  }

  //Spanish Name
  Widget _getNameSpanish(String language, move_m.MoveModel moveModel) {
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

  Widget _getMovesShortEffectSpanish(String language, List<move_m.EffectEntry>? effects) {
    bool existSpanish = false;
    for (var i = 0; i < effects!.length; i++) {
      if (effects[i].language!.name!.contains("es")) {
        existSpanish = true;
      }
    }
    if (language == "es" && existSpanish) {
      return Text(
        effects.where((element) => element.language!.name!.contains("es")).first.shortEffect!,
        textAlign: TextAlign.justify,
      );
    } else {
      return Text(
        effects.where((element) => element.language!.name!.contains("en")).first.shortEffect!,
        textAlign: TextAlign.justify,
      );
    }
  }
}
