import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/ability_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';

class PokemonProvider {
  final String _url = 'pokeapi.co';

  Future<ResultsModel> getPokemons() async {
    final url = Uri.https(_url, '/api/v2/pokemon/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final pokemons = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    return pokemons;
  }

  Future<PokemonModel> getPokemonByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/pokemon/$name/');
    final resp = await http.get(
        url /* , headers: {
      'Content-Type': 'application/json',
    'Charset': 'utf-8'} */
        );
    final decodedData = json.decode(resp.body);
    final pokemonModel = PokemonModel.fromJson(decodedData);

    return pokemonModel;
  }

  Future<AbilityModel> getAbilityByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/ability/$name/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final abilityModel = AbilityModel.fromJson(decodedData);

    return abilityModel;
  }

  Future<ItemModel> getItemHeldByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/item/$name/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final itemModel = ItemModel.fromJson(decodedData);

    return itemModel;
  }

  /*Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);


    return peliculas.items;
  }





  Future<List<Pelicula>> getPopulares() async {
    
    if ( _cargando ) return [];

    _cargando = true;
    _popularesPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'  : _apikey,
      'language' : _language,
      'page'     : _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink( _populares );

    _cargando = false;
    return resp;

  }

  Future<List<Actor>> getCast( String peliId ) async {

    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key'  : _apikey,
      'language' : _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode( resp.body );

    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actores;

  }


  Future<List<Pelicula>> buscarPelicula( String query ) async {

    final url = Uri.https(_url, '3/search/movie', {
      'api_key'  : _apikey,
      'language' : _language,
      'query'    : query
    });

    return await _procesarRespuesta(url);

  } */

}
