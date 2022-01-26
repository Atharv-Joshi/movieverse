import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieverse/utils/api_calls.dart';
import 'package:movieverse/utils/colors.dart';
import 'package:movieverse/widgets/subtitle.dart';
import 'package:movieverse/widgets/youtube_video.dart';

class MovieDetails extends StatelessWidget {
  final Map movie;
  MovieDetails({Key? key, required this.movie}) : super(key: key);

  final ApiCalls apiCalls = ApiCalls();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width),
        child: Container(
          color: AppColors().purple7,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                movie['poster_path'] != null ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: movie['poster_path'] != null ? Image.network(
                        'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    })) : Container(),
                FutureBuilder(
                    future: apiCalls.getMovieDetails(movie['id'].toString()),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List genres = [];
                        for (int i = 0;
                            i < snapshot.data['genres'].length;
                            i++) {
                          genres.add(snapshot.data['genres'][i]['name']);
                        }
                        String genre = genres.join(', ');
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Text(genre,
                                    style: TextStyle(color: Colors.white)),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${DateTime.parse(snapshot.data['release_date']).year.toString()} | ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '${snapshot.data['runtime'].toString()} mins |',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      RatingBar.builder(
                                        itemSize: 15,
                                        ignoreGestures: true,
                                        initialRating:
                                            snapshot.data['vote_average'] / 2,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                        );
                      }
                    }),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Subtitle(text: 'Overview')),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    movie['overview'].split(' ').length > 0
                        ? '${movie['overview'].split(' ').take(60).join(' ')} ...'
                        : movie['overview'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Row(
                //   children: [
                //     Container(
                //         margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                //         child: Subtitle(text: 'Trailers & Extras')),
                //   ],
                // ),
                FutureBuilder(
                    future: apiCalls.getMovieVideos(movie['id'].toString()),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List movies = snapshot.data;
                        return Column(
                          children: [
                            movies.length > 1
                                ? Row(
                                    children: [
                                      Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Subtitle(
                                              text: 'Trailers & Extras')),
                                    ],
                                  )
                                : Container(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 110,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movies.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: OpenContainer(
                                        closedColor: AppColors().purple7,
                                        openColor: AppColors().purple7,
                                        middleColor: AppColors().purple7,
                                        closedBuilder: (context, action) =>
                                            GestureDetector(
                                          onTap: () {},
                                          child: YoutubeVideo(
                                            youtubeVideoId:
                                                movies[index]['key'].toString(),
                                            title: 'title',
                                            backdrop_path: 'backdrop_path',
                                            mini: true,
                                          ),
                                        ),
                                        openBuilder: (context, action) =>
                                            Container(
                                          color: AppColors().purple7,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: YoutubeVideo(
                                            youtubeVideoId:
                                                movies[index]['key'].toString(),
                                            title: 'title',
                                            backdrop_path: 'backdrop_path',
                                            mini: true,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
