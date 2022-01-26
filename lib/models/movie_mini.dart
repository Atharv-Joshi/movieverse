
class MovieMini{
  final String overview;
  final String id;
  final String poster_path;

  MovieMini({
    required this.overview,
    required this.id,
    required this.poster_path,
});

  factory MovieMini.fromJson(Map<String,dynamic> json){
    return MovieMini(
      overview: json['overview'],
        id: json['id'].toString(),
        poster_path: json['poster_path'],
    );
  }
}