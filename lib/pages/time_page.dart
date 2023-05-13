import 'package:flutter/material.dart';
import 'package:futbol_teams/models/time.dart';
import 'package:futbol_teams/models/titulo.dart';
import 'package:futbol_teams/pages/add_titulo_page.dart';

class TimePage extends StatefulWidget {
  final Time? time;
  const TimePage({super.key, this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  void tituloPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(time: widget.time, onSave: addTitulo),
      ),
    );
  }

  void addTitulo(Titulo titulo) {
    setState(() {
      widget.time?.titulos.add(titulo);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Salvo com sucesso"),
      ),
    );
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
                child: Image.network(
                    widget.time!.brasao.replaceAll('40x40', '100x100')),
              ),
              Text(
                "Pontos: ${widget.time!.pontos}",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          titulos(widget),
        ]),
      ),
    );
  }
}

Widget titulos(dynamic widget) {
  final quantidade = widget.time.titulos.length;

  return quantidade == 0
      ? const Center(
          child: Text("Nenhum título ainda..."),
        )
      : ListView.separated(
          itemCount: quantidade,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.emoji_events),
              title: Text(widget.time.titulos[index].campeonato),
              trailing: Text(widget.time.titulos[index].ano),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        );
}
