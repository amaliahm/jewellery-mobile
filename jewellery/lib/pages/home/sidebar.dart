// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/routes/pages.dart';
import 'package:jewellery/widgets/show_dialog.dart';
import 'package:jewellery/widgets/style.dart';

import 'nombre_lignes.dart';

class SideBar extends StatefulWidget {
  const SideBar(
      {Key? key,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  final AnimationController? iconAnimationController;
  final DrawerIndex? screenIndex;
  final Function(DrawerIndex)? callBackIndex;

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<DrawerList>? drawerList;
  @override
  void initState() {
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.HOME,
        labelName: 'Home',
        isAssetsImage: true,
        imageName: 'assets/icons/home.png',
      ),
      DrawerList(
        index: DrawerIndex.CLIENTS,
        labelName: 'Clients',
        isAssetsImage: true,
        imageName: 'assets/icons/client.png',
      ),
      DrawerList(
        index: DrawerIndex.FOURNISSEURS,
        labelName: 'Fournisseurs',
        isAssetsImage: true,
        imageName: 'assets/icons/fournisseur.png',
      ),
      DrawerList(
        index: DrawerIndex.PRODUITS,
        labelName: 'Les produits',
        isAssetsImage: true,
        imageName: 'assets/icons/produits.png',
      ),
      DrawerList(
        index: DrawerIndex.ACHATS,
        labelName: 'Les achats',
        isAssetsImage: true,
        imageName: 'assets/icons/achats.png',
      ),
      DrawerList(
        index: DrawerIndex.VENTES,
        labelName: 'Les ventes',
        isAssetsImage: true,
        imageName: 'assets/icons/vente.png',
      ),
      DrawerList(
        index: DrawerIndex.VERSEMENTS,
        labelName: 'Versement',
        isAssetsImage: true,
        imageName: 'assets/icons/versement.png',
      ),
      DrawerList(
        index: DrawerIndex.RETOURS,
        labelName: 'Retours',
        isAssetsImage: true,
        imageName: 'assets/icons/retours.png',
      ),
      DrawerList(
        index: DrawerIndex.MAGASIN,
        labelName: 'Magasin',
        isAssetsImage: true,
        imageName: 'assets/icons/magasin.png',
      ),
      DrawerList(
        index: DrawerIndex.COMMANDS,
        labelName: 'Les Commandes',
        isAssetsImage: true,
        imageName: 'assets/icons/command.png',
      ),
      DrawerList(
        index: DrawerIndex.IMPORTATION,
        labelName: 'L\'importation',
        isAssetsImage: true,
        imageName: 'assets/icons/importation.png',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFB295'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          heyThere(),
          const SizedBox(
            height: 4,
          ),
          Divider(
            height: 1,
            color: Colors.white.withOpacity(0.6),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList?.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList![index]);
              },
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white.withOpacity(0.6),
          ),
          signout(),
        ],
      ),
    );
  }

  Widget heyThere() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AnimatedBuilder(
              animation: widget.iconAnimationController!,
              builder: (BuildContext context, Widget? child) {
                return ScaleTransition(
                  scale: AlwaysStoppedAnimation<double>(
                      1.0 - (widget.iconAnimationController!.value) * 0.2),
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation<double>(
                        Tween<double>(begin: 0.0, end: 24.0)
                                .animate(CurvedAnimation(
                                    parent: widget.iconAnimationController!,
                                    curve: Curves.fastOutSlowIn))
                                .value /
                            360),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.grey.withOpacity(0.0),
                              offset: const Offset(2.0, 4.0),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/images/logo2.png'),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 4),
              child: Text(
                'Hey There!!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.normalText,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signout() {
    return IconButton(
      onPressed: () {
        showAlertDialog(context, "Log out", "yes", () async {
          await FirebaseAuth.instance.signOut();
          showLoading(context);
          Get.toNamed(Routes.LOGIN);
        });
      },
      icon: const Icon(
        Icons.logout,
        color: AppTheme.normalText,
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index!);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 15.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: widget.screenIndex == listData.index
                          ? Colors.white.withOpacity(0.8)
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(listData.imageName,
                        color: widget.screenIndex == listData.index
                            ? AppTheme.babyblue
                            : AppTheme.normalText),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: widget.screenIndex == listData.index
                          ? AppTheme.babyblue
                          : AppTheme.normalText,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 -
                                    widget.iconAnimationController!.value -
                                    1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex!(indexScreen);
  }
}

enum DrawerIndex {
  HOME,
  CLIENTS,
  FOURNISSEURS,
  PRODUITS,
  ACHATS,
  VENTES,
  VERSEMENTS,
  RETOURS,
  MAGASIN,
  COMMANDS,
  IMPORTATION,
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.index,
    this.imageName = '',
  });

  String labelName;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}
