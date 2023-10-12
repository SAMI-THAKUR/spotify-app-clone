import 'package:flutter/material.dart';
import 'screens/HOME/home.dart';
import 'screens/search.dart';
import 'screens/profile.dart';

List<GlobalKey<NavigatorState>> navigatorKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
];

final List<Widget> views = [const Home(), const Search(), profile()];

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});
  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await navigatorKeys[_selectedTab].currentState!.maybePop();
          // let system handle back button if we're on the first route
          return !isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: double.infinity,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black87.withOpacity(0.9),
            selectedItemColor: const Color(0xff1DB954),
            unselectedItemColor: const Color(0xff333333),
            currentIndex: _selectedTab,
            onTap: (index) {
              if (index != _selectedTab) {
                setState(() {
                  _selectedTab = index;
                });
              } else {
                // Pop to the first route in the current tab's navigator
                final navigator = navigatorKeys[_selectedTab].currentState!;
                navigator.popUntil((route) => route.isFirst);
              }
            },
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: "Your Library",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
          body: _buildOffstageNavigator(),
        ));
  }

  Widget _buildOffstageNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedTab],
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => views[_selectedTab]);
      },
    );
  }
}
