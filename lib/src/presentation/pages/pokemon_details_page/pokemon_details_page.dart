import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_provider.dart';
import 'package:poke_app/src/domain/models/ability_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/move_model.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage(
      {Key? key, required this.pokemonName, required this.pokemonID})
      : super(key: key);

  final String pokemonName;
  final int pokemonID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              pokemonName.capitalize() + " (" + pokemonID.toString() + ") ",
              style: Theme.of(context).textTheme.headline6)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: PokemonProvider().getPokemonByIdOrName(pokemonName),
          builder:
              (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              PokemonModel pokemonModel = snapshot.data!;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  /*   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.5,
                       decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(pokemonModel.sprites!.frontDefault!)),
                          borderRadius: BorderRadius.circular(20.0)), 
                    ),
                  ),
                ],
          ), 
          const Divider(),*/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).abilities,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  //Abilities
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonModel.abilities?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: PokemonProvider().getAbilityByIdOrName(
                              pokemonModel.abilities![index].ability!.name!),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              AbilityModel abilityModel = snapshot.data!;
                              AbilityModelEffectEntry abilityModelEffectEntry =
                                  abilityModel.effectEntries!.firstWhere(
                                      (element) =>
                                          element.language!.name == "es" ||
                                          element.language!.name == "en");

                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(S.of(context).name +
                                        ": " +
                                        abilityModel.name!.capitalize()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(S.of(context).is_main_series +
                                            ": "),
                                        Text(abilityModel.isMainSeries!
                                            ? S.of(context).yes
                                            : S.of(context).no),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(S.of(context).generation +
                                        ": " +
                                        abilityModel.generation!.name!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      S.of(context).effects +
                                          ": " +
                                          abilityModelEffectEntry.effect!,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        S.of(context).effects_short +
                                            ": " +
                                            abilityModelEffectEntry
                                                .shortEffect!,
                                        textAlign: TextAlign.justify),
                                  ),
                                ],
                              );
                            }
                          });
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).held_items,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  //Held Items
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonModel.heldItems?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: PokemonProvider().getItemHeldByIdOrName(
                              pokemonModel.heldItems![index].item!.name!),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              ItemModel itemModel = snapshot.data!;

                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Image.network(
                                          itemModel.sprites!.spritesDefault!),
                                      title: Text(itemModel.name!.capitalize() +
                                          " (" +
                                          itemModel.id.toString() +
                                          ")"),
                                      subtitle: Text(S.of(context).category +
                                          ": " +
                                          itemModel.category!.name!),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).effects +
                                        ": " +
                                        itemModel.effectEntries!.first.effect!,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    S.of(context).effects_short +
                                        ": " +
                                        itemModel
                                            .effectEntries!.first.shortEffect!,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              );
                            }
                          });
                    },
                  ),
                  const Divider(),
                  //Moves
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).moves,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonModel.moves?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: PokemonProvider().getMovesByIdOrName(
                              pokemonModel.moves![index].move!.name!),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: LoadingWidget());
                            } else {
                              MoveModel moveModel = snapshot.data!;

                              return Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(S.of(context).name +
                                          ": " +
                                          moveModel.name!)),
                                  Row(
                                    children: [
                                      Text(
                                        S.of(context).accuracy +
                                            ": " +
                                            moveModel.accuracy.toString(),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(
                                        S.of(context).pp +
                                            ": " +
                                            moveModel.pp.toString(),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    S.of(context).type +
                                        ": " +
                                        moveModel.type!.name!,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    S.of(context).damage_class +
                                        ": " +
                                        moveModel.damageClass!.name!,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    S.of(context).damage_class +
                                        ": " +
                                        moveModel.damageClass!.name!,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              );
                            }
                          });
                    },
                  ),
                ]),
              );
            }
          },
        ),
      ),
    );
  }
}
