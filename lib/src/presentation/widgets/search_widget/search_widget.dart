import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:poke_app/src/presentation/widgets/search_widget/cubit/search_widget_cubit.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key, required this.context, required this.type, this.onlyId})
      : super(key: key);

  BuildContext context;
  String type;
  bool? onlyId;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String query = '';
  late BuildContext contexto;
  bool onlyId = false;

  @override
  void initState() {
    contexto = widget.context;
    if (widget.onlyId != null) {
      onlyId = widget.onlyId!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              cursorColor: PokeColor().shadowBlue,
              style: Theme.of(context).textTheme.bodyText2,
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                fillColor: PokeColor().softBlue,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: S.of(context).search,
                hintText: onlyId == true ? 'id' : S.of(context).id_name,
                labelStyle: Theme.of(context).textTheme.bodyText2,
              ),
              onChanged: (valor) {
                setState(() {
                  query = valor;
                });
              },
              onSubmitted: (valor) {
                context.read<SearchWidgetCubit>().onSearch(query, widget.type);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                context.read<SearchWidgetCubit>().onSearch(query, widget.type);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: Image.asset(Assets.assetsImagesPokesearch).image,
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
