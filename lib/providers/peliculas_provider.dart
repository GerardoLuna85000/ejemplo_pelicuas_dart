import 'package:ejemplo_peliculas/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeliculasProvider {
  String _apikey = 'd12da89f953d50bf866a3631090e1ac2';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-MX';

  //metodo para hacer la peticion
  Future <List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url,'3/movie/now_playing',
          {'api_key' : _apikey,
          'language': _languaje});

    final resp = await http.get(url);
    print(url);

    //decode la respuesta
    final decodeData = json.decode(resp.body);

    //print(decodeData);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;

  }

  //Este método obtiene las peliculas populares
    Future <List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url,'3/movie/popular',
          {'api_key' : _apikey,
          'language': _languaje});

    final resp = await http.get(url);
    print(url);

    //decode la respuesta
    final decodeData = json.decode(resp.body);

    //print(decodeData);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;

  }
}