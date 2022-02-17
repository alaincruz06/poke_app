import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';

final lightTheme = ThemeData(
  iconTheme: IconThemeData(
    color: PokeColor().softBlue,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: PokeColor().softBlue,
    ),
    backgroundColor: PokeColor().shadowOrange,
  ),
  cardColor: PokeColor().shadowOrange,
  canvasColor: PokeColor().white,
  textTheme: TextTheme(
    headline6: TextStyle(color: PokeColor().softBlue),
    bodyText2: TextStyle(color: PokeColor().softBlue),
    bodyText1: TextStyle(color: PokeColor().softBlue),
  ),
  scaffoldBackgroundColor: PokeColor().softOrange,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: PokeColor().shadowBlue, secondary: PokeColor().shadowBlue),
);

final darkTheme = ThemeData(
  iconTheme: IconThemeData(
    color: PokeColor().white,
  ),
  textTheme: Typography().white,
  canvasColor: PokeColor().softgrey,
  popupMenuTheme: PopupMenuThemeData(
    color: PokeColor().grey,
  ),
  cardColor: PokeColor().softgrey,
  scaffoldBackgroundColor: PokeColor().grey,
  appBarTheme: AppBarTheme(
    color: PokeColor().softgrey,
    iconTheme: IconThemeData(
      color: PokeColor().softBlue,
    ),
  ),
  dialogTheme: DialogTheme(backgroundColor: PokeColor().grey),
);
