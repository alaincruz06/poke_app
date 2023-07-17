import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/data/remote_data/data_providers/evolution_provider.dart';
import 'package:poke_app/src/domain/models/evolution_chain_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/presentation/app/constants/methods.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/evolutions_page/widgets/evolution_container_widget.dart';
import 'package:poke_app/src/presentation/widgets/background_pokeball_widget.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/no_results_found_widget.dart';
import 'package:poke_app/src/presentation/widgets/search_widget/cubit/search_widget_cubit.dart';
import 'package:poke_app/src/presentation/widgets/search_widget/search_widget.dart';

class EvolutionsPage extends StatelessWidget {
  EvolutionsPage({Key? key}) : super(key: key);
  final evolutionProvider = EvolutionProvider();

  @override
  Widget build(BuildContext context) {
    evolutionProvider.getEvolutions();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).evolutions, style: Theme.of(context).textTheme.headline6),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          backgroundPokeBallWidget(context),
          SearchWidget(
            context: context,
            type: 'evolution',
            onlyId: true,
          ),
          StreamBuilder<ResultsModel>(
              stream: evolutionProvider.evolutionsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Center(child: Text(S.of(context).errorLoadingDataCheckConection));
                } else {
                  return BlocBuilder<SearchWidgetCubit, SearchWidgetState>(
                    builder: (context, state) {
                      return state.when(
                        init: () => _InitialListView(
                          resultsModel: snapshot.data!.results!,
                          siguientePagina: EvolutionProvider().getEvolutions,
                        ),
                        noFound: () => const NoResultView(),
                        searched: (responseModel) => _SearchListView(
                          evolutionChainModel: responseModel,
                        ),
                        searching: () => const LoadingWidget(),
                      );
                    },
                  );
                }
              })
        ],
      ),
    );
  }
}

class _InitialListView extends StatefulWidget {
  const _InitialListView({Key? key, required this.resultsModel, required this.siguientePagina})
      : super(key: key);

  final List<Result> resultsModel;
  final Function siguientePagina;

  @override
  State<_InitialListView> createState() => _InitialListViewState();
}

class _InitialListViewState extends State<_InitialListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        widget.siguientePagina();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.resultsModel.length,
        itemBuilder: (context, index) {
          return evolutionContainer(
            context,
            getIdFromResultsUrlEvolutionChains(widget.resultsModel[index].url!),
          );
        },
      ),
    );
  }
}

class _SearchListView extends StatelessWidget {
  const _SearchListView({
    Key? key,
    required this.evolutionChainModel,
  }) : super(key: key);
  final EvolutionChainModel evolutionChainModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Center(
        child: evolutionContainer(
          context,
          evolutionChainModel.id.toString(),
        ),
      ),
    );
  }
}
