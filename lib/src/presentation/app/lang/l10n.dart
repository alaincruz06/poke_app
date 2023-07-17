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

  /// `PokéDex`
  String get appName {
    return Intl.message(
      'PokéDex',
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

  /// `Machines (TMs)`
  String get machines_mts {
    return Intl.message(
      'Machines (TMs)',
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

  /// `No Results found`
  String get noResultsFound {
    return Intl.message(
      'No Results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Species`
  String get species {
    return Intl.message(
      'Species',
      name: 'species',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }

  /// `Doesn't carry any items`
  String get doesntcarryitems {
    return Intl.message(
      'Doesn\'t carry any items',
      name: 'doesntcarryitems',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Evolutions`
  String get evolutions {
    return Intl.message(
      'Evolutions',
      name: 'evolutions',
      desc: '',
      args: [],
    );
  }

  /// `Evolution`
  String get evolution {
    return Intl.message(
      'Evolution',
      name: 'evolution',
      desc: '',
      args: [],
    );
  }

  /// `Growth`
  String get growth {
    return Intl.message(
      'Growth',
      name: 'growth',
      desc: '',
      args: [],
    );
  }

  /// `Harvest`
  String get harvest {
    return Intl.message(
      'Harvest',
      name: 'harvest',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Smoothness`
  String get smoothness {
    return Intl.message(
      'Smoothness',
      name: 'smoothness',
      desc: '',
      args: [],
    );
  }

  /// `Soil Dryness`
  String get soildryness {
    return Intl.message(
      'Soil Dryness',
      name: 'soildryness',
      desc: '',
      args: [],
    );
  }

  /// `Firmness`
  String get firmness {
    return Intl.message(
      'Firmness',
      name: 'firmness',
      desc: '',
      args: [],
    );
  }

  /// `Flavors`
  String get flavors {
    return Intl.message(
      'Flavors',
      name: 'flavors',
      desc: '',
      args: [],
    );
  }

  /// `Characteristics`
  String get characteristics {
    return Intl.message(
      'Characteristics',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Held By Pokémon`
  String get heldByPokemon {
    return Intl.message(
      'Held By Pokémon',
      name: 'heldByPokemon',
      desc: '',
      args: [],
    );
  }

  /// `Natural Gift Power`
  String get naturalGiftPower {
    return Intl.message(
      'Natural Gift Power',
      name: 'naturalGiftPower',
      desc: '',
      args: [],
    );
  }

  /// `Natural Gift Type`
  String get naturalGiftType {
    return Intl.message(
      'Natural Gift Type',
      name: 'naturalGiftType',
      desc: '',
      args: [],
    );
  }

  /// `Base Experience`
  String get baseExperience {
    return Intl.message(
      'Base Experience',
      name: 'baseExperience',
      desc: '',
      args: [],
    );
  }

  /// `No Evolutions Found`
  String get noEvolutionsFound {
    return Intl.message(
      'No Evolutions Found',
      name: 'noEvolutionsFound',
      desc: '',
      args: [],
    );
  }

  /// `Baby Trigger Item`
  String get babyTriggerItem {
    return Intl.message(
      'Baby Trigger Item',
      name: 'babyTriggerItem',
      desc: '',
      args: [],
    );
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Held Item`
  String get heldItem {
    return Intl.message(
      'Held Item',
      name: 'heldItem',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message(
      'Item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Known Move`
  String get knownMove {
    return Intl.message(
      'Known Move',
      name: 'knownMove',
      desc: '',
      args: [],
    );
  }

  /// `Known Move Type`
  String get knownMoveType {
    return Intl.message(
      'Known Move Type',
      name: 'knownMoveType',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Min. Affection`
  String get minAffection {
    return Intl.message(
      'Min. Affection',
      name: 'minAffection',
      desc: '',
      args: [],
    );
  }

  /// `Min. Beauty`
  String get minBeauty {
    return Intl.message(
      'Min. Beauty',
      name: 'minBeauty',
      desc: '',
      args: [],
    );
  }

  /// `Min. Happiness`
  String get minHappiness {
    return Intl.message(
      'Min. Happiness',
      name: 'minHappiness',
      desc: '',
      args: [],
    );
  }

  /// `Min. Level`
  String get minLevel {
    return Intl.message(
      'Min. Level',
      name: 'minLevel',
      desc: '',
      args: [],
    );
  }

  /// `Needs Overworld Rain`
  String get needsOverworldRain {
    return Intl.message(
      'Needs Overworld Rain',
      name: 'needsOverworldRain',
      desc: '',
      args: [],
    );
  }

  /// `Party Species`
  String get partySpecies {
    return Intl.message(
      'Party Species',
      name: 'partySpecies',
      desc: '',
      args: [],
    );
  }

  /// `Type in Party`
  String get partyType {
    return Intl.message(
      'Type in Party',
      name: 'partyType',
      desc: '',
      args: [],
    );
  }

  /// `Relative Physical Stats`
  String get relativePhysicalStats {
    return Intl.message(
      'Relative Physical Stats',
      name: 'relativePhysicalStats',
      desc: '',
      args: [],
    );
  }

  /// `Time Of Day`
  String get timeOfDay {
    return Intl.message(
      'Time Of Day',
      name: 'timeOfDay',
      desc: '',
      args: [],
    );
  }

  /// `Trade Species`
  String get tradeSpecies {
    return Intl.message(
      'Trade Species',
      name: 'tradeSpecies',
      desc: '',
      args: [],
    );
  }

  /// `Turn Upside Down`
  String get turnUpsideDown {
    return Intl.message(
      'Turn Upside Down',
      name: 'turnUpsideDown',
      desc: '',
      args: [],
    );
  }

  /// `Attack > Defense`
  String get attackBiggerDefense {
    return Intl.message(
      'Attack > Defense',
      name: 'attackBiggerDefense',
      desc: '',
      args: [],
    );
  }

  /// `Attack < Defense`
  String get attackLesserDefense {
    return Intl.message(
      'Attack < Defense',
      name: 'attackLesserDefense',
      desc: '',
      args: [],
    );
  }

  /// `Attack = Defense`
  String get attackEqualsDefense {
    return Intl.message(
      'Attack = Defense',
      name: 'attackEqualsDefense',
      desc: '',
      args: [],
    );
  }

  /// `The Pokédex (Japanese: ポケモン図鑑 illustrated Pokémon encyclopedia) is an invaluable tool to Trainers in the Pokémon world. It gives information about all Pokémon, items, moves, berries (and many other things) in the world that are contained in its database, although it differs in how it acquires and presents information over the different media. However, they are also only given to a few Trainers at a time, generally to the ones that are felt to have exceptional potential and skill, in this case if you are reading this, you're the ideal. If you know a little about the Pokémon World you may consider this as a 'National Pokédex' that records information about all known Pokémon (and the Pokémon World). While the concept of a Pokédex has existed for a long period, the digital version of it is a more recent invention created by Professor Oak.`
  String get mainText {
    return Intl.message(
      'The Pokédex (Japanese: ポケモン図鑑 illustrated Pokémon encyclopedia) is an invaluable tool to Trainers in the Pokémon world. It gives information about all Pokémon, items, moves, berries (and many other things) in the world that are contained in its database, although it differs in how it acquires and presents information over the different media. However, they are also only given to a few Trainers at a time, generally to the ones that are felt to have exceptional potential and skill, in this case if you are reading this, you\'re the ideal. If you know a little about the Pokémon World you may consider this as a \'National Pokédex\' that records information about all known Pokémon (and the Pokémon World). While the concept of a Pokédex has existed for a long period, the digital version of it is a more recent invention created by Professor Oak.',
      name: 'mainText',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data. Check your connection`
  String get errorLoadingDataCheckConection {
    return Intl.message(
      'Error loading data. Check your connection',
      name: 'errorLoadingDataCheckConection',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Doesn't evolve`
  String get doesntEvolve {
    return Intl.message(
      'Doesn\'t evolve',
      name: 'doesntEvolve',
      desc: '',
      args: [],
    );
  }

  /// `Attributes`
  String get attributes {
    return Intl.message(
      'Attributes',
      name: 'attributes',
      desc: '',
      args: [],
    );
  }

  /// `Stat Changes`
  String get statChanges {
    return Intl.message(
      'Stat Changes',
      name: 'statChanges',
      desc: '',
      args: [],
    );
  }

  /// `Metadata`
  String get meta {
    return Intl.message(
      'Metadata',
      name: 'meta',
      desc: '',
      args: [],
    );
  }

  /// `Ailment`
  String get ailment {
    return Intl.message(
      'Ailment',
      name: 'ailment',
      desc: '',
      args: [],
    );
  }

  /// `Ailment Chance`
  String get ailment_chance {
    return Intl.message(
      'Ailment Chance',
      name: 'ailment_chance',
      desc: '',
      args: [],
    );
  }

  /// `Critical Rate`
  String get critRate {
    return Intl.message(
      'Critical Rate',
      name: 'critRate',
      desc: '',
      args: [],
    );
  }

  /// `Drain`
  String get drain {
    return Intl.message(
      'Drain',
      name: 'drain',
      desc: '',
      args: [],
    );
  }

  /// `Flinch Chance`
  String get flinch_chance {
    return Intl.message(
      'Flinch Chance',
      name: 'flinch_chance',
      desc: '',
      args: [],
    );
  }

  /// `Healing`
  String get healing {
    return Intl.message(
      'Healing',
      name: 'healing',
      desc: '',
      args: [],
    );
  }

  /// `Max Hits`
  String get maxHits {
    return Intl.message(
      'Max Hits',
      name: 'maxHits',
      desc: '',
      args: [],
    );
  }

  /// `Max Turns`
  String get maxTurns {
    return Intl.message(
      'Max Turns',
      name: 'maxTurns',
      desc: '',
      args: [],
    );
  }

  /// `Min Hits`
  String get minHits {
    return Intl.message(
      'Min Hits',
      name: 'minHits',
      desc: '',
      args: [],
    );
  }

  /// `Min Turns`
  String get minTurns {
    return Intl.message(
      'Min Turns',
      name: 'minTurns',
      desc: '',
      args: [],
    );
  }

  /// `Stat Chance`
  String get statChance {
    return Intl.message(
      'Stat Chance',
      name: 'statChance',
      desc: '',
      args: [],
    );
  }

  /// `Main Region`
  String get mainRegion {
    return Intl.message(
      'Main Region',
      name: 'mainRegion',
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
