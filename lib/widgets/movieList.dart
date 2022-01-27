import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movieverse/utils/colors.dart';
import 'package:movieverse/widgets/subtitle.dart';

import 'movie_details.dart';
import 'movie_poster_card.dart';

class MovieList extends StatefulWidget {
  final Function function;
  final String subtitle;
  const MovieList({Key? key, required this.function, required this.subtitle})
      : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  ScrollController scrollController = ScrollController();
  var responseData;
  int? totalPages;
  int nextPage = 1;
  List results = [];

  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          nextPage < totalPages!) {
        print('calling get data for more data');
        getData();
      }
    });
  }

  getData() async {
    responseData = await widget.function(nextPage);
    setState(() {
      totalPages = responseData['total_pages'];
      results = results + responseData['results'];
      nextPage += 1;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle(
          text: widget.subtitle,
        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 140,
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return OpenContainer(
                      closedColor: AppColors().purple7,
                      openColor: AppColors().purple7,
                      middleColor: AppColors().purple7,
                      transitionType: ContainerTransitionType.fade,
                      openBuilder: (context, action) =>
                          Container(child: MovieDetails(movie: results[index])),
                      closedBuilder: (context, action) =>
                          results[index]['poster_path'] != null
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  child: MoviePosterCard(
                                      imagePath:
                                          results[index]['poster_path'] ?? ''))
                              : Container(),
                    );
                  }),
            )),
      ],
    );
  }
}
