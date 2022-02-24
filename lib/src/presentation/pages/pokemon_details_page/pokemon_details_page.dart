import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_provider.dart';
import 'package:poke_app/src/domain/models/ability_model.dart' as abilityM;
import 'package:poke_app/src/domain/models/item_model.dart' as itemM;
import 'package:poke_app/src/domain/models/move_model.dart' as moveM;
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
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
          builder: (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              PokemonModel pokemonModel = snapshot.data!;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  /*   Row(
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
                  ), */
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
                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text(S.of(context).abilities, style: Theme.of(context).textTheme.headline6),
                  ),
                  //Abilities
                  /*   ListView.builder(
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
                              abilityM.AbilityModel abilityModel = snapshot.data!;
                              abilityM.AbilityModelEffectEntry abilityModelEffectEntry =
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
                  ), */

                  //Held Items
                  //TODO Revisar Items efectos como se ven
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).held_items,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  /*  pokemonModel.heldItems?.length == 0
                      ? Text(S.of(context).doesntcarryitems)
                      : FutureBuilder(
                          future: PokemonProvider()
                              .getItemHeldByIdOrName(pokemonModel.heldItems!.first.item!.name!),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: pokemonModel.heldItems?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return FutureBuilder(
                                      future: PokemonProvider().getItemHeldByIdOrName(
                                          pokemonModel.heldItems![index].item!.name!),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<itemM.ItemModel> snapshot) {
                                        if (!snapshot.hasData) {
                                          return const Center(child: LoadingWidget());
                                        } else {
                                          itemM.ItemModel itemModel = snapshot.data!;

                                          return Card(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.network(
                                                            itemModel.sprites!.spritesDefault!),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(S.of(context).name + ": ",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(itemModel.name!.capitalize() +
                                                                    " (" +
                                                                    itemModel.id.toString() +
                                                                    ")"),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(S.of(context).cost + ": ",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(itemModel.cost!.toString()),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(S.of(context).category + ": ",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(itemModel.category!.name!
                                                                    .capitalize()),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(S.of(context).effects + ": ",
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold)),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.loose,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        bottom: 8.0, right: 8.0, left: 8.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          itemModel.effectEntries!.first.effect!,
                                                          textAlign: TextAlign.justify,
                                                        ),
                                                        Text(
                                                            itemModel
                                                                .effectEntries!.first.shortEffect!,
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
                              );
                            }
                          }), */
                  const Divider(),
                  //Moves //TODO (CardView)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).moves, style: Theme.of(context).textTheme.headline6),
                  ),
                  /* ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonModel.moves?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: PokemonProvider()
                              .getMovesByIdOrName(pokemonModel.moves![index].move!.name!),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              moveM.MoveModel moveModel = snapshot.data!;
                              moveM.EffectEntry effectEntry = moveModel.effectEntries!.firstWhere(
                                  (element) =>
                                      element.language!.name == "es" ||
                                      element.language!.name == "en");

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
                                          Text(moveModel.name!.capitalize()),
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
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, right: 8.0, left: 8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "> " + effectEntry.effect!,
                                              textAlign: TextAlign.justify,
                                            ),
                                            Text("> " + effectEntry.shortEffect!,
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
                  ), */
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text(S.of(context).locations, style: Theme.of(context).textTheme.headline6),
                  ),

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
}
