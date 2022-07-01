import 'package:broto_player/Pages/Add%20favou/favourites.dart';
import 'package:broto_player/homescreen.dart';
import 'package:broto_player/widgets/Drawer/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 100,
            width: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("asset/images/croplogo.jpg"),
              ),
            ),
          ),
          const Text(
            "BRO TO PLAYER",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "EDWIN @BROTOTYPE",
            style: TextStyle(color: Colors.amber[200], fontSize: 12),
          )
        ],
      ),
    );
  }
}

Widget MenuItem(int id, String title, IconData icon, bool selected, onTap) {
  return Material(
    color: const Color.fromARGB(255, 39, 29, 41),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  favourites,
  setting,
  share,
  feedback,
  contact,
  about,
}

// ignore: non_constant_identifier_names
Widget MyDrawerList(context) {
  var currentPage = DrawerSections.dashboard;
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      // show list  of menu drawer.........................
      children: [
        MenuItem(1, "Home", Icons.dashboard_customize_outlined,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Homescreen()));
        }),
        MenuItem(2, "Favourites", Icons.favorite,
            currentPage == DrawerSections.favourites ? true : false, () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Favirote()));
        }),
        MenuItem(3, "Setting", Icons.settings,
            currentPage == DrawerSections.setting ? true : false, () {
          termsAndConditions(context);
        }),
        MenuItem(4, "Share", Icons.share,
            currentPage == DrawerSections.share ? true : false, () {}),
        MenuItem(6, "Contact us", Icons.contact_mail_outlined,
            currentPage == DrawerSections.contact ? true : false, () {
          contactus(context);
        }),
        MenuItem(7, "About", Icons.account_box_outlined,
            currentPage == DrawerSections.about ? true : false, () {
          showAboutDialog(
              context: context,
              applicationIcon: const Image(
                image: AssetImage('asset/images/Brototype2.0.jpg'),
                height: 100,
                width: 100,
              ),
              applicationName: "BROTOPLAYER",
              applicationVersion: '1.0.0',
              children: [
                const Text('BROTOPLAYER is a Video Player created by Abin john')
              ]);
        }),
        Container(
          height: 200,
          width: 100,
          child: Stack(children: [
            Positioned(
               left: 5,
              top: 40,
              child: Row(
                children: [
                  Icon(
                    Icons.adb_outlined,
                    color: Colors.green,
                  ),
                  Text(
                    " Version",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                 
                ],
              ),
            ),
             Positioned(
                    top: 64,
                    left: 44,
                      child: Column(
                        children: [
                          Text(
                    "1.0.0",
                    style: TextStyle(color: Color.fromARGB(156, 255, 255, 255),fontSize: 11.5),
                  ),
                        ],
                      ))
          ]),
        )
      ],
    ),
  );
}

Widget emptyDisplay(String section) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No $section Found",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
