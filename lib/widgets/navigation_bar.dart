import 'package:flutter/material.dart';
import 'package:winrateforlol_app/pages/options_page.dart';
import 'package:winrateforlol_app/pages/search_page.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
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

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        switch (value) {
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
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xffc1d5e0),
      items: const [
        BottomNavigationBarItem(
          //TODO: inventarme algo para esto
          label: "Account",
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(
            Icons.settings_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
