import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/data/remote_data/data_providers/machine_provider.dart';
import 'package:poke_app/src/domain/models/location_model.dart';
import 'package:poke_app/src/domain/models/machine_model.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/pages/basic_pages/machines_page/widgets/machine_container_widget.dart';
import 'package:poke_app/src/presentation/widgets/background_pokeball_widget.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';
import 'package:poke_app/src/presentation/widgets/no_results_found_widget.dart';
import 'package:poke_app/src/presentation/widgets/search_widget/cubit/search_widget_cubit.dart';
import 'package:poke_app/src/presentation/widgets/search_widget/search_widget.dart';

class MachinesPage extends StatelessWidget {
  MachinesPage({Key? key}) : super(key: key);
  final machineProvider = MachineProvider();

  @override
  Widget build(BuildContext context) {
    machineProvider.getMachines();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).machines_mts,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        backgroundPokeBallWidget(context),
        SearchWidget(
          context: context,
          type: 'machine',
          onlyId: true,
        ),
        StreamBuilder<ResultsModel>(
          stream: machineProvider.machinesStream,
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
                      siguientePagina: MachineProvider().getMachines,
                    ),
                    noFound: () => const NoResultView(),
                    searched: (responseModel) => _SearchListView(
                      machineFound: responseModel,
                    ),
                    //TODO poner shimmer
                    searching: () => const LoadingWidget(),
                  );
                },
              );
            }
          },
        ),
      ]),
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
          String name = widget.resultsModel[index].url!.substring(34).replaceAll('/', '');
          return MachineContainer(
            name: name,
          );
        },
      ),
    );
  }
}

class _SearchListView extends StatelessWidget {
  const _SearchListView({
    Key? key,
    required this.machineFound,
  }) : super(key: key);
  final MachineModel machineFound;

  //TODO revisar por qué no coge bien el texto debajo de la foto

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Center(
        child: MachineContainer(
          name: machineFound.id.toString(),
        ),
      ),
    );
  }
}
