import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/encounter_method_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';

class EncounterMethodProvider {
  final String _url = 'pokeapi.co';

  Future<ResultsModel> getEncounterMethods() async {
    final url = Uri.https(_url, '/api/v2/encounter-method/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final encounters = ResultsModel.fromJson(decodedData);

    return encounters;
  }

  Future<EncounterMethodModel> getEncounterMethodById(String id) async {
    final url = Uri.https(_url, '/api/v2/encounter-method/$id/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final encounterMethodModel = EncounterMethodModel.fromJson(decodedData);

    return encounterMethodModel;
  }
}
