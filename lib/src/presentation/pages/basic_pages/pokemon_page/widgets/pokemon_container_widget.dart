import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/pages/details_pages/pokemon_details_page/pokemon_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/shimmer_widgets.dart';

class PokemonContainer extends StatelessWidget {
  const PokemonContainer({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokemonProvider().getPokemonByIdOrName(name),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        } else {
          final PokemonModel pokemonModel = snapshot.data;
          final int pokemonID = pokemonModel.id;
          return InkWell(
            onTap: () async {
              final route = MaterialPageRoute(
                  builder: (context) =>
                      PokemonDetailsPage(pokemonName: name, pokemonID: pokemonID));

              Navigator.push(context, route);
            },
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: getGradientColorWithType(pokemonModel.types!.first.type!.name!),
                      //color: getColorWithType(pokemonModel.types!.first.type!.name!)
                    ),
                    child: Flex(direction: Axis.vertical, children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Text(
                            name.capitalize(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Image.network(
                      pokemonModel.sprites!.frontDefault!,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
