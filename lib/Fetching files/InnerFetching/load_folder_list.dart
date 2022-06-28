import 'package:flutter/material.dart';
import 'fetch_video_data.dart';

ValueNotifier<List<String>> fetchedFolders = ValueNotifier([]); //folder list
List<String> temp = []; //temp directory for folder funcion

Future loadFolderList() async {
  fetchedFolders.value.clear();
  for (String path in fetchedVideosPath) {
    temp.add(path.substring(
        0, path.lastIndexOf('/'))); //removed video name and add to temp

  }
  fetchedFolders.value = temp.toSet().toList();
}
