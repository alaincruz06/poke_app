import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/berry_flavor_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/berry_model.dart';

class BerryProvider {
  ResultsModel _berries = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _berriesStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get berriesSink => _berriesStream.sink.add;

  Stream<ResultsModel> get berriesStream => _berriesStream.stream;

  void dispose() {
    _berriesStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getBerries() async {
    final url =
        Uri.https(_url, '/api/v2/berry/', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final berries = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _berries.results!.addAll(berries.results!);
    berriesSink(_berries);

    offset += 20;

    return berries;
  }

  Future<BerryModel> getBerryByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/berry/$name/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final berry = BerryModel.fromJson(decodedData as Map<String, dynamic>);

    return berry;
  }

  Future<ItemModel> getBerryItemById(String itemId) async {
    final url = Uri.https(_url, '/api/v2/item/$itemId/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final berryItem = ItemModel.fromJson(decodedData);

    return berryItem;
  }

  Future<BerryFlavorModel> getBerryFlavorById(String flavorId) async {
    final url = Uri.https(_url, '/api/v2/berry-flavor/$flavorId/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final berryFlavor = BerryFlavorModel.fromJson(decodedData);

    return berryFlavor;
  }
}
