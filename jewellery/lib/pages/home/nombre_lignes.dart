// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'backend.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

class MediterranesnDietView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const MediterranesnDietView(
      {Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<MediterranesnDietView> createState() => _MediterranesnDietViewState();
}

class _MediterranesnDietViewState extends State<MediterranesnDietView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: const Color(0xFF3A5160).withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: FutureBuilder(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromRGBO(0, 36, 107, 1),
                                ),
                              );
                            } else {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: SizedBox(),
                                );
                              } else {
                                final data = snapshot.data!;
                                print('99999***');
                                print(data);
                                return Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, top: 4),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#87A0E5')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les Clients',
                                                    number: 5,
                                                    subTitle: 'clients')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F56E98')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les Fournisseurs',
                                                    number: 10,
                                                    subTitle: 'fournisseurs')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F1B440')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les achats',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations d\'achat')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#87A0E5')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les ventes',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations de vente')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F56E98')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les versements',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations de versement')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F1B440')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les retours',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations de retour')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#87A0E5')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les magasin',
                                                    number: 15,
                                                    subTitle: 'magasin')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F56E98')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les réparations',
                                                    number: 15,
                                                    subTitle: 'réparations')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F1B440')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les commandes',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations de commande')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#87A0E5')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les importations',
                                                    number: 15,
                                                    subTitle: 'importateur')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F56E98')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les importations',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations d\'achat d\'importation')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#F1B440')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les importations',
                                                    number: 15,
                                                    subTitle:
                                                        'opérations de versement d\'importation')
                                              ],
                                            ),
                                            line(),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 48,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#87A0E5')
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                  ),
                                                ),
                                                number_function(
                                                    title: 'Les produits',
                                                    number: 15,
                                                    subTitle: 'produits')
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }
                          }),
                    ),
                    line()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget number_function(
      {required String title, required int number, required String subTitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 2),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: -0.1,
                color: const Color(0xFF3A5160).withOpacity(0.5),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 3),
                child: Text(
                  '${(number * widget.animation!.value).toInt()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF17262A),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 3),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: -0.2,
                    color: const Color(0xFF3A5160).withOpacity(0.5),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget line() {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
    child: Container(
      height: 2,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F3F8),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
  );
}
