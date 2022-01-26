import 'package:dio/dio.dart';

class ApiCalls {
  final String API_KEY = 'e94507a8fba6b3cdb0c0c71ad4cad270';

  getTrendingMovies() async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/trending/movie/day?api_key=$API_KEY');
    return response.data['results'];
  }

  getTrendingTV(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/trending/tv/day?api_key=$API_KEY&page=$currentPage');
    return response.data;
  }

  getMovieVideos(String id) async {
    Response response = await Dio()
        .get('https://api.themoviedb.org/3/movie/$id/videos?api_key=$API_KEY');
    return response.data['results'];
  }

  getRecentMovies(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY&year=2021&page=$currentPage');
    return response.data;
  }

  getMovieDetails(String id) async {
    Response response = await Dio()
        .get('https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY');
    return response.data;
  }

  discoverMovies(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY&sort_by=revenue.desc&page=$currentPage');
    return response.data;
  }

  getSearchresults(String pattern) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/search/movie?api_key=$API_KEY&query=$pattern');
    return response.data['results'];
  }

  getUpcomingMovies(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY&page=$currentPage');
    return response.data;
  }

  getPopularMovies(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&page=$currentPage');
    return response.data;
  }

  getTopRatedMovies(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY&page=$currentPage');
    return response.data;
  }

  getNowPlayingMovies(int currentPage) async {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$API_KEY&page=$currentPage');
    return response.data;
  }
}
