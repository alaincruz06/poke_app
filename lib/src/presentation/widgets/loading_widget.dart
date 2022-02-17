import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: PokeColor().softOrange,
      ),
    );
  }
}
