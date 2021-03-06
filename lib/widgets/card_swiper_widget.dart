import 'package:ejemplo_peliculas/models/pelicula_model.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  //const CardSwiper({ Key? key }) : super(key: key);
  //final List<dynamic> peliculas = [];
  //CardSwiper({@required peliculas});

  final List<Pelicula> peliculas;


  const CardSwiper({Key? key, required this.peliculas}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),

      child: Swiper(
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:  FadeInImage(
              image: NetworkImage(peliculas[index].getposterPath()),
              placeholder: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
            )
          );
        },
        itemCount: peliculas.length,
       // pagination: SwiperPagination(),
        //control: SwiperControl(),
      ),

    );
  }
}