import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/domain/repositories/app_repository.dart';
import 'package:poke_app/src/injector.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/app/lang/language.dart';
import 'package:poke_app/src/presentation/manager/app_cubit/app_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settings,
              style: Theme.of(context).textTheme.headline6),
        ),
        body: BlocProvider(
          create: (context) => AppCubit(injector<AppRepository>()),
          child: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        S.of(context).theme,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      EasyDynamicThemeBtn(),
                    ],
                  ),
                ),
                const Divider(),
                Text(
                  S.of(context).selectALanguage,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                RadioListTile<Language>(
                  value: Language.es,
                  groupValue: injector<AppRepository>().getCurrentLanguage,
                  onChanged: (changeValue) {
                    setState(() {
                      context
                          .read<AppCubit>()
                          .changeLanguage(changeValue ?? Language.es);
                    });
                  },
                  title: Text(
                    Language.es.languageName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                RadioListTile<Language>(
                  value: Language.en,
                  groupValue: injector<AppRepository>().getCurrentLanguage,
                  onChanged: (changeValue) {
                    setState(() {
                      context
                          .read<AppCubit>()
                          .changeLanguage(changeValue ?? Language.en);
                    });
                  },
                  title: Text(
                    Language.en.languageName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            );
          }),
        ));
  }
}
