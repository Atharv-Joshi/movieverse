import 'package:flutter/material.dart';
import 'package:movieverse/screens/profile.dart';
import 'package:movieverse/utils/api_calls.dart';
import 'package:movieverse/widgets/base_container.dart';
import 'package:movieverse/widgets/movieList.dart';
import 'package:movieverse/widgets/youtube_video.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiCalls apiCalls = ApiCalls();
  bool isLoading = true;
  List<Map> trailerData = [];

  Future<List> getMovieTrailer() async {
    List trendingMovies = await apiCalls.getTrendingMovies();
    for (int i = 0; i < 5; i++) {
      int movieId = trendingMovies[i]['id'];
      List movieVideos = await apiCalls.getMovieVideos(movieId.toString());
      for (int j = 0; j < movieVideos.length; j++) {
        if (movieVideos[j]['type'] == 'Trailer') {
          trailerData.add({
            'title': trendingMovies[i]['title'],
            'backdrop_path': trendingMovies[i]['backdrop_path'],
            'youtubeVideoId': movieVideos[j]['key']
          });
          break;
        }
      }
    }
    return trailerData;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: FutureBuilder(
                  future: getFirstLastName(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        child: Text(
                          'Hello ${snapshot.data[0]}!',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            FutureBuilder(
                future: getMovieTrailer(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 265,
                      child: PageView(
                        children: snapshot.data!
                            .map((e) => YoutubeVideo(
                                mini: false,
                                youtubeVideoId: e['youtubeVideoId'],
                                backdrop_path: e['backdrop_path'],
                                title: e['title']))
                            .toList(),
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 210,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.grey[400]!,
                        ),
                      ),
                    );
                  }
                }),
            MovieList(
                function: apiCalls.getRecentMovies,
                subtitle: 'Latest & Trending'),
            MovieList(
                function: apiCalls.discoverMovies,
                subtitle: 'Discover Movies'),
            MovieList(
                function: apiCalls.getTrendingTV, subtitle: 'Trending in TV'),
          ],
        ),
      )),
    );
  }
}
