import 'package:films/src/models/films_models.dart';
import 'package:films/src/providers/films_provider.dart';
import 'package:films/src/widget/card_swiper_widget.dart';
import 'package:films/src/widget/movie_horizontal_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final filmsProvider = FilmsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(Icons.search),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _swiperCards(),
                _footer(),
              ],
            ),
          ),
        ));
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: filmsProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<Films> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(films: snapshot.requireData);
        } else {
          return const SizedBox(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          FutureBuilder(
            future: filmsProvider.getPopulars(),
            builder: (BuildContext context, AsyncSnapshot<Films> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(films: snapshot.requireData);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
