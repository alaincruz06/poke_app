import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/berry_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:poke_app/src/presentation/pages/details_pages/pokemon_details_page/pokemon_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class BerryDetailsPage extends StatefulWidget {
  const BerryDetailsPage(
      {Key? key, required this.berryName, required this.berryID, required this.berryItemID})
      : super(key: key);

  final String berryName;
  final int berryID;
  final String berryItemID;

  @override
  State<BerryDetailsPage> createState() => _BerryDetailsPageState();
}

class _BerryDetailsPageState extends State<BerryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BerryProvider().getBerryByIdOrName(widget.berryName),
        builder: (BuildContext context, AsyncSnapshot<BerryModel> snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(body: Center(child: LoadingWidget()));
          } else {
            BerryModel berryModel = snapshot.data!;

            return FutureBuilder(
                future: BerryProvider().getBerryItemById(widget.berryItemID),
                builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: LoadingWidget());
                  } else {
                    ItemModel itemModel = snapshot.data!;
                    return Scaffold(
                      appBar: AppBar(
                          title: Text(
                              _getSpanishBerryName(Localizations.localeOf(context).languageCode,
                                      itemModel, context) +
                                  " (" +
                                  widget.berryID.toString() +
                                  ") ",
                              style: Theme.of(context).textTheme.headline6)),
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                itemModel.sprites!.spritesDefault!,
                                              )),
                                          borderRadius: BorderRadius.circular(20.0)),
                                    ),
                                  ),
                                ),
                                //Info
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(S.of(context).characteristics,
                                              style: Theme.of(context).textTheme.headline6),
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          Text(S.of(context).growth + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          (berryModel.growthTime! == 1)
                                              ? Text(berryModel.growthTime!.toString() + " hr")
                                              : Text(berryModel.growthTime!.toString() + " hrs"),
                                        ]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          Text(S.of(context).harvest + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(berryModel.maxHarvest.toString()),
                                        ]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          Text(S.of(context).size + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(berryModel.size.toString() + " mm"),
                                        ]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          Text(S.of(context).soildryness + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(berryModel.soilDryness.toString()),
                                        ]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          Text(S.of(context).smoothness + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(berryModel.smoothness.toString()),
                                        ]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          Text(S.of(context).firmness + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text(berryModel.firmness!.name!.capitalize()),
                                        ]),
                                      ],
                                    )),
                              ],
                            ),
                            //Stats
                            Divider(
                              color: PokeColor().softBlue,
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(S.of(context).stats,
                                  style: Theme.of(context).textTheme.headline6),
                            ),

                            FutureBuilder(
                              future: BerryProvider().getBerryItemById(widget.berryItemID),
                              builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(child: LoadingWidget());
                                } else {
                                  ItemModel itemModel = snapshot.data!;
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(children: [
                                            Text(S.of(context).category + ": ",
                                                style:
                                                    const TextStyle(fontWeight: FontWeight.bold)),
                                            Text(itemModel.category!.name!.capitalize())
                                          ]),
                                          Row(children: [
                                            Text(S.of(context).cost + ": ",
                                                style:
                                                    const TextStyle(fontWeight: FontWeight.bold)),
                                            Text(itemModel.cost!.toString()),
                                          ]),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(S.of(context).naturalGiftType + ": ",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                                Text(berryModel.naturalGiftPower.toString()),
                                              ]),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(S.of(context).naturalGiftPower + ": ",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                                Text(berryModel.naturalGiftType!.name!),
                                              ]),

                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0, right: 8.0, left: 8.0),
                                              child: Column(
                                                children: [
                                                  Text(S.of(context).effects + ": ",
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold)),
                                                  itemModel.effectEntries != null
                                                      ? getItemsEffectSpanish(
                                                          Localizations.localeOf(context)
                                                              .languageCode,
                                                          itemModel.effectEntries)
                                                      : const SizedBox(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //Flavors
                                          Text(S.of(context).flavors + ": ",
                                              style: const TextStyle(fontWeight: FontWeight.bold)),
                                          ListView.builder(
                                            physics: const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: berryModel.flavors?.length ?? 0,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(S.of(context).name +
                                                        ": " +
                                                        berryModel.flavors![index].flavor!.name!
                                                            .capitalize()),
                                                    Text(S.of(context).power +
                                                        ": " +
                                                        berryModel.flavors![index].potency
                                                            .toString()),
                                                  ]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            //Held By Pokemon
                            Divider(
                              color: PokeColor().softBlue,
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(S.of(context).heldByPokemon,
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            FutureBuilder(
                              future: BerryProvider().getBerryItemById(widget.berryItemID),
                              builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(child: LoadingWidget());
                                } else {
                                  ItemModel itemModel = snapshot.data!;
                                  return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: itemModel.heldByPokemon?.length ?? 0,
                                    itemBuilder: (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () async {
                                          PokemonModel pokemonModel = await PokemonProvider()
                                              .getPokemonByIdOrName(
                                                  itemModel.heldByPokemon![index].pokemon!.name!);
                                          int pokemonID = pokemonModel.id;
                                          final route = MaterialPageRoute(
                                              builder: (context) => PokemonDetailsPage(
                                                  pokemonName: itemModel
                                                      .heldByPokemon![index].pokemon!.name!,
                                                  pokemonID: pokemonID));

                                          Navigator.push(context, route);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                FutureBuilder(
                                                  future: PokemonProvider().getPokemonByIdOrName(
                                                      itemModel
                                                          .heldByPokemon![index].pokemon!.name!),
                                                  builder: (BuildContext context,
                                                      AsyncSnapshot snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return const Center(child: LoadingWidget());
                                                    } else {
                                                      PokemonModel pokemonModel = snapshot.data!;

                                                      return CircleAvatar(
                                                        radius: 40,
                                                        backgroundColor: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        foregroundImage: NetworkImage(
                                                            pokemonModel.sprites!.frontDefault!),
                                                      );
                                                    }
                                                  },
                                                ),
                                                Text(itemModel.heldByPokemon![index].pokemon!.name!
                                                    .capitalize()),
                                                const Icon(Icons.arrow_forward_ios),
                                              ]),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ]),
                        ),
                      ),
                    );
                  }
                });
          }
        });
  }

  String _getSpanishBerryName(String language, ItemModel itemModel, BuildContext context) {
    bool existSpanish = false;

    for (var i = 0; i < itemModel.names!.length; i++) {
      if (itemModel.names![i].language!.name!.contains("es")) {
        existSpanish = true;
      }
    }
    if (language == "es" && existSpanish) {
      return itemModel.names!
          .where((element) => element.language!.name!.contains("es"))
          .first
          .name!;
    } else {
      return itemModel.names!
          .where((element) => element.language!.name!.contains("en"))
          .first
          .name!;
    }
  }
}
