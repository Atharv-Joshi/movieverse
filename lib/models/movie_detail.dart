
// class MovieDetail{
//   final String Title;
//   final String Year;
//   final String Rated;
//   final String Released;
//   final String Runtime;
//   final String Genre;
//   final String Director;
//   final String Writer;
//   final String Actors;
//   final String Plot;
//   final String Language;
//   final String Country;
//   final String Awards;
//   final String Poster;
//   final List Ratings;
//   final String Metascore;
//   final String imdbRating;
//   final String imdbVotes;
//   final String imdbID;
//   final String Type;
//   final String DVD;
//   final String BoxOffice;
//   final String Production;
//   final String Website;
//   final String Response;

//   MovieDetail({
//     required this.Actors,
//     required this.Awards,
//     required this.BoxOffice,
//     required this.Country,
//     required this.Director,
//     required this.DVD,
//     required this.Genre,
//     required this.imdbID,
//     required this.imdbRating,
//     required this.imdbVotes,
//     required this.Language,
//     required this.Metascore,
//     required this.Plot,
//     required this.Poster,
//     required this.Production,
//     required this.Rated,
//     required this.Ratings,
//     required this.Released,
//     required this.Response,
//     required this.Runtime,
//     required this.Title,
//     required this.Type,
//     required this.Website,
//     required this.Writer,
//     required this.Year
// });

//   factory MovieDetail.fromJson(Map<String,dynamic> json){
//     return MovieDetail(
//         Actors: json['Actors'],
//         Awards: json['Awards'],
//         BoxOffice: json['BoxOffice'],
//         Country: json['Country'],
//         Director: json['Director'],
//         DVD: json['DVD'],
//         Genre: json['Genre'],
//         imdbID: json['imdbID'],
//         imdbRating: json['imdbRating'],
//         imdbVotes: json['imdbVotes'],
//         Language: json['Language'],
//         Metascore: json['Metascore'],
//         Plot: json['Plot'],
//         Poster: json['Poster'],
//         Production: json['Production'],
//         Rated: json['Rated'],
//         Ratings: json['Ratings'],
//         Released: json['Released'],
//         Response: json['Response'],
//         Runtime: json['Runtime'],
//         Title: json['Title'],
//         Type: json['Type'],
//         Website: json['Website'],
//         Writer: json['Writer'],
//         Year: json['Year']
//     );
//   }
// }