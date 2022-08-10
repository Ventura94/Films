import 'package:films/src/models/films_models.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  final Films films;

  const CardSwiper({Key? key, required this.films}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: 400.0,
        itemWidth: 300.0,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: const AssetImage("assets/no-image.jpg"),
              image: NetworkImage(films.results[index].getPosterImage()),
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: films.results.length,
      ),
    );
  }
}
