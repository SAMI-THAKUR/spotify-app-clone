import 'package:flutter/material.dart';
import 'screens/HOME/home.dart';
import 'screens/search.dart';

Map<Widget, GlobalKey<NavigatorState>> navigatorKeys = {
  const Home(): GlobalKey<NavigatorState>(),
  const Search(): GlobalKey<NavigatorState>(),
};

List views = [const Home(), const Search()];

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
            !await navigatorKeys[_selectedTab]!.currentState!.maybePop();
        // let system handle back button if we're on the first route
        return !isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: double.infinity,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff0d1117),
            selectedItemColor: const Color(0xfff5f5f5),
            unselectedItemColor: const Color(0xff333333),
            currentIndex: _selectedTab,
            onTap: (index) {
              setState(() {
                if (index == 1) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
                _selectedTab = index;
              });
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
          body: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
            ],
          )),
    );
  }

  Widget _buildOffstageNavigator(int tabItem) {
    return Offstage(
      offstage: _selectedTab != tabItem,
      child: Navigator(
        key: navigatorKeys[tabItem],
        initialRoute: "/", // this is the route name
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(builder: (context) => views[tabItem]);
        },
      ),
    );
  }
}
