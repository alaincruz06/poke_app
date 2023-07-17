import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/evolution_chain_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';

class EvolutionProvider {
  ResultsModel _evolutions = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _evolutionsStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get evolutionsSink => _evolutionsStream.sink.add;

  Stream<ResultsModel> get evolutionsStream => _evolutionsStream.stream;

  void dispose() {
    _evolutionsStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getEvolutions() async {
    final url = Uri.https(
        _url, '/api/v2/evolution-chain/', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final evolutions = ResultsModel.fromJson(decodedData);

    _evolutions.results!.addAll(evolutions.results!);
    evolutionsSink(_evolutions);

    offset += 20;

    return evolutions;
  }

  Future<dynamic> getEvolutionById(String id) async {
    final url = Uri.https(_url, '/api/v2/evolution-chain/$id/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final evolutionChainModel = EvolutionChainModel.fromJson(decodedData);
      return evolutionChainModel;
    } else {
      return null;
    }
  }
}
