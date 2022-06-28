import 'package:flutter/material.dart';
import 'all_videos_tile.dart';

class Allvideos extends StatefulWidget {
  const Allvideos({Key? key}) : super(key: key);

  @override
  State<Allvideos> createState() => _AllvideosState();
}

class _AllvideosState extends State<Allvideos> {
  @override
  Widget build(BuildContext context) {
    // getAllVideos();
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'All   ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.white,
              size: 25,
            ),
            Text(
              ' Videos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(child: AllVideoTile()),
      ],
    ));
  }
}
