//pokemon-species

import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/pokemon_species_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';

class PokemonSpeciesProvider {
  final String _url = 'pokeapi.co';

  Future<ResultsModel> getSpecies() async {
    final url = Uri.https(_url, '/api/v2/pokemon-species/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final species = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    return species;
  }

  Future<PokemonSpeciesModel> getSpecieByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/pokemon-species/$name/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final pokemonSpeciesProvider = PokemonSpeciesModel.fromJson(decodedData);

    return pokemonSpeciesProvider;
  }
}
