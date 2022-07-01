import 'package:animated_button/animated_button.dart';
import 'package:broto_player/Database/datamode.dart';
import 'package:broto_player/Pages/Add%20favou/remove_tile.dart';
import 'package:broto_player/Pages/Recent/R_video_list.dart';
import 'package:broto_player/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';


class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(recentDB.values.length);
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
                'Recent  ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.history_rounded,
                color: Colors.white,
                size: 25,
              ),
              Text(
                ' List',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedButton(
                height: 50.h,
                width: 200.w,
                child: Text(
                  'Clear Recent',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                color: Colors.red,
                onPressed: () {
             recentDB.clear();
                },
                enabled: true,
                shadowDegree: ShadowDegree.dark,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
         ValueListenableBuilder(valueListenable:recentDB.listenable(),
          builder: (BuildContext context, Box<Recentlistingmode> videoR_Listenable, Widget? child){
            return Expanded(
                  child: ListView.builder(
                itemCount: recentDB.length,
                itemBuilder: (context, index) {
                  Recentlistingmode? objplayvideo =
                      recentDB.getAt(index);
                      
                 
                  return RecentVideoList(playlistvideoname: recentDB.name, index: index);
                },
              ));

          }
          ),
        ],
      ),
    );
  }
}
