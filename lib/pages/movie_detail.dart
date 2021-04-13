import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsheet07/commons/constants.dart';
import 'package:jobsheet07/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/Seb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Movie Details',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              height: height / 1.5,
              child: Image.network(path),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    movie.title + ' (' + movie.voteAverage.toString() + ') ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Wrap(
                    children: <Widget>[
                      for (var genre in genresBy(movie.genreIds))
                        Chip(
                          label: Text(genre.name),
                        )
                    ],
                  ),
                  Text(
                    'Movie Overview: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    movie.overview,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    //     child: Center(
    //   child: Column(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.all(16),
    //         height: height / 1.5,
    //         child: Image.network(path),
    //       ),
    //       Container(
    //         child: Text(movie.overview),
    //         padding: EdgeInsets.only(left: 16, right: 16),
    //       ),
    //     ],
    //   ),
    // )
  }
}
