import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsheet07/pages/movie_detail.dart';
import 'package:jobsheet07/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "Popular Movies",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              // child: ListTile(
              //   //menambahkan gambar dari response api ke listview
              //   leading: Image.network('https://image.tmdb.org/t/p/w500/' +
              //       movies[position].posterPath),
              //   title: Text(movies[position].title),
              //   subtitle: Text(
              //     'Rating = ' + movies[position].voteAverage.toString(),
              //   ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                //Untuk membuat perpindahan dari movie list ke movie detail buatlah onTap event di listview pada movie list
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/w500/' +
                          movies[position].posterPath),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 5, right: 5),
                  child: Text(
                    movies[position].voteAverage.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
