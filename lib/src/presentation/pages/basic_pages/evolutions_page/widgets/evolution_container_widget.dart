import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/evolution_provider.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_provider.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_species_provider.dart';
import 'package:poke_app/src/domain/models/evolution_chain_model.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/domain/models/pokemon_species_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/details_pages/evolutions_details_page/evolutions_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

Widget evolutionContainer(
  BuildContext context,
  String evolutionID,
) {
  return InkWell(
    onTap: () async {
      EvolutionChainModel evolutionChainModel =
          await EvolutionProvider().getEvolutionById(evolutionID);
      PokemonModel firstPokemon =
          await PokemonProvider().getPokemonByIdOrName(evolutionChainModel.chain!.species!.name!);
      PokemonModel secondPokemon = await PokemonProvider()
          .getPokemonByIdOrName(evolutionChainModel.chain!.evolvesTo!.first.species!.name!);
      final route = MaterialPageRoute(
          builder: (context) => EvolutionsDetailsPage(
              evolutionChainModel: evolutionChainModel,
              fromPokemon: firstPokemon,
              toPokemon: secondPokemon));

      Navigator.push(context, route);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: EvolutionProvider().getEvolutionById(evolutionID),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              EvolutionChainModel evolutionChainModel = snapshot.data!;
              return evolutionChainModel.chain!.evolvesTo!.isNotEmpty
                  ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(evolutionID + ": ", style: Theme.of(context).textTheme.headline6),
                      FutureBuilder(
                        future: PokemonProvider()
                            .getPokemonByIdOrName(evolutionChainModel.chain!.species!.name!),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: LoadingWidget());
                          } else {
                            PokemonModel pokemonModel = snapshot.data!;

                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor.withAlpha(0),
                                  foregroundImage:
                                      NetworkImage(pokemonModel.sprites!.frontDefault!),
                                ),
                                Text(pokemonModel.name!.capitalize(),
                                    style: Theme.of(context).textTheme.bodyText1),
                              ],
                            );
                          }
                        },
                      ),
                      const Icon(Icons.arrow_forward),
                      FutureBuilder(
                        future: PokemonProvider().getPokemonByIdOrName(
                            evolutionChainModel.chain!.evolvesTo!.first.species!.name!),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: LoadingWidget());
                          } else {
                            PokemonModel pokemonModel = snapshot.data!;

                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor.withAlpha(0),
                                  foregroundImage:
                                      NetworkImage(pokemonModel.sprites!.frontDefault!),
                                ),
                                Text(pokemonModel.name!.capitalize(),
                                    style: Theme.of(context).textTheme.bodyText1),
                              ],
                            );
                          }
                        },
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ])
                  : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(evolutionID + ": ", style: Theme.of(context).textTheme.headline6),
                      FutureBuilder(
                        future: PokemonSpeciesProvider()
                            .getSpecieByIdOrName(evolutionChainModel.chain!.species!.name!),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: LoadingWidget());
                          } else {
                            PokemonSpeciesModel pokemonSpeciesModel = snapshot.data!;

                            return FutureBuilder(
                                future: PokemonProvider().getPokemonByIdOrName(
                                    pokemonSpeciesModel.varieties!.first.pokemon!.name!),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: LoadingWidget());
                                  } else {
                                    PokemonModel pokemonModel = snapshot.data!;
                                    return CircleAvatar(
                                      radius: 40,
                                      backgroundColor:
                                          Theme.of(context).scaffoldBackgroundColor.withAlpha(0),
                                      foregroundImage:
                                          NetworkImage(pokemonModel.sprites!.frontDefault!),
                                    );
                                  }
                                });
                          }
                        },
                      ),
                      Text(S.of(context).doesntEvolve)
                    ]);
            }
          }),
    ),
  );
}
