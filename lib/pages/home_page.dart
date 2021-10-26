import 'package:ejemplo_peliculas/models/pelicula_model.dart';
import 'package:ejemplo_peliculas/providers/peliculas_provider.dart';
import 'package:ejemplo_peliculas/widgets/card_swiper_widget.dart';
import 'package:ejemplo_peliculas/widgets/movie_horizontal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(title: Text('Peliculas en cartelera'),
      backgroundColor: Colors.teal,),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _crearSwiper(),
            _footer(context),
          ],
        ),
      )
    );
  }

  Widget _crearSwiper() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
          return CardSwiper(
          peliculas: snapshot.data as List<Pelicula>,
        );
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
      }
    );
  }

  Widget _footer(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Populares: '
              ,style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: peliculasProvider.popupularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              /*snapshot.data?.forEach((p) {
                print(p.title);
                });*/
                if(snapshot.hasData){
                  return MoviHorizontal(
                    peliculas: snapshot.data as List<Pelicula>,
                    siguientePagina: peliculasProvider.getPopulares,
                  );
                }else{
                  return Center(child: CircularProgressIndicator());
                }
                return Container();
            },
          )
        ],
      ),
    );
  }
}