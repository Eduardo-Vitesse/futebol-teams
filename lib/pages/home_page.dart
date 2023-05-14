import 'package:flutter/material.dart';
import 'package:futbol_teams/controllers/home_controller.dart';
import 'package:futbol_teams/models/time.dart';
import 'package:futbol_teams/pages/time_page.dart';
import 'package:futbol_teams/repositories/times_repository.dart';
import 'package:futbol_teams/widgets/brasao.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brasileirão"),
      ),
      body: Consumer<TimesRepository>(
        builder: (context, value, child) {
          return ListView.separated(
            itemCount: value.times.length,
            itemBuilder: ((context, index) {
              final List<Time> tabela = value.times;
              return ListTile(
                leading: Brasao(
                  image: tabela[index].brasao.toString(),
                  width: 40,
                ),
                title: Text(tabela[index].nome.toString()),
                subtitle: Text("Títulos: ${tabela[index].titulos.length}"),
                trailing: Text(tabela[index].pontos.toString()),
                onTap: () {
                  Get.to(
                    () => TimePage(
                      key: Key(tabela[index].nome),
                      time: tabela[index],
                    ),
                  );
                },
              );
            }),
            separatorBuilder: (_, __) => const Divider(),
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
