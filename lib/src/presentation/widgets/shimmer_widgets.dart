/* import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

Widget pokemonPageShimmer() {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade300,
          // baseColor: PokeColor().shadowBlue,
          // highlightColor: PokeColor().softBlue,
          child: const SizedBox(
            width: 150,
            height: 180,
          ),
        );
      });
}

Widget pokemonSearchedPageShimmer() {
  return Shimmer.fromColors(
    // baseColor: Colors.grey,
    // highlightColor: Colors.grey.shade300,
    baseColor: PokeColor().shadowBlue,
    highlightColor: PokeColor().softBlue,
    child: const SizedBox(
      width: 150,
      height: 180,
    ),
  );
}
 */