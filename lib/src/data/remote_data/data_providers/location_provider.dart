import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/location_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';

class LocationProvider {
  ResultsModel _locations = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _locationsStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get locationsSink => _locationsStream.sink.add;

  Stream<ResultsModel> get locationsStream => _locationsStream.stream;

  void dispose() {
    _locationsStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getLocations() async {
    final url = Uri.https(
        _url, '/api/v2/location/', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final locations = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _locations.results!.addAll(locations.results!);
    locationsSink(_locations);

    offset += 20;

    return locations;
  }

  Future<dynamic> getLocationByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/location/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final locationModel = LocationModel.fromJson(decodedData);
      return locationModel;
    } else {
      return null;
    }
  }
}
