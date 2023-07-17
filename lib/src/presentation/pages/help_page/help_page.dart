import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);
  //página con la info de los atributos que devuelve la api para guiar al usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).help, style: Theme.of(context).textTheme.headline6),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Pokemons
            Text(
              S.of(context).pokemons + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Evolution Chains
            Text(
              S.of(context).evolutionChains + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Bayas
            Text(
              S.of(context).berries + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Encounter Methods
            Text(
              S.of(context).encounterMethods + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Objects
            Text(
              S.of(context).items + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Locations
            Text(
              S.of(context).locations + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Machines MTs
            Text(
              S.of(context).machines_mts + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Moves MOs
            Text(
              S.of(context).moves_mos + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
            //Contest Categorías
            Text(
              S.of(context).contestCategories + ": ",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(
              color: PokeColor().softBlue,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
