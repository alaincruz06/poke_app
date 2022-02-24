import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/ability_model.dart';

import 'dart:convert';
import 'dart:async';

class PokemonProvider {
  final String _url = 'pokeapi.co';

  Future<AbilityModel> getEvolutionById(String id) async {
    final url = Uri.https(_url, '/api/v2/evolution-chain/$id/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final abilityModel = AbilityModel.fromJson(decodedData);

    return abilityModel;
  }
}
