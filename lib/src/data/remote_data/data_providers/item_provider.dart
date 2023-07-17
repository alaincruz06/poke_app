import 'package:http/http.dart' as http;
import 'package:poke_app/src/domain/models/item_attribute_model.dart';
import 'package:poke_app/src/domain/models/item_category_model.dart';
import 'package:poke_app/src/domain/models/item_model.dart';

import 'dart:convert';
import 'dart:async';

import 'package:poke_app/src/domain/models/results_model.dart';

class ItemProvider {
  ResultsModel _items = ResultsModel(count: 0, results: [], next: '', previous: '');

  final _itemsStream = StreamController<ResultsModel>.broadcast();

  Function(ResultsModel) get itemsSink => _itemsStream.sink.add;

  Stream<ResultsModel> get itemsStream => _itemsStream.stream;

  void dispose() {
    _itemsStream.close();
  }

  final String _url = 'pokeapi.co';

  int offset = 0;
  final int limit = 20;

  Future<ResultsModel> getItems() async {
    final url =
        Uri.https(_url, '/api/v2/item/', {'offset': offset.toString(), 'limit': limit.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final items = ResultsModel.fromJson(decodedData as Map<String, dynamic>);

    _items.results!.addAll(items.results!);
    itemsSink(_items);

    offset += 20;

    return items;
  }

  Future<dynamic> getItemByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/item/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final itemModel = ItemModel.fromJson(decodedData);
      return itemModel;
    } else {
      return null;
    }
  }

  Future<dynamic> getItemAttributeByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/item-attribute/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final itemAttributeModel = ItemAttributeModel.fromJson(decodedData);
      return itemAttributeModel;
    } else {
      return null;
    }
  }

  Future<dynamic> getItemCategoryByIdOrName(String name) async {
    final url = Uri.https(_url, '/api/v2/item-category/$name/');
    final resp = await http.get(url);

    final decodedData = resp.body != "Not Found" ? json.decode(resp.body) : null;
    if (decodedData != null) {
      final itemCategoryModel = ItemCategoryModel.fromJson(decodedData);
      return itemCategoryModel;
    } else {
      return null;
    }
  }
}
