class Movie {
  int id;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String posterPath;

  Movie(this.id, this.genreIds, this.title, this.voteAverage, this.overview,
      this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.genreIds = parsedJson['genre_ids'].cast<int>();
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    return data;
  }

  @override
  String toString() {
    return title;
  }
}
