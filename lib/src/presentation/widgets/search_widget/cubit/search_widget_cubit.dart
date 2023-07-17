import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/src/data/remote_data/data_providers/machine_provider.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';

part 'search_widget_cubit.freezed.dart';
part 'search_widget_state.dart';

class SearchWidgetCubit extends Cubit<SearchWidgetState> {
  SearchWidgetCubit() : super(const SearchWidgetState.init());

  void onSearch(String query, String type) {
    emit(const SearchWidgetState.searching());

    if (query.isEmpty) {
      emit(const SearchWidgetState.init());
    } else if (query.isNotEmpty && type.isNotEmpty) {
      _search(query, type);
    }
  }

  void _search(String query, String type) async {
    late dynamic searchResponse;

    switch (type) {
      case 'pokemon':
        searchResponse = await PokemonProvider().getPokemonByIdOrName(query);
        break;
      case 'berry':
        searchResponse = await BerryProvider().getBerryByIdOrName(query);
        break;
      case 'evolution':
        searchResponse = await EvolutionProvider().getEvolutionById(query);
        break;
      case 'items':
        searchResponse = await ItemProvider().getItemByIdOrName(query);
        break;
      case 'location':
        searchResponse = await LocationProvider().getLocationByIdOrName(query);
        break;
      case 'machine':
        searchResponse = await MachineProvider().getMachineByIdOrName(query);
        break;
      case 'move':
        searchResponse = await MoveProvider().getMoveByIdOrName(query);
        break;
      //TODO add searchs
    }

    if (searchResponse == null) {
      emit(const SearchWidgetState.noFound());
    } else {
      emit(SearchWidgetState.searched(searchResponse));
    }
  }
}
