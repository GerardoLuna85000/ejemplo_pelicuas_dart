import 'package:ejemplo_peliculas/models/pelicula_model.dart';
import 'package:flutter/material.dart';

class MoviHorizontal extends StatelessWidget {
  //const MoviHorizontal({ Key? key }) : super(key: key);
final List<Pelicula> peliculas;

final Function siguientePagina;

 MoviHorizontal({Key? key, required this.peliculas,
 required this.siguientePagina
 }) : super(key: key);

final _pageConreoller = new PageController(
  initialPage: 1, viewportFraction: 022
);


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageConreoller.addListener((){
      if(_pageConreoller.position.pixels >= 
      _pageConreoller.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        controller: _pageConreoller,
        pageSnapping: false,
        children: _crearTarjetas(),
      ),
    );
  }

  List<Widget> _crearTarjetas(){
    return peliculas.map((pelicula){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getposterPath()),
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

}