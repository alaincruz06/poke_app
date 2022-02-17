import 'package:flutter/material.dart';
import 'package:poke_app/src/data/remote_data/data_providers/berry_provider.dart';
import 'package:poke_app/src/domain/models/results_model.dart';
import 'package:poke_app/src/presentation/widgets/loading_widget.dart';

class BerriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<ResultsModel>(
                  future: BerryProvider().getBerries(),
                  builder: (BuildContext context, AsyncSnapshot<ResultsModel> snapshot) {
                   if(!snapshot.hasData){
                     return const LoadingWidget();
                   }
                   else {
                   ResultsModel berriesModel = snapshot.data!;
                   
                   return Column(
                     children: [
                       Text('"${berriesModel.results!.first.name}"', 
        textAlign: TextAlign.justify,),
                       Padding(
                         padding: const EdgeInsets.only(left: 28.0),
                         child: Text('(${berriesModel.results!.first.url})'),
                       ),
                     ],
                   );
                   }
                  },
                ),
    );
  }
}