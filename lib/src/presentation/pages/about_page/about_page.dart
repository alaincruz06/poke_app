import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/presentation/app/constants/assets.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).about,
            style: Theme.of(context).textTheme.headline6),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getInfo(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                         const   Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                   CircleAvatar(
                    foregroundImage: AssetImage(Assets.assetsImagesPokedexAppLogo, ),
                    radius: 35,
                  )
                            ),
                            Text(
                              "${snapshot.data?.elementAt(0)}",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Text(
                              "${snapshot.data?.elementAt(2)}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Desarrolladores:',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text(
                          S.of(context).alain,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Gmail
                              InkWell(
                                onTap: () async {
                                  final Uri params = Uri(
                                    scheme: 'mailto',
                                    path: 'worksatomics@gmail.com',
                                    query:
                                        'subject=Acerca de ${snapshot.data?.elementAt(0)} ${snapshot.data?.elementAt(2)}',
                                   
                                  );
                                  await launch(params.toString());
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Assets.assetsIconsGmail200px,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              //Telegram
                              InkWell(
                                onTap: () {
                                  launch("https://telegram.me/alaincj");
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Assets.assetsIconsTelegram96px,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              //Apklis
                              InkWell(
                                onTap: () {
                                  launch(
                                      "https://www.apklis.cu/developer/alaincruz06");
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    // shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        'assets/icons/apklis_logo.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          S.of(context).jose,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Gmail
                              InkWell(
                                onTap: () async {
                                  final Uri params = Uri(
                                    scheme: 'mailto',
                                    path: 'xokechka@gmail.com',
                                    query:
                                        'subject=Acerca de ${snapshot.data?.elementAt(0)} ${snapshot.data?.elementAt(2)}',
                                   
                                  );
                                  await launch(params.toString());
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Assets.assetsIconsGmail200px,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),

                              //Telegram
                              InkWell(
                                onTap: () {
                                  launch("https://telegram.me/josequesada");
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Assets.assetsIconsTelegram96px,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).appWithPokeApiHelp,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    Assets.assetsImagesPokeapi256,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<List<String>> getInfo() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  final String appName = packageInfo.appName;
  final String packageName = packageInfo.packageName;
  final String version = packageInfo.version;
  final String buildNumber = packageInfo.buildNumber;

  return [appName, packageName, version, buildNumber];
}
