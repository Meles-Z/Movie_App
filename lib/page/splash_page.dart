import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/model/app_config.dart';
import 'package:flutter_movie_app/services/http_service.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({super.key, required this.onInitializationComplete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
      ),
    );
    getIt.registerSingleton<HTTPService>{
      HTTPService(),
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flicked',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/logo.jpg"))),
        ),
      ),
    );
  }
}
