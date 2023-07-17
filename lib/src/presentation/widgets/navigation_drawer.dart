import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/constants/dimensions.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/berries_page/berries_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/contest_page/contest_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/evolutions_page/evolutions_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/generations_page/generations_page.dart';
import 'package:poke_app/src/presentation/pages/home_page/home_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/items_page/items_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/machines_page/machines_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/movimientos_page/movimientos_page.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/pokemon_page/pokemon_page.dart';

Widget crearMenu(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.50,
    child: Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Expanded(child: Image.asset(Assets.assetsImagesPokedexLogo))],
              ),
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsHome100px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(
                'Página Principal',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                final route = MaterialPageRoute(builder: (context) => const HomePage());
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(context, route, (route) => false);
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(S.of(context).sections),
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsElektrovieh100px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).pokemons),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => PokemonPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsDnaHelix128px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).evolutionChains),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => EvolutionsPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsStrawberry128px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).berries),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => BerriesPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsVisualGameBoy100px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).generations),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => GenerationsPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsOpenBox128px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).items),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => ItemsPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsSelfServiceKiosk100px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).machines_mts),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => MachinesPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Image.asset(Assets.assetsIconsClenchedFist100px,
                  height: navigationDrawerIconsHeight,
                  width: navigationDrawerIconsWidth,
                  color: Theme.of(context).iconTheme.color),
              title: Text(S.of(context).moves_mos),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => MovimientosPage(),
                );
                Navigator.of(context).pop();
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
