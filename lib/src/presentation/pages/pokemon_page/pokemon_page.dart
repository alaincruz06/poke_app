import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_app/src/data/remote_data/data_providers/pokemon_provider.dart';
import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:poke_app/src/presentation/pages/pokemon_page/widgets/pokemon_container_widget.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {

  String _textToSearch = "";
  int _cantidadDePokes = 0;

  Future<void> _getParams() async{

ResultsModel resultsModel =  await PokemonProvider().getPokemons();
setState((){
  _cantidadDePokes =  resultsModel.count ?? 0;
});

  }

  @override
  void initState() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _getParams();
      });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pokemons + " (" + _cantidadDePokes.toString() + ")", style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: 
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
           Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1,
                   child: 
                   Image.asset(Assets.assetsImagesPokesearch, height: 70,)),
                  Expanded(flex: 2,
                   child: TextField(
                       cursorColor: PokeColor().shadowBlue,
                       style: Theme.of(context).textTheme.bodyText2,
                       textCapitalization: TextCapitalization.none,
                       decoration: InputDecoration(
                         fillColor: PokeColor().softBlue,
                         floatingLabelBehavior: FloatingLabelBehavior.always,
                         labelText: S.of(context).search,
                         hintText: S.of(context).id_name,
                         labelStyle: Theme.of(context).textTheme.bodyText2,
                       ),
                       onSubmitted: (valor) {
                         setState(() {
                           _textToSearch = valor;
                         });
                       },
                     ),
                 ),
                ],
              ),
            ),
             _textToSearch == "" ?
              Padding(
                 padding: const EdgeInsets.only(top: 90.0),
                child: FutureBuilder(
                 future: PokemonProvider().getPokemons(),
                 builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(!snapshot.hasData){
                    return const Center(child: LoadingWidget());
                  }
                  else {
                  ResultsModel pokemonsModel = snapshot.data!;
                List<Result>? results  = pokemonsModel.results ?? [];
          
                   return ListaPokemons(
             results: results,
            // siguientePagina: PokemonProvider().getAllCharactersImpl,
                );
                  }
                 },
             ),
              )  :
              
               Padding(
                 padding: const EdgeInsets.only(top: 90.0),
                 child: FutureBuilder(
                   future: PokemonProvider().getPokemonByIdOrName(_textToSearch),
                   builder: (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
                     if(!snapshot.hasData){
                       //Sad Pikachu (no hay pokemons con el criterio introducido)
                    return const Center(child: LoadingWidget());
                  }
                  else {
                    PokemonModel pokemonModel = snapshot.data!;
                 
          
                   return Center(child: SizedBox(height: 200, width: 200,child: pokemonContainer(context, pokemonModel.name!)));
                  }
                 },
                 ),
               ),
        ],
      ),
    );
  }
}


class ListaPokemons extends StatelessWidget {
  ListaPokemons({
    Key? key,
    required this.results,
  }) : super(key: key);

  final List<Result> results;
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.2,
  );
 // final Function siguientePagina;

  @override
  Widget build(BuildContext context) {
  /*   _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent) {
            debugPrint("Siguiente Pagina");
      //  siguientePagina();
      }
    }); */

    return GridView.builder(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
      shrinkWrap: true,
      //controller: _pageController,
      physics: const BouncingScrollPhysics(),
      itemCount: results.length,
      itemBuilder: (context, index) {
        return pokemonContainer(
          context, results[index].name!, 
        );
      },
    );
  }
}
