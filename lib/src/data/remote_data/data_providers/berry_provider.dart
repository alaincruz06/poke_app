import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/berry_model.dart';

class BerryProvider {
  final String _url = 'pokeapi.co';

  Future<ResultsModel> getBerries() async {
    final url = Uri.https(_url, '/api/v2/berry/');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final berries = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

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
}
