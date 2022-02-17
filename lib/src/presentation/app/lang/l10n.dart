// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `PokeDex`
  String get appName {
    return Intl.message(
      'PokeDex',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sections`
  String get sections {
    return Intl.message(
      'Sections',
      name: 'sections',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Select a language`
  String get selectALanguage {
    return Intl.message(
      'Select a language',
      name: 'selectALanguage',
      desc: '',
      args: [],
    );
  }

  /// `Berries`
  String get berries {
    return Intl.message(
      'Berries',
      name: 'berries',
      desc: '',
      args: [],
    );
  }

  /// `Contest Categories`
  String get contestCategories {
    return Intl.message(
      'Contest Categories',
      name: 'contestCategories',
      desc: '',
      args: [],
    );
  }

  /// `Encounter Methods`
  String get encounterMethods {
    return Intl.message(
      'Encounter Methods',
      name: 'encounterMethods',
      desc: '',
      args: [],
    );
  }

  /// `Evolution Chains`
  String get evolutionChains {
    return Intl.message(
      'Evolution Chains',
      name: 'evolutionChains',
      desc: '',
      args: [],
    );
  }

  /// `Generation`
  String get generation {
    return Intl.message(
      'Generation',
      name: 'generation',
      desc: '',
      args: [],
    );
  }

  /// `Generations`
  String get generations {
    return Intl.message(
      'Generations',
      name: 'generations',
      desc: '',
      args: [],
    );
  }

  /// `Pokedexes`
  String get pokedexes {
    return Intl.message(
      'Pokedexes',
      name: 'pokedexes',
      desc: '',
      args: [],
    );
  }

  /// `Versions`
  String get versions {
    return Intl.message(
      'Versions',
      name: 'versions',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Locations`
  String get locations {
    return Intl.message(
      'Locations',
      name: 'locations',
      desc: '',
      args: [],
    );
  }

  /// `Machines (MTs)`
  String get machines_mts {
    return Intl.message(
      'Machines (MTs)',
      name: 'machines_mts',
      desc: '',
      args: [],
    );
  }

  /// `Moves (MOs)`
  String get moves_mos {
    return Intl.message(
      'Moves (MOs)',
      name: 'moves_mos',
      desc: '',
      args: [],
    );
  }

  /// `Machines`
  String get machines {
    return Intl.message(
      'Machines',
      name: 'machines',
      desc: '',
      args: [],
    );
  }

  /// `Moves`
  String get moves {
    return Intl.message(
      'Moves',
      name: 'moves',
      desc: '',
      args: [],
    );
  }

  /// `Pokémons`
  String get pokemons {
    return Intl.message(
      'Pokémons',
      name: 'pokemons',
      desc: '',
      args: [],
    );
  }

  /// `This app was made thanks to PokeApi`
  String get appWithPokeApiHelp {
    return Intl.message(
      'This app was made thanks to PokeApi',
      name: 'appWithPokeApiHelp',
      desc: '',
      args: [],
    );
  }

  /// `Alain Cruz Jiménez`
  String get alain {
    return Intl.message(
      'Alain Cruz Jiménez',
      name: 'alain',
      desc: '',
      args: [],
    );
  }

  /// `José Javier Quesada Madrigal`
  String get jose {
    return Intl.message(
      'José Javier Quesada Madrigal',
      name: 'jose',
      desc: '',
      args: [],
    );
  }

  /// `id/name`
  String get id_name {
    return Intl.message(
      'id/name',
      name: 'id_name',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Abilities`
  String get abilities {
    return Intl.message(
      'Abilities',
      name: 'abilities',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Is Main Series`
  String get is_main_series {
    return Intl.message(
      'Is Main Series',
      name: 'is_main_series',
      desc: '',
      args: [],
    );
  }

  /// `Effects`
  String get effects {
    return Intl.message(
      'Effects',
      name: 'effects',
      desc: '',
      args: [],
    );
  }

  /// `Effect (Short)`
  String get effects_short {
    return Intl.message(
      'Effect (Short)',
      name: 'effects_short',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Pokémon amount`
  String get pokesAmount {
    return Intl.message(
      'Pokémon amount',
      name: 'pokesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Held Items`
  String get held_items {
    return Intl.message(
      'Held Items',
      name: 'held_items',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Accuracy`
  String get accuracy {
    return Intl.message(
      'Accuracy',
      name: 'accuracy',
      desc: '',
      args: [],
    );
  }

  /// `Effect Chance`
  String get effect_chance {
    return Intl.message(
      'Effect Chance',
      name: 'effect_chance',
      desc: '',
      args: [],
    );
  }

  /// `Power Points`
  String get pp {
    return Intl.message(
      'Power Points',
      name: 'pp',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Power`
  String get power {
    return Intl.message(
      'Power',
      name: 'power',
      desc: '',
      args: [],
    );
  }

  /// `Damage Class`
  String get damage_class {
    return Intl.message(
      'Damage Class',
      name: 'damage_class',
      desc: '',
      args: [],
    );
  }

  /// `Effect Entries`
  String get effect_entries {
    return Intl.message(
      'Effect Entries',
      name: 'effect_entries',
      desc: '',
      args: [],
    );
  }

  /// `Learned by Pokemon`
  String get learned_by_pokemon {
    return Intl.message(
      'Learned by Pokemon',
      name: 'learned_by_pokemon',
      desc: '',
      args: [],
    );
  }

  /// `Target`
  String get target {
    return Intl.message(
      'Target',
      name: 'target',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
