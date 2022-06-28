import 'dart:developer';

import 'package:flutter/services.dart';

class SearchFilesInStorage {
  static const _platform = MethodChannel('search_files_in_storage/search');

  static void searchInStorage(
    List<String> query,
    void Function(List<String>) onSuccess,
    void Function(String) onError,
  ) {
    _platform.invokeMethod('search', query).then((value) {
      final _res = value as List<Object?>;
      onSuccess(_res.map((e) => e.toString()).toList());
    }).onError((error, stackTrace) {
      log(error.toString());
      onError(error.toString());
    });
  }
}
