import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/generation_model.dart';

import 'package:poke_app/src/domain/models/results_model.dart';

class GenerationProvider {
  ResultsModel _generations = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _generationsStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get generationsSink => _generationsStream.sink.add;

  Stream<ResultsModel> get generationsStream => _generationsStream.stream;

  void dispose() {
    _generationsStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getGenerations() async {
    final url = Uri.https(
        _url, '/api/v2/generation', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final generations = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _generations.results!.addAll(generations.results!);
    generationsSink(_generations);

    offset += 20;

    return generations;
  }

  Future<dynamic> getGenerationByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/generation/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final generationModel = GenerationModel.fromJson(decodedData);
      return generationModel;
    } else {
      return null;
    }
  }
}
