import 'package:animemanga_tracker/screens/animeList.dart';
import 'package:animemanga_tracker/screens/allMangas.dart';
import 'package:animemanga_tracker/models/anime.dart';
import 'package:animemanga_tracker/widgets/input_textfield.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  var searchState = false;
  late Anime animeDetails;
  bool hideStatus = false;

  void switchScreen(Anime details) {
    if (!searchState) {
      setState(() {
        searchState = true;
        animeDetails = details;
      });
    }
  }

  void hideNavigationBar() {
    if (hideStatus == true) {
      setState(() {
        hideStatus = false;
      });
    } else {
      setState(() {
        hideStatus = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [
        InputTextField(switchScreen: switchScreen),
        AllAnimes(hideNavigationBar: hideNavigationBar),
        const AllMangas(),
      ],
      items: [
        PersistentBottomNavBarItem(icon: const Icon(Icons.home)),
        PersistentBottomNavBarItem(icon: const Icon(Icons.connected_tv)),
        PersistentBottomNavBarItem(icon: const Icon(Icons.book)),
      ],
      hideNavigationBar: hideStatus,
      confineInSafeArea: true,
      backgroundColor:
          const Color.fromARGB(255, 29, 29, 29), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
