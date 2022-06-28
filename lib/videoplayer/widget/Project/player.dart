import 'dart:io';
import 'package:broto_player/Database/datamode.dart';
import 'package:broto_player/Pages/Recent/R_video_list.dart';
import 'package:broto_player/videoplayer/widget/Project/controls.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../Fetching files/InnerFetching/load_folder_video.dart';
import 'data_manager.dart';

class CustomOrientationPlayer extends StatefulWidget {
  String urls;
  int index;
  CustomOrientationPlayer({Key? key, required this.index, required this.urls})
      : super(key: key);

  @override
  _CustomOrientationPlayerState createState() =>
      _CustomOrientationPlayerState();
}

class _CustomOrientationPlayerState extends State<CustomOrientationPlayer> {
  late FlickManager flickManager;
  late DataManager dataManager;
  List<String> urls = filteredFolderVideos.value;

  @override
  void initState() {
    Recentlistingmode obj = Recentlistingmode(recentpath: widget.urls);
    getRecentStatus(path: widget.urls);

    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(File(
          urls[widget.index],
        )),
        onVideoEnd: () {
          dataManager.skipToNextVideo(Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, urls: urls);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String url) {
    flickManager.handleChangeVideo(VideoPlayerController.file(File(url)));
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: FlickVideoPlayer(
              flickManager: flickManager,
              preferredDeviceOrientationFullscreen: [
                // DeviceOrientation.portraitUp,
                DeviceOrientation.landscapeLeft,
                // DeviceOrientation.landscapeRight,
              ],
              flickVideoWithControls: FlickVideoWithControls(
                controls: CustomOrientationControls(dataManager: dataManager),
              ),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                videoFit: BoxFit.cover,
                controls: CustomOrientationControls(dataManager: dataManager),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
