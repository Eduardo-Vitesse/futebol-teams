import 'package:flutter/material.dart';
import 'package:futbol_teams/pages/home_page.dart';
import 'package:futbol_teams/repositories/times_repository.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimesRepository(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brasileirão',
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomePage(),
    );
  }
}
