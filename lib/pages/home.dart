import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_screen.dart';
import 'package:akademi_yanimda/pages/profile_screen.dart';
<<<<<<< HEAD
=======
import 'package:akademi_yanimda/pages/ranking_screen.dart';
>>>>>>> 6a19560129b935fede3666d3ace106f032d4b4c1
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => HomeBarState();
}

class HomeBarState extends State<HomeBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    LessonsScreen(),
<<<<<<< HEAD
    Column(
      children: [SizedBox(height: 100), Image(image: AssetImage("assets/images/Card.png"))],
    ),
=======
    RankingScreen(),
>>>>>>> 6a19560129b935fede3666d3ace106f032d4b4c1
    Text("Home2"),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
=======
      body: _widgetOptions.elementAt(_selectedIndex),
>>>>>>> 6a19560129b935fede3666d3ace106f032d4b4c1
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          selectedIndex: _selectedIndex,
          gap: 10,
          activeColor: Styles.darkPurp,
          padding: EdgeInsets.all(20),
          tabBackgroundColor: Styles.lightPink,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: "Dersler",
            ),
            GButton(
              icon: Icons.emoji_events_outlined,
              text: "Sıralama",
            ),
            GButton(
              icon: Icons.forum_outlined,
              text: "Forum",
            ),
            GButton(
              icon: Icons.person_3_outlined,
              text: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}
