import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/berry_provider.dart';
import 'package:poke_app/src/domain/models/berry_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class BerryDetailSliverPage extends StatelessWidget {
  const BerryDetailSliverPage(
      {Key? key, required this.berryName, required this.berryID, required this.berryItemID})
      : super(key: key);

  final String berryName;
  final int berryID;
  final String berryItemID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BerryModel>(
          future: BerryProvider().getBerryByIdOrName(berryName),
          builder: (BuildContext context, AsyncSnapshot<BerryModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LoadingWidget());
            } else {
              BerryModel berryModel = snapshot.data!;

              return FutureBuilder(
                  future: BerryProvider().getBerryItemById(berryItemID),
                  builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: LoadingWidget());
                    } else {
                      ItemModel itemModel = snapshot.data!;

                      return CustomScrollView(slivers: <Widget>[
                        SliverAppBar(
                          title: _getSpanishBerryName(
                              Localizations.localeOf(context).languageCode, itemModel, context),
                          expandedHeight: 200.0,
                          floating: true,
                          pinned: true,
                          snap: true,
                          actionsIconTheme: const IconThemeData(opacity: 0.0),
                          flexibleSpace: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Image.network(
                                itemModel.sprites!.spritesDefault!,
                                fit: BoxFit.cover,
                              ))
                            ],
                          ),
                          /* flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              background: Image.network(
                                itemModel.sprites!.spritesDefault!,
                                fit: BoxFit.cover,
                              )), */
                        ),
                        /*   Text("body 1"),
                        Text("body 2"),
                        Text("body 3"), */
                      ]);
                    }
                  });
            }
          }),
    );
  }

  //Spanish Getters
  Widget _getSpanishBerryName(String language, ItemModel itemModel, BuildContext context) {
    bool existSpanish = false;

    for (var i = 0; i < itemModel.names!.length; i++) {
      if (itemModel.names![i].language!.name!.contains("es")) {
        existSpanish = true;
      }
    }
    if (language == "es" && existSpanish) {
      return Text(
          itemModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
          style: Theme.of(context).textTheme.headline6);
    } else {
      return Text(
          itemModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
          style: Theme.of(context).textTheme.headline6);
    }
  }
}
