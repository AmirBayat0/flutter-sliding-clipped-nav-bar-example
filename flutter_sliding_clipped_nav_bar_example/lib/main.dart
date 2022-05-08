import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Sliding Clipped Nav Bar Package Example',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;

  ///
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  /// METHOD FOR CHANGING APPBAR BACKGROUND COLOR
  Color appBarColor() {
    switch (selectedIndex) {
      case (0):
        return Colors.amber;
      case (1):
        return Colors.red;
      case (2):
        return Colors.deepPurpleAccent;
      case (3):
        return Colors.pinkAccent;
      default:
        return Colors.transparent;
    }
  }

  ///
  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            /// Custom AppBar
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: appBarColor(),
              child: SwitchListTile(
                activeColor: Colors.white,
                title: Text(
                  'Colorful Navbar',
                  style: GoogleFonts.oxygen(color: Colors.white),
                ),
                value: _colorful,
                onChanged: (bool value) {
                  setState(() {
                    _colorful = !_colorful;
                  });
                },
              ),
            ),

            /// Main Body
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _listOfWidget,
              ),
            ),
          ],
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: _colorful
          ? SlidingClippedNavBar.colorful(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.home,
                  title: 'Home',
                  activeColor: Colors.amber,
                  inactiveColor: Colors.red,
                ),
                BarItem(
                  icon: Icons.search_rounded,
                  title: 'Search',
                  activeColor: Colors.red,
                  inactiveColor: Colors.deepPurpleAccent,
                ),
                BarItem(
                  icon: Icons.bolt_rounded,
                  title: 'Energy',
                  activeColor: Colors.deepPurpleAccent,
                  inactiveColor: Colors.pinkAccent,
                ),
                BarItem(
                  icon: Icons.tune_rounded,
                  title: 'Settings',
                  activeColor: Colors.pinkAccent,
                  inactiveColor: Colors.amber,
                ),
              ],
            )
          : SlidingClippedNavBar(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              activeColor: const Color(0xFF01579B),
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: Icons.search_rounded,
                  title: 'Search',
                ),
                BarItem(
                  icon: Icons.bolt_rounded,
                  title: 'Energy',
                ),
                BarItem(
                  icon: Icons.tune_rounded,
                  title: 'Settings',
                ),
              ],
            ),
    );
  }
}

///
TextStyle fontstyle = GoogleFonts.oxygen(
    fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
double iconSize = 200;

/// LIST OF SCREENS
List<Widget> _listOfWidget = <Widget>[
  /// EVENT
  Container(
    color: Colors.amber,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.home,
          size: iconSize,
          color: Colors.white,
        ),
        Text(
          "@CodeWithFlexz",
          style: fontstyle,
        ),
      ],
    ),
  ),

  /// SERACH
  Container(
    alignment: Alignment.center,
    color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          size: iconSize,
          color: Colors.white,
        ),
        Text("Search", style: fontstyle),
      ],
    ),
  ),

  /// ENERGY
  Container(
    color: Colors.deepPurpleAccent,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.bolt,
          size: iconSize,
          color: Colors.white,
        ),
        Text("Energy", style: fontstyle),
      ],
    ),
  ),

  /// SETTINGS
  Container(
    alignment: Alignment.center,
    color: Colors.pinkAccent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.tune_rounded,
          size: iconSize,
          color: Colors.white,
        ),
        Text("Settings", style: fontstyle),
      ],
    ),
  ),
];
