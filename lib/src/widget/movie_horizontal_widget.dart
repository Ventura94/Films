import 'package:films/src/models/films_models.dart';
import 'package:flutter/material.dart';

class MovieHorizontal extends StatelessWidget {
  const MovieHorizontal({Key? key, required this.films}) : super(key: key);

  final Films films;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(context) {
    return films.results.map((result) {
      return Container(
        margin: const EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: const AssetImage("assets/no-image.jpg"),
                image: NetworkImage(result.getPosterImage()),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(result.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption),
          ],
        ),
      );
    }).toList();
  }
}
//clase 105
