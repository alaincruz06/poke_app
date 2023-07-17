import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/data/remote_data/data_providers/providers.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/generations_page/widgets/generation_container_widget.dart';
import 'package:poke_app/src/presentation/widgets/background_pokeball_widget.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/search_widget/cubit/search_widget_cubit.dart';

class GenerationsPage extends StatelessWidget {
  GenerationsPage({Key? key}) : super(key: key);
  final generationsProvider = GenerationProvider();

  @override
  Widget build(BuildContext context) {
    generationsProvider.getGenerations();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).generations, style: Theme.of(context).textTheme.headline6),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          backgroundPokeBallWidget(context),
          StreamBuilder<ResultsModel>(
              stream: generationsProvider.generationsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Center(child: Text(S.of(context).errorLoadingDataCheckConection));
                } else {
                  return _InitialListView(
                    resultsModel: snapshot.data!.results!,
                    siguientePagina: GenerationProvider().getGenerations,
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
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.resultsModel.length,
      itemBuilder: (context, index) {
        return generationContainer(context, widget.resultsModel[index].name!);
      },
    );
  }
}
