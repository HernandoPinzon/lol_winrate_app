import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:winrateforlol_app/models/keys.dart';

import '../pages/account_page.dart';
import '../pages/options_page.dart';
import '../pages/search_page.dart';

class GoogleNavBar extends StatelessWidget {
  const GoogleNavBar({Key? key, required this.position}) : super(key: key);
  final int position;

  void _showOptionsPage(BuildContext context) {
    //creando la ruta hacia la pagina de Opciones
    final Route route2 = PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => OptionsPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero);
    Navigator.pushReplacement(context, route2);
  }

  void _showSearchPage(BuildContext context) {
    //creando la ruta hacia la pagina de Busqueda
    final Route route2 = PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => SearchPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero);
    Navigator.pushReplacement(context, route2);
  }
  void _showAccountPage(BuildContext context) {
    //creando la ruta hacia la pagina de Busqueda
    final Route route2 = PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => AccountPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero);
    Navigator.pushReplacement(context, route2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff90a4ae),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GNav(
          key: MyKeys.GNavKey,
          selectedIndex: position,
          onTabChange: (value) {
            switch (value) {
              case 0:
                _showAccountPage(context);
                break;
              case 1:
                _showSearchPage(context);
                break;
              case 2:
                _showOptionsPage(context);
                break;
              default:
                break;
            }
          },
          backgroundColor: const Color(0xff90a4ae),
          tabBackgroundColor: const Color(0xffc1d5e0),
          gap: 5,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          tabs: const [
            GButton(
              icon: Icons.account_circle_outlined,
              text: 'Account',
            ),
            GButton(
              icon: Icons.search_outlined,
              text: 'Search',
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
