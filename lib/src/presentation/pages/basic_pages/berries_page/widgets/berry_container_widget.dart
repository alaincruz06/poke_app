import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/berry_model.dart';
import 'package:poke_app/src/domain/models/encounter_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/pages/details_pages/berry_details_page/berry_details_page.dart';
import 'package:poke_app/src/presentation/pages/details_pages/pokemon_details_page/pokemon_details_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/shimmer_widgets.dart';

class BerryContainer extends StatelessWidget {
  const BerryContainer({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BerryProvider().getBerryByIdOrName(name),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const LoadingWidget();
        } else {
          final BerryModel berryModel = snapshot.data!;
          int berryID = berryModel.id;
          int finalSlashPosition = berryModel.item!.url!.lastIndexOf("/");
          String itemId = berryModel.item!.url!.substring(31, finalSlashPosition);

          return InkWell(
            onTap: () async {
              final route = MaterialPageRoute(
                  builder: (context) =>
                      BerryDetailsPage(berryName: name, berryID: berryID, berryItemID: itemId));

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
                      gradient: getGradientColorWithType(berryModel.naturalGiftType!.name!),
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
                    child: FutureBuilder(
                      future: BerryProvider().getBerryItemById(itemId),
                      builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: LoadingWidget());
                        } else {
                          final ItemModel itemModel = snapshot.data!;
                          return Image.network(
                            itemModel.sprites!.spritesDefault!,
                            height: 80,
                            width: 80,
                          );
                        }
                      },
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



/* import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/berry_provider.dart';
import 'package:poke_app/src/domain/models/berry_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/pages/berry_detail_page/berry_detail_page.dart';
import 'package:poke_app/src/presentation/pages/berry_detail_sliver_page/berry_detail_sliver_page.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

Widget berryContainer(
  BuildContext context,
  String name,
) {
  return InkWell(
    onTap: () async {
      BerryModel berryModel = await BerryProvider().getBerryByIdOrName(name);
      int berryID = berryModel.id;

      int finalSlashPosition = berryModel.item!.url!.lastIndexOf("/");
      String itemId = berryModel.item!.url!.substring(31, finalSlashPosition);

      final route = MaterialPageRoute(
          builder: (context) =>
              BerryDetailsPage(berryName: name, berryID: berryID, berryItemID: itemId));
      //BerryDetailSliverPage(berryName: name, berryID: berryID, berryItemID: itemId));
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
              future: BerryProvider().getBerryByIdOrName(name),
              builder: (BuildContext context, AsyncSnapshot<BerryModel> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: LoadingWidget());
                } else {
                  final BerryModel berryModel = snapshot.data!;
                  int finalSlashPosition = berryModel.item!.url!.lastIndexOf("/");
                  String itemId = berryModel.item!.url!.substring(31, finalSlashPosition);
                  return FutureBuilder(
                    future: BerryProvider().getBerryItemById(itemId),
                    builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: LoadingWidget());
                      } else {
                        final ItemModel itemModel = snapshot.data!;
                        return Image.network(
                          itemModel.sprites!.spritesDefault!,
                          height: 80,
                          width: 80,
                        );
                      }
                    },
                  );
                }
              },
            ),
          ), */
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
 */