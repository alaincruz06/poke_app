import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/widgets/navigation_drawer.dart';
import 'package:poke_app/src/presentation/widgets/pop_menu_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName, style: Theme.of(context).textTheme.headline6),
        actions: const [
          PopMenuHomePage(),
        ],
      ),
      drawer: crearMenu(context),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'foto_intro',
            child: Image.asset(Assets.assetsImagesPokedexLogo),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            S.of(context).mainText,
            textAlign: TextAlign.justify,
          ),
        ),
      ]),
    );
  }
}
