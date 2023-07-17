import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/lang/locale.dart';

class NoResultView extends StatelessWidget {
  const NoResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
                height: 100, width: 100, child: Image.asset(Assets.assetsImagesSadPikachu)),
          ),
          Expanded(
            child: Text(S.of(context).noResultsFound),
          ),
        ],
      ),
    );
  }
}
