import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/machine_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/domain/models/version_group_model.dart';

class MachineProvider {
  ResultsModel _machines = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _machinesStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get machinesSink => _machinesStream.sink.add;

  Stream<ResultsModel> get machinesStream => _machinesStream.stream;

  void dispose() {
    _machinesStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getMachines() async {
    final url = Uri.https(
        _url, '/api/v2/machine/', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final machines = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _machines.results!.addAll(machines.results!);
    machinesSink(_machines);

    offset += 20;

    return machines;
  }

  Future<dynamic> getMachineByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/machine/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final machineModel = MachineModel.fromJson(decodedData);
      return machineModel;
    } else {
      return null;
    }
  }

  Future<dynamic> getVersionGroupByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/version-group/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final versionGroupModel = VersionGroupModel.fromJson(decodedData);
      return versionGroupModel;
    } else {
      return null;
    }
  }
}
