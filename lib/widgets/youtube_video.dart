import 'package:flutter/material.dart';
import 'package:movieverse/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatelessWidget {
  YoutubeVideo(
      {Key? key,
      required this.youtubeVideoId,
      required this.title,
      required this.backdrop_path,
      required this.mini})
      : super(key: key);
  final String youtubeVideoId;
  final String title;
  final String backdrop_path;
  final bool mini;
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: mini
          ? MediaQuery.of(context).size.width / 2.5
          : MediaQuery.of(context).size.width,
      height: mini ? 150 : 265,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            thumbnail: mini
                ? Container()
                : backdrop_path == ''
                    ? Container()
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: 265,
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500$backdrop_path')),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.pink,
            progressColors: ProgressBarColors(
              playedColor: Colors.pink,
              handleColor: Colors.pinkAccent,
            ),
          ),
          mini
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors().purple_1,
                      )
                    ],
                  ))
        ],
      ),
    );
  }
}
