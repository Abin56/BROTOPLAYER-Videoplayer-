import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';


Future<String> getThumbnail(String tumbnail) async {
  //>>>>>Assest folder<<<<<<<<<<<<<<<
  // final byteData = await rootBundle.load(tumbnail);
  // Directory tempDir = await getTemporaryDirectory();

  // File tempVideo = File("${tempDir.path}$tumbnail")
  //   ..createSync(recursive: true)
  //   ..writeAsBytesSync(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<

  final fileName = await VideoThumbnail.thumbnailFile(
    video: tumbnail,
    thumbnailPath: (await getTemporaryDirectory()).path,
    imageFormat: ImageFormat.PNG,
    quality: 100,
  );
  // print(fileName.runtimeType);
  return fileName!;
}