import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/berry_provider.dart';
import 'package:poke_app/src/domain/models/berry_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class BerryDetailsPage extends StatefulWidget {
  const BerryDetailsPage(
      {Key? key,
      required this.berryName,
      required this.berryID,
      required this.berryItemID})
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.berryName.capitalize() +
                  " (" +
                  widget.berryID.toString() +
                  ") ",
              style: Theme.of(context).textTheme.headline6)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: BerryProvider().getBerryByIdOrName(widget.berryName),
          builder: (BuildContext context, AsyncSnapshot<BerryModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              BerryModel berryModel = snapshot.data!;

              return SingleChildScrollView(
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
                          child: FutureBuilder(
                              future: BerryProvider()
                                  .getBerryItemById(widget.berryItemID),
                              builder: (BuildContext context,
                                  AsyncSnapshot<ItemModel> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(child: LoadingWidget());
                                } else {
                                  ItemModel itemModel = snapshot.data!;
                                  return Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    /* decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(pokemonModel.sprites!.frontDefault!)),
                                    borderRadius: BorderRadius.circular(20.0)), */
                                  );
                                }
                              }),
                        ),
                      ),
                      //Stats
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(S.of(context).growth + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.growthTime!.toString() +
                                                  berryModel.growthTime!
                                                      .toString() ==
                                              1
                                          ? "hr"
                                          : "hrs"),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(S.of(context).harvest + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.maxHarvest.toString()),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(S.of(context).size + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.size.toString() + "mm"),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(S.of(context).soildryness + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.soilDryness.toString()),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          S.of(context).naturalGiftPower + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.naturalGiftPower
                                          .toString()),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(S.of(context).smoothness + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.smoothness.toString()),
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(S.of(context).firmness + ": ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(berryModel.firmness!.name!
                                          .capitalize()),
                                    ]),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(S.of(context).abilities,
                        style: Theme.of(context).textTheme.headline6),
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
                ]),
              );
            }
          },
        ),
      ),
    );
  }
}
