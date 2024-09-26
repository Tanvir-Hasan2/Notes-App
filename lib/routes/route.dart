import 'package:get/get.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/pages/intro.dart';
import '../business_logic/bindings/auth_binding.dart';
import '../business_logic/bindings/splash_binding.dart';
import '../ui/pages/login.dart';
import '../ui/pages/registration.dart';
import '../ui/pages/splash.dart';
const String splash = '/splash';
const String intro = '/intro';
const String login = '/login';
const String registration = '/registration';
const String home = '/home';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => Splash(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: intro,
    page: () => const Intro(),
  ),
  GetPage(
      name: login,
      page: () => Login(),
      binding: AuthBinding()
  ),
  GetPage(
      name: registration,
      page: () => Registration(),
      binding: AuthBinding()
  ),
  GetPage(
      name: home,
      page: () => HomePage(),
  ),
];
