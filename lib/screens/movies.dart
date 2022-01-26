import 'package:flutter/material.dart';
import 'package:movieverse/utils/api_calls.dart';
import 'package:movieverse/widgets/base_container.dart';
import 'package:movieverse/widgets/movieList.dart';
import 'dart:core';
import 'package:movieverse/widgets/searchbar.dart';

class Movies extends StatelessWidget {
  Movies({Key? key}) : super(key: key);
  final ApiCalls apiCalls = ApiCalls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: MovieList(
                    function: apiCalls.getUpcomingMovies,
                    subtitle: 'Upcoming Movies'),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: MovieList(
                    function: apiCalls.getPopularMovies,
                    subtitle: 'Popular Movies'),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: MovieList(
                    function: apiCalls.getTopRatedMovies,
                    subtitle: 'Top Rated Movies'),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: MovieList(
                    function: apiCalls.getNowPlayingMovies,
                    subtitle: 'Now Playing'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
