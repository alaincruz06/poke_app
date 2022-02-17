import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/berry_provider.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/navigation_drawer.dart';
import 'package:poke_app/src/presentation/widgets/pop_menu_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).appName, style: Theme.of(context).textTheme.headline6),
         actions: const [
             PopMenuHomePage(),
          
        ],
      ),
       drawer: crearMenu(context),
      body: Column(children: [ 
        Hero(
              tag: 'foto_intro',
              child: Image.asset(Assets.assetsImagesPokedexLogo),
            ),
        const Text('Hola ...'),
        
        ]),
    );
  }
}