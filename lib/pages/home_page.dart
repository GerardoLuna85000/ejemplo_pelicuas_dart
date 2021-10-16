import 'package:ejemplo_peliculas/widgets/card_swiper_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peliculas en cartelera'),
      backgroundColor: Colors.teal,),
      body: Container(
        child: Column(
          children: <Widget>[
            _crearSwiper(),
          ],
        ),
      )
    );
  }

  Widget _crearSwiper() {
    return CardSwiper(
      peliculas: [1,2,3,4,5]
    );
  }
}