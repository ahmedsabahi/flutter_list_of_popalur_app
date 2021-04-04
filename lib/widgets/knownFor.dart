import 'package:flutter/material.dart';
import 'package:list_of_popular/models/popular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class KnownFor extends StatelessWidget {
  const KnownFor({
    Key key,
    @required this.popular,
  }) : super(key: key);

  final Result popular;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: popular.knownFor
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${e.posterPath}',
                            fit: BoxFit.cover,
                            height: 150.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: e.voteAverage / 2,
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    Text(' ${e.voteAverage}/10')
                                  ],
                                ),
                                Text(
                                  'Release date: ${e.releaseDate}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.overview,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
