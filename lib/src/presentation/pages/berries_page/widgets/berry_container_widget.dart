import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/berry_provider.dart';
import 'package:poke_app/src/domain/models/berry_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/pages/berry_detail_page/berry_detail_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

Widget berryContainer(
  BuildContext context,
  String name,
) {
  return InkWell(
    onTap: () async {
      BerryModel berryModel = await BerryProvider().getBerryByIdOrName(name);
      int berryID = berryModel.id;

      //"https://pokeapi.co/api/v2/item/number/"
      int finalSlashPosition = berryModel.item!.url!.lastIndexOf("/");
      String itemId = berryModel.item!.url!.substring(31, finalSlashPosition);
      debugPrint(itemId);
      // ItemModel itemModel = await BerryProvider().getBerryItemById(itemId);

      /*  final route = MaterialPageRoute(
          builder: (context) =>
              BerryDetailsPage(berryName: name, berryID: berryID, berryItemID: itemId)); 
    Navigator.push(context, route);*/
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
