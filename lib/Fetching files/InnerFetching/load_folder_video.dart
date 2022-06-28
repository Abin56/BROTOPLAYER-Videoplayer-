import 'package:flutter/material.dart';
import 'fetch_video_data.dart';

ValueNotifier<List<String>> filteredFolderVideos =
    ValueNotifier([]); //folder click videos
    
getFolderVideos(String path) {
  filteredFolderVideos.value.clear(); //for avoiding repeating elements
  List<String> matchedVideoPath = [];

  List<String> splittedMatchedVideoPath = [];

  var splitted = path.split('/');

  for (String singlePath in fetchedVideosPath) {
    if (singlePath.startsWith(path)) {
      matchedVideoPath.add(singlePath);
    }
  }

  for (String newPath in matchedVideoPath) {
    splittedMatchedVideoPath = newPath.split('/');
    if (splittedMatchedVideoPath[splitted.length].endsWith('.mp4') ||
        splittedMatchedVideoPath[splitted.length].endsWith('.mkv')) {
      filteredFolderVideos.value.add(newPath);
    }
  }
  
  // notify listeners if needed\
}