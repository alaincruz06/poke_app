import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/pages/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
     Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
    }); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Center(
            child: Hero(
              tag: 'foto_intro',
              child: Image.asset(Assets.assetsImagesPokedexLogo),
            ),
          ),
    );
  }
}
