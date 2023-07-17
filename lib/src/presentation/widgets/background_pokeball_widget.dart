import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';

Widget backgroundPokeBallWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Transform.rotate(
          alignment: Alignment.topCenter,
          angle: -pi / 5.0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 0.2,
            child: Image.asset(
              Assets.assetsImagesWhitePokeballParaFondo,
            ),
          ),
        ),
      ],
    ),
  );
}
