import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/ui/pages/add_note_screen.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/pages/login.dart';
import 'package:note_app/ui/pages/registration.dart';
import 'package:note_app/ui/pages/splash.dart';
import 'const/app_strings.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final GoRouter _router = GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => Splash(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => Login(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => Registration(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/addNote',
          builder: (context, state) => AddNotePage(),
        ),
      ],
    );

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppString.appName,
            theme: ThemeData(
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: false,
              appBarTheme: AppBarTheme(
                centerTitle: true
              )
            ),
            routerConfig: _router,
            //home: Splash(),
          );
        });
  }
}


