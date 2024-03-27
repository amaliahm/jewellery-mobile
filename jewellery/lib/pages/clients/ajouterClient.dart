// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/pages/home/app_theme.dart';
import 'package:jewellery/pages/home/inputField.dart';
import 'package:jewellery/pages/home/wilaya.dart';
import 'package:selection_menu/selection_menu.dart';

import '../home/nombre_lignes.dart';

class AjouterClient extends StatefulWidget {
  const AjouterClient({super.key});

  @override
  State<AjouterClient> createState() => _AjouterClientState();
}

class _AjouterClientState extends State<AjouterClient> {
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _villeController = TextEditingController();
  late String wilaya;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _nrcController = TextEditingController();
  final TextEditingController _nifController = TextEditingController();
  final TextEditingController _nisController = TextEditingController();
  final TextEditingController _n_article_Controller = TextEditingController();
  final TextEditingController _titreController = TextEditingController();
  // final ClientController _clientController = Get.put(TaskController());

  List<WilayaMenu> wilayas = WilayaMenu.wilayas;
  List<OnlyWilayas> onlyWilayas = [];

  List<OnlyWilayas> removeDuplicates(List<OnlyWilayas> list) {
    List<OnlyWilayas> uniqueList = [];

    for (var item in list) {
      if (!uniqueList.any((element) =>
          element.id == item.id &&
          element.wilaya_name_ascii == item.wilaya_name_ascii)) {
        uniqueList.add(item);
      }
    }

    return uniqueList;
  }

  @override
  Widget build(BuildContext context) {
    wilayas.forEach((__wilaya) => onlyWilayas.add(OnlyWilayas(
          id: __wilaya.id,
          wilaya_code: __wilaya.wilaya_code!,
          wilaya_name_ascii: __wilaya.wilaya_name_ascii,
        )));

    List<OnlyWilayas> distinctWilayas = removeDuplicates(onlyWilayas);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#FFB295'),
        title: Text(
          "Ajouter client",
          style: headingStyle,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyInputField(
                title: 'Nom',
                hint: '',
                controller: _nomController,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Wilaya',
                style: titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 52,
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SelectionMenu<OnlyWilayas>(
                      itemsList: distinctWilayas,
                      itemBuilder: itemBuilder,
                      onItemSelected: (item) {
                        wilaya =
                            '${item.wilaya_name_ascii} ${item.wilaya_code}';
                      },
                      showSelectedItemAsTrigger: true,
                      initiallySelectedItemIndex: 0,
                      closeMenuInsteadOfPop: true,
                      closeMenuOnEmptyMenuSpaceTap: false,
                      closeMenuWhenTappedOutside: true,
                      closeMenuOnItemSelected: true,
                      allowMenuToCloseBeforeOpenCompletes: true,
                    ),
                  ],
                ),
              ),
              MyInputField(
                title: 'Ville',
                hint: '',
                controller: _villeController,
              ),
              MyInputField(
                title: 'Email',
                hint: '',
                controller: _emailController,
              ),
              MyInputField(
                title: 'Telephone',
                hint: '',
                controller: _telephoneController,
              ),
              MyInputField(
                title: 'adresse',
                hint: '',
                controller: _adresseController,
              ),
              MyInputField(
                title: 'NRC',
                hint: '',
                controller: _nrcController,
              ),
              MyInputField(
                title: 'NIF',
                hint: '',
                controller: _nifController,
              ),
              MyInputField(
                title: 'NIS',
                hint: '',
                controller: _nisController,
              ),
              MyInputField(
                title: 'Numero d\'article',
                hint: '',
                controller: _n_article_Controller,
              ),
              MyInputField(
                title: 'Titre',
                hint: '',
                controller: _titreController,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buttonAjouter(
                      label: "Create task",
                      onTap: () {
                        _validateDate();
                        // _clientController.getTasks();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get headingStyle {
    return const TextStyle(
      fontSize: 24,
    );
  }

  TextStyle get subTitleStyle {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[400],
    );
  }

  TextStyle get titleStyle {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  _validateDate() {
    print(wilaya);
    if (_nomController.text.isNotEmpty &
        _villeController.text.isNotEmpty &
        wilaya.isNotEmpty &
        _telephoneController.text.isNotEmpty &
        _titreController.text.isNotEmpty) {
      _addClientToDatabase();
    } else if (_nomController.text.isEmpty ||
        _villeController.text.isEmpty ||
        wilaya.isEmpty ||
        _telephoneController.text.isEmpty ||
        _titreController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Vérifier les informations",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        icon: const Icon(
          Icons.warning_amber_outlined,
          color: Colors.red,
        ),
      );
    }
  }

  _addClientToDatabase() async {
    print('heyyyyyyyyyyyy');
    print(_nomController.text);
    // Get.back();
    // var value = {
    //   'nom': _nomController.text,
    //   'ville': _villeController.text,
    //   'wilaya': wilaya,
    //   'email': _emailController.text,
    //   'telephone': _telephoneController.text,
    //   'adresse': _adresseController.text,
    //   'NRC': _nrcController.text,
    //   'NIF': _nifController.text,
    //   'NIS': _nisController.text,
    //   'N_article': _n_article_Controller.text,
    //   'titre': _titreController.text,
    // };
  }
}

Widget itemBuilder(
    BuildContext context, OnlyWilayas wilaya, OnItemTapped onItemTapped) {
  TextStyle textStyle = Theme.of(context).textTheme.headline6!;
  print(wilaya);

  return Material(
    color: Colors.white,
    child: Column(
      children: [
        InkWell(
          onTap: onItemTapped,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    wilaya.wilaya_name_ascii,
                    style: titleStyle,
                  ),
                ),
                Text(
                  wilaya.wilaya_code!,
                  style: textStyle.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: textStyle.fontSize! * 0.75,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
