import 'package:flutter/material.dart';
import 'package:flutter_movie_app/page/main_page.dart';
import 'package:flutter_movie_app/page/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () => runApp(
        ProviderScope(child: const MyApp(),)
        
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flick',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _context) => MainPage(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
