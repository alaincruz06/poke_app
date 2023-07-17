import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/ability_model.dart';
import 'package:poke_app/src/domain/models/encounter_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/pokemon_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/domain/models/type_model.dart';

class PokemonProvider {
  ResultsModel _pokemons = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _pokemonsStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get pokemonsSink => _pokemonsStream.sink.add;

  Stream<ResultsModel> get pokemonsStream => _pokemonsStream.stream;

  void dispose() {
    _pokemonsStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getPokemons() async {
    final url = Uri.https(
        _url, '/api/v2/pokemon', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final pokemons = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _pokemons.results!.addAll(pokemons.results!);
    pokemonsSink(_pokemons);

    offset += 20;

    return pokemons;
  }

  Future<dynamic> getPokemonByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/pokemon/$name/');
    final resp = await http.get(
        url /* , headers: {
      'Content-Type': 'application/json',
    'Charset': 'utf-8'} */
        );

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final pokemonModel = PokemonModel.fromJson(decodedData);
      return pokemonModel;
    } else {
      return null;
    }
  }

  Future<AbilityModel> getAbilityByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/ability/$name/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final abilityModel = AbilityModel.fromJson(decodedData);

    return abilityModel;
  }

  Future<TypeModel> getTypeByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/type/$name/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final typeModel = TypeModel.fromJson(decodedData);

    return typeModel;
  }

  Future<EncounterModel> getEncountersByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/pokemon/$name/encounters');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final encounterModel = EncounterModel.fromJson(decodedData);

    return encounterModel;
  }
}
