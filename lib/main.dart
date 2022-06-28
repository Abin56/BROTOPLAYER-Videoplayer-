
import 'package:broto_player/widgets/Splashscreens/splashscreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Database/datamode.dart';
import 'Fetching files/InnerFetching/fetch_video_data.dart';

bool? seenonboard;
late Box<DbVideplayer> videoDB;
late Box<SecDataBase>favvideoDB;
late Box<PlaylistModel>playistDB;
late Box<videoplaylistmode>videoPlaylistDB;
late Box<Recentlistingmode>recentDB;
Future<void> main() async {

  
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenonboard = pref.getBool('seenonboard') ?? false; // If null  set to false
 //database><><

  await Hive.initFlutter();
if( !Hive.isAdapterRegistered(DbVideplayerAdapter().typeId)){
  Hive.registerAdapter(DbVideplayerAdapter());
  Hive.registerAdapter(SecDataBaseAdapter());
    Hive.registerAdapter(PlaylistModelAdapter());
    Hive.registerAdapter(videoplaylistmodeAdapter());
    Hive.registerAdapter(RecentlistingmodeAdapter());
}


 videoDB= await Hive.openBox<DbVideplayer>('videoplayer');
 favvideoDB=await Hive.openBox<SecDataBase>('favvideo');
  playistDB= await Hive.openBox<PlaylistModel>('playlistvideo');
  videoPlaylistDB=await Hive.openBox<videoplaylistmode>('videoplaylist');
  recentDB = await Hive.openBox('recentList');
 
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(423.5294196844927, 925.0980565145541),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData.dark().copyWith(
            //     scaffoldBackgroundColor: Colors.black,
            //     ),

            theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                textTheme:
                    GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
                appBarTheme:
                    const AppBarTheme(backgroundColor: Colors.transparent)),
            home: const Splashscreen(),
          );
        });
  }
}
