
import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/results_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/berry_model.dart';


class BerryProvider {

  final String _url   = 'pokeapi.co';

  Future<ResultsModel> getBerries() async {

    final url = Uri.https(_url, '/api/v2/berry/');
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final berries = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    return berries;

  }


  Future<BerryModel> getBerryByIdOrName(String name) async {

    final url = Uri.https(_url, '/berry/$name/');
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final berry = BerryModel.fromJson(decodedData as Map<String, dynamic>);

    return berry;

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

