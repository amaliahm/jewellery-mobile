import 'package:get/get.dart';
import 'package:jewellery/pages/clients/clients.dart';
import 'package:jewellery/pages/fournisseurs/fournisseur.dart';
import 'package:jewellery/registration/login_screen.dart';
import 'package:jewellery/registration/signup_screen.dart';
import 'package:jewellery/registration/welcome_page.dart';

import '../pages/home/navigation_home_screen.dart';

part 'routes.dart';

class AppPages {
  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => NavigationHomeScreen(),
    ),
    GetPage(
      name: Routes.CLIENTS,
      page: () => const Clients(),
    ),
    GetPage(
      name: Routes.FOURNISSEURS,
      page: () => const Fournisseurs(),
    ),
  ];
}
