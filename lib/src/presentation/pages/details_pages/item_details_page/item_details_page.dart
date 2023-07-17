import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/item_provider.dart';
import 'package:poke_app/src/domain/models/item_attribute_model.dart';
import 'package:poke_app/src/domain/models/item_category_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:translator/translator.dart';

class ItemDetailsPage extends StatelessWidget {
  ItemDetailsPage({Key? key, required this.itemModel}) : super(key: key);
  final ItemModel itemModel;
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundImage: NetworkImage(itemModel.sprites!.spritesDefault!),
              ),
            ),
            Localizations.localeOf(context).languageCode == "es"
                ? FutureBuilder(
                    future: translator.translate(
                        itemModel.names!
                            .where((element) => element.language!.name!.contains("en"))
                            .first
                            .name!,
                        from: 'en',
                        to: 'es'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        Translation translation = snapshot.data;
                        return Text(
                          translation.text,
                          style: Theme.of(context).textTheme.headline6,
                        );
                      } else {
                        return const LoadingWidget();
                      }
                    },
                  )
                : Text(
                    itemModel.names!
                        .where((element) => element.language!.name!.contains("en"))
                        .first
                        .name!,
                    style: Theme.of(context).textTheme.headline6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${S.of(context).category} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                FutureBuilder(
                  future: ItemProvider().getItemCategoryByIdOrName(itemModel.category!.name!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: LoadingWidget());
                    } else {
                      ItemCategoryModel itemCategoryModel = snapshot.data;
                      String englishName = itemCategoryModel.names!
                          .where((element) => element.language!.name!.contains("en"))
                          .first
                          .name!;
                      if (Localizations.localeOf(context).languageCode == "es") {
                        return FutureBuilder(
                          future: translator.translate(englishName, from: 'en', to: 'es'),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              Translation translation = snapshot.data;
                              return Text(
                                translation.text,
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          },
                        );
                      } else {
                        return Text(englishName);
                      }
                    }
                  },
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('${S.of(context).cost} : ', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(itemModel.cost.toString()),
            ]),
            const Divider(),
            Text(S.of(context).attributes, style: Theme.of(context).textTheme.headline6),
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemModel.attributes!.length,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: ItemProvider()
                        .getItemAttributeByIdOrName(itemModel.attributes![index].name!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: LoadingWidget());
                      } else {
                        ItemAttributeModel itemAttributeModel = snapshot.data;
                        final String itemAttributeModelName = itemAttributeModel.names!
                            .where((element) => element.language!.name!.contains("en"))
                            .first
                            .name!;
                        if (Localizations.localeOf(context).languageCode == "es") {
                          return FutureBuilder(
                            future:
                                translator.translate(itemAttributeModelName, from: 'en', to: 'es'),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                Translation translation = snapshot.data;
                                return Text(
                                  translation.text,
                                  textAlign: TextAlign.center,
                                );
                              } else {
                                return const LoadingWidget();
                              }
                            },
                          );
                        } else {
                          return Text(
                            itemAttributeModelName,
                            textAlign: TextAlign.center,
                          );
                        }
                      }
                    },
                  );
                }),
            const Divider(),
            Text(S.of(context).effects, style: Theme.of(context).textTheme.headline6),
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemModel.effectEntries!.length,
                itemBuilder: (BuildContext context, int index) {
                  final String effect = itemModel.effectEntries!
                      .where((element) => element.language!.name!.contains("en"))
                      .first
                      .effect!;
                  return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Localizations.localeOf(context).languageCode == "es"
                          ? FutureBuilder(
                              future: translator.translate(effect, from: 'en', to: 'es'),
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  Translation translation = snapshot.data;
                                  return Text(
                                    translation.text,
                                    textAlign: TextAlign.justify,
                                  );
                                } else {
                                  return const LoadingWidget();
                                }
                              },
                            )
                          : Text(
                              effect,
                              textAlign: TextAlign.justify,
                            ));
                }),
          ],
        ),
      ),
    );
  }
}
