import 'package:flutter/material.dart';

import 'package:futbol_teams/controllers/home_controller.dart';
import 'package:futbol_teams/models/time.dart';
import 'package:futbol_teams/pages/time_page.dart';

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
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: ((context, index) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[index].brasao.toString()),
            title: Text(tabela[index].nome.toString()),
            trailing: Text(tabela[index].pontos.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TimePage(
                    key: Key(tabela[index].nome),
                    time: tabela[index],
                  ),
                ),
              );
            },
          );
        }),
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
