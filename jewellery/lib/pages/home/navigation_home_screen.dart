import 'package:flutter/material.dart';
import 'package:jewellery/pages/achats/achats.dart';
import 'package:jewellery/pages/clients/clients.dart';
import 'package:jewellery/pages/command/commands.dart';
import 'package:jewellery/pages/fournisseurs/fournisseur.dart';
import 'package:jewellery/pages/home/home_page.dart';
import 'package:jewellery/pages/home/home_screen.dart';
import 'package:jewellery/pages/home/sidebar.dart';
import 'package:jewellery/pages/importation/importation.dart';
import 'package:jewellery/pages/magasin/magasin.dart';
import 'package:jewellery/pages/versement/versement.dart';
import 'package:jewellery/widgets/style.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: HomePage(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const HomeScreen();
          });
          break;
        case DrawerIndex.CLIENTS:
          setState(() {
            screenView = const Clients();
          });
          break;
        case DrawerIndex.VERSEMENTS:
          setState(() {
            screenView = const Versement();
          });
          break;
        case DrawerIndex.MAGASIN:
          setState(() {
            screenView = const Magasin();
          });
          break;
        case DrawerIndex.COMMANDS:
          setState(() {
            screenView = const Commands();
          });
          break;
        case DrawerIndex.ACHATS:
          setState(() {
            screenView = const Achat();
          });
          break;
        case DrawerIndex.IMPORTATION:
          setState(() {
            screenView = const Importation();
          });
          break;
        case DrawerIndex.FOURNISSEURS:
          setState(() {
            screenView = const Fournisseurs();
          });
          break;
        case DrawerIndex.PRODUITS:
          setState(() {
            screenView = const Importation();
          });
          break;
        case DrawerIndex.VENTES:
          setState(() {
            screenView = const Importation();
          });
          break;
        case DrawerIndex.RETOURS:
          setState(() {
            screenView = const Importation();
          });
          break;
        default:
          break;
      }
    }
  }
}
