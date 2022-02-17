import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/lang/l10n.dart';
import 'package:poke_app/src/presentation/pages/about_page/about_page.dart';
import 'package:poke_app/src/presentation/pages/settings_page/settings_page.dart';

class PopMenuHomePage extends StatelessWidget {
  const PopMenuHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).cardColor,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Ajustes',
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                 Text(S.of(context).settings),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'About',
            child: Row(
              children: [
                Icon(
                  Icons.person_pin_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                 Text(S.of(context).about),
              ],
            ),
          ),
        ];
      },
      padding: const EdgeInsets.all(15.0),
      elevation: 3.0,
      offset: const Offset(1.0, 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).iconTheme.color,
      ),
      onSelected: (selectedItem) async {
        switch (selectedItem) {
          case 'Ajustes':
            final route = MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                );
                Navigator.push(context, route); 
            break;
         
          case 'About':
             final route = MaterialPageRoute(
                  builder: (context) => AboutPage(),
                );
                Navigator.push(context, route); 
            break;
        }
      },
    );
  }
}
