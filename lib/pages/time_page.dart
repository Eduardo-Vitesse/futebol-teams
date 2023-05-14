import 'package:flutter/material.dart';
import 'package:futbol_teams/models/time.dart';
import 'package:futbol_teams/pages/add_titulo_page.dart';
import 'package:futbol_teams/pages/edit_titulo_page.dart';
import 'package:futbol_teams/repositories/times_repository.dart';
import 'package:futbol_teams/widgets/brasao.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class TimePage extends StatefulWidget {
  final Time? time;
  const TimePage({super.key, this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  void tituloPage() {
    Get.to(() => AddTituloPage(time: widget.time));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time!.cor,
          title: Text(widget.time!.nome),
          actions: [
            IconButton(
              onPressed: tituloPage,
              icon: const Icon(Icons.add),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.stacked_line_chart),
              text: 'Estatísticas',
            ),
            Tab(
              icon: Icon(Icons.emoji_events),
              text: 'Títulos',
            ),
          ], indicatorColor: Colors.white),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Brasao(
                  image: widget.time!.brasao,
                  width: 200,
                ),
              ),
              Text(
                "Pontos: ${widget.time!.pontos}",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          titulos(widget, context),
        ]),
      ),
    );
  }
}

Widget titulos(dynamic widget, BuildContext context) {
  final time = Provider.of<TimesRepository>(context)
      .times
      .firstWhere((t) => t.nome == widget.time.nome);

  final quantidade = time.titulos.length;

  return quantidade == 0
      ? const Center(
          child: Text("Nenhum título ainda..."),
        )
      : ListView.separated(
          itemCount: quantidade,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.emoji_events),
              title: Text(time.titulos[index].campeonato),
              trailing: Text(time.titulos[index].ano),
              onTap: () {
                Get.to(
                  EditTituloPage(titulo: time.titulos[index]),
                  fullscreenDialog: true,
                );
              },
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        );
}
