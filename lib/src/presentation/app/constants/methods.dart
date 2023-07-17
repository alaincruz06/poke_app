import 'package:flutter/material.dart';
import 'package:poke_app/src/domain/models/item_model.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

double hectogramsToKilograms(int weight) {
  return weight / 10;
}

double decimetresToMetres(int height) {
  return height / 10;
}

//Spanish Items Effects
Widget getItemsEffectSpanish(String language, List<EffectEntry>? effects) {
  bool existSpanish = false;
  for (var i = 0; i < effects!.length; i++) {
    if (effects[i].language!.name!.contains("es")) {
      existSpanish = true;
    }
  }
  if (language == "es" && existSpanish) {
    return Text(
      effects.where((element) => element.language!.name!.contains("es")).first.effect!,
      textAlign: TextAlign.justify,
    );
  } else {
    return Text(
      effects.where((element) => element.language!.name!.contains("en")).first.effect!,
      textAlign: TextAlign.justify,
    );
  }
}

//Colors
Color getColorWithType(String pokemonType) {
  switch (pokemonType) {
    case 'normal':
      return PokeColor().normal;
    case 'fighting':
      return PokeColor().fight;
    case 'flying':
      return PokeColor().flying;
    case 'poison':
      return PokeColor().poison;
    case 'ground':
      return PokeColor().ground;
    case 'rock':
      return PokeColor().rock;
    case 'bug':
      return PokeColor().bug;
    case 'ghost':
      return PokeColor().ghost;
    case 'steel':
      return PokeColor().steel;
    case 'fire':
      return PokeColor().fire;
    case 'water':
      return PokeColor().water;
    case 'grass':
      return PokeColor().grass;
    case 'electric':
      return PokeColor().electric;
    case 'psychic':
      return PokeColor().psychic;
    case 'ice':
      return PokeColor().ice;
    case 'dragon':
      return PokeColor().dragon;
    case 'dark':
      return PokeColor().dark;
    case 'fairy':
      return PokeColor().fairy;
    case 'shadow':
      return PokeColor().shadow;
    default:
      return PokeColor().normal;
  }
}

Gradient getGradientColorWithType(String pokemonType) {
  switch (pokemonType) {
    case 'normal':
      return gradientForPokemons(PokeColor().normal, PokeColor().normal.withAlpha(0));
    case 'fighting':
      return gradientForPokemons(PokeColor().fight, PokeColor().fight.withAlpha(0));
    case 'flying':
      return gradientForPokemons(PokeColor().flying, PokeColor().flying.withAlpha(0));
    case 'poison':
      return gradientForPokemons(PokeColor().poison, PokeColor().poison.withAlpha(0));
    case 'ground':
      return gradientForPokemons(PokeColor().ground, PokeColor().ground.withAlpha(0));
    case 'rock':
      return gradientForPokemons(PokeColor().rock, PokeColor().rock.withAlpha(0));
    case 'bug':
      return gradientForPokemons(PokeColor().bug, PokeColor().bug.withAlpha(0));
    case 'ghost':
      return gradientForPokemons(PokeColor().ghost, PokeColor().ghost.withAlpha(0));
    case 'steel':
      return gradientForPokemons(PokeColor().steel, PokeColor().steel.withAlpha(0));
    case 'fire':
      return gradientForPokemons(PokeColor().fire, PokeColor().fire.withAlpha(0));
    case 'water':
      return gradientForPokemons(PokeColor().water, PokeColor().water.withAlpha(0));
    case 'grass':
      return gradientForPokemons(PokeColor().grass, PokeColor().grass.withAlpha(0));
    case 'electric':
      return gradientForPokemons(PokeColor().electric, PokeColor().electric.withAlpha(0));
    case 'psychic':
      return gradientForPokemons(PokeColor().psychic, PokeColor().psychic.withAlpha(0));
    case 'ice':
      return gradientForPokemons(PokeColor().ice, PokeColor().ice.withAlpha(0));
    case 'dragon':
      return gradientForPokemons(PokeColor().dragon, PokeColor().dragon.withAlpha(0));
    case 'dark':
      return gradientForPokemons(PokeColor().dark, PokeColor().dark.withAlpha(0));
    case 'fairy':
      return gradientForPokemons(PokeColor().fairy, PokeColor().fairy.withAlpha(0));
    case 'shadow':
      return gradientForPokemons(PokeColor().shadow, PokeColor().shadow.withAlpha(0));
    default:
      return gradientForPokemons(PokeColor().normal, PokeColor().normal.withAlpha(0));
  }
}

LinearGradient gradientForPokemons(Color initial, Color ending) {
  return LinearGradient(
    colors: [initial, ending],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

String getIdFromResultsUrlEvolutionChains(String url) {
  int finalSlashPosition = url.lastIndexOf("/");
  String evolutionChainId = url.substring(42, finalSlashPosition);
  return evolutionChainId;
}
