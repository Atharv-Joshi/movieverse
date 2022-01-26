import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviePosterCard extends StatelessWidget {
  final String imagePath;
  const MoviePosterCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      child: Image.network(
          'https://image.tmdb.org/t/p/w500$imagePath',
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress){
            if(loadingProgress == null) return child;
            return SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.white,
                child: Container(
                  height: 120,
                  width: 90,
                  color: Colors.grey[400]!,
                ),
              ),
            );
        },
      ),
    );
  }
}
