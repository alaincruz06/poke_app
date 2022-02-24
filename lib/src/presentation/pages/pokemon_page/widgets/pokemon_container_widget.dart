import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_provider.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/pages/pokemon_details_page/pokemon_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

Widget pokemonContainer(
  BuildContext context,
  String name,
) {
  return InkWell(
    onTap: () async {
      PokemonModel pokemonModel =
          await PokemonProvider().getPokemonByIdOrName(name);
      int pokemonID = pokemonModel.id;
      final route = MaterialPageRoute(
          builder: (context) =>
              PokemonDetailsPage(pokemonName: name, pokemonID: pokemonID));

      Navigator.push(context, route);
    },
    child: Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /*  Expanded(
              flex: 3,
              child: FutureBuilder(
                      future: PokemonProvider().getPokemonByIdOrName(name),
                      builder: (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
                        if(!snapshot.hasData){
                  return const Center(child: LoadingWidget());
                }
                else {
                PokemonModel pokemonModel = snapshot.data!;
           
                 return  Image.network(pokemonModel.sprites!.frontDefault!, height: 80, width: 80,) ;
                   
                 
                }
               },
             ),
            ),   */
          Expanded(
            child: Text(
              name.capitalize(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(height: 5.0)
        ],
      ),
    ),
  );
}
