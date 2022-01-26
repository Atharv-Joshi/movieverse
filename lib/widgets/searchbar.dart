import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:movieverse/utils/api_calls.dart';
import 'package:movieverse/utils/colors.dart';

import 'movie_details.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: AppColors().purple6,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
                cursorColor: Colors.white60,
                decoration: InputDecoration(
                    hintText: 'Search movies...',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    )
                    ),
                style: TextStyle(
                  color: Colors.white70,
                )
                ),
            suggestionsCallback: (String pattern) async {
              return await ApiCalls().getSearchresults(pattern);
            },
            itemBuilder: (context, suggestion) {
              Map movie = suggestion as Map;
              return Container(
                color: AppColors().purple6,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        movie['title'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            onSuggestionSelected: (suggestion) {
              Map movie = suggestion as Map;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Scaffold(body: MovieDetails(movie: movie))));
            },
            noItemsFoundBuilder: (context) => Container(
              width: double.infinity,
              height: 40,
              child: Center(
                child: Text(
                  'No Items found!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              color: AppColors().purple6,
            ),
            errorBuilder: (context, object) => Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'Enter a name...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
              color: AppColors().purple6,
            ),
            loadingBuilder: (context) => Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'Enter a name...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
              color: AppColors().purple6,
            ),
          ),
        ),
      ),
    );
  }
}
