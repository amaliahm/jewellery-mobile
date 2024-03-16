class AjouterListData {
  AjouterListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<AjouterListData> tabIconsList = <AjouterListData>[
    AjouterListData(
      imagePath: 'assets/icons/client.png',
      titleTxt: 'Client',
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    AjouterListData(
      imagePath: 'assets/icons/fournisseur.png',
      titleTxt: 'Fournisseur',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    AjouterListData(
      imagePath: 'assets/icons/achats.png',
      titleTxt: 'Opérations d\'achat',
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    AjouterListData(
      imagePath: 'assets/icons/vente.png',
      titleTxt: 'Operations de vente',
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
