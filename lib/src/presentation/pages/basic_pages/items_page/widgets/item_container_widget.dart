import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/presentation/pages/details_pages/item_details_page/item_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/shimmer_widgets.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ItemProvider().getItemByIdOrName(name),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        } else {
          final ItemModel itemModel = snapshot.data;
          return InkWell(
            onTap: () async {
              final route =
                  MaterialPageRoute(builder: (context) => ItemDetailsPage(itemModel: itemModel));

              Navigator.push(context, route);
            },
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Flex(direction: Axis.vertical, children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: _getNameSpanish(
                                Localizations.localeOf(context).languageCode, itemModel)),
                      ),
                    ]),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Image.network(
                      itemModel.sprites!.spritesDefault!,
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

//Spanish Name
Widget _getNameSpanish(String language, ItemModel itemModel) {
  bool existSpanish = false;
  for (var i = 0; i < itemModel.names!.length; i++) {
    if (itemModel.names![i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      itemModel.names!.where((element) => element.language!.name!.contains("es")).first.name!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      itemModel.names!.where((element) => element.language!.name!.contains("en")).first.name!,
      textAlign: TextAlign.justify,
    );
  }
}
