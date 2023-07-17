import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/move_ailment_model.dart';
import 'package:poke_app/src/domain/models/move_model.dart';
import 'package:poke_app/src/domain/models/move_target_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/domain/models/stat_model.dart';

class MoveProvider {
  ResultsModel _moves = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _movesStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get movesSink => _movesStream.sink.add;

  Stream<ResultsModel> get movesStream => _movesStream.stream;

  void dispose() {
    _movesStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getMoves() async {
    final url =
        Uri.https(_url, '/api/v2/move/', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final moves = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _moves.results!.addAll(moves.results!);
    movesSink(_moves);

    offset += 20;

    return moves;
  }

  Future<dynamic> getMoveByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/move/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final moveModel = MoveModel.fromJson(decodedData);
      return moveModel;
    } else {
      return null;
    }
  }

  Future<dynamic> getMoveTargetByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/move-target/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final moveTargetModel = MoveTargetModel.fromJson(decodedData);
      return moveTargetModel;
    } else {
      return null;
    }
  }

  Future<dynamic> getMoveAilmentByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/move-ailment/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final moveAilmentModel = MoveAilmentModel.fromJson(decodedData);
      return moveAilmentModel;
    } else {
      return null;
    }
  }

  Future<dynamic> getMoveStatAffectedByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/stat/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final statModel = StatModel.fromJson(decodedData);
      return statModel;
    } else {
      return null;
    }
  }
}
