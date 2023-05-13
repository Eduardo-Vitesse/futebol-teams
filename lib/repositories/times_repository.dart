import 'package:flutter/material.dart';
import 'package:futbol_teams/models/time.dart';
import 'package:futbol_teams/models/titulo.dart';

class TimesRepository {
  final List<Time> _times = [];

  get times => _times;

  void addTitulo(Time time, Titulo titulo) {
    time.titulos.add(titulo);
  }

  TimesRepository() {
    _times.addAll([
      Time(
        nome: 'São Paulo',
        pontos: 82,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/sao-paulo.png',
        cor: Colors.red,
      ),
      Time(
        nome: 'Botafogo',
        pontos: 70,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png',
        cor: Colors.black,
      ),
      Time(
        nome: 'Internacional',
        pontos: 69,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
        cor: Colors.red,
      ),
      Time(
        nome: 'Grêmio',
        pontos: 64,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/gremio.png',
        cor: Colors.blue,
      ),
      Time(
        nome: 'Santos',
        pontos: 61,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
        cor: Colors.grey,
      ),
      Time(
        nome: 'Corinthians',
        pontos: 59,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
        cor: Colors.black,
      ),
      Time(
        nome: 'Palmeiras',
        pontos: 55,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
        cor: Colors.green,
      ),
      Time(
        nome: 'Flamengo',
        pontos: 53,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
        cor: Colors.red,
      ),
      Time(
        nome: 'Vasco',
        pontos: 50,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/vasco.png',
        cor: Colors.black,
      ),
      Time(
        nome: 'Fluminense',
        pontos: 48,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
        cor: Colors.red,
      ),
      Time(
        nome: 'Ceará',
        pontos: 48,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/ceara.png',
        cor: Colors.black,
      ),
      Time(
        nome: 'Chapecoense',
        pontos: 47,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/chapecoense.png',
        cor: Colors.green,
      ),
      Time(
        nome: 'Atlético MG',
        pontos: 46,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
        cor: Colors.black,
      ),
      Time(
        nome: 'Cruzeiro',
        pontos: 44,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/cruzeiro.png',
        cor: Colors.blue,
      ),
      Time(
        nome: 'Atlético PR',
        pontos: 41,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-pr.png',
        cor: Colors.red,
      ),
      Time(
        nome: 'Coritiba',
        pontos: 39,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
        cor: Colors.green,
      ),
      Time(
        nome: 'Sport',
        pontos: 37,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/sport.png',
        cor: Colors.red,
      ),
      Time(
        nome: 'Bragantino',
        pontos: 33,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/bragantino.png',
        cor: Colors.grey,
      ),
      Time(
        nome: 'Goiás',
        pontos: 32,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/goias.png',
        cor: Colors.green,
      ),
      Time(
        nome: 'América MG',
        pontos: 31,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/america-mg.png',
        cor: Colors.green,
      ),
    ]);
  }
}
