import 'package:flutter/material.dart';
import 'package:otlob/features/home/presentation/widgets/bottom_nav_bar.dart';

import 'package:otlob/features/explore/presentation/screens/explore_tab_screen.dart';
import 'home_tap_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentNavIndex = ValueNotifier(0);
  late PageController _pageController;
  final List<Widget> _taps = [
    const HomeTapScreen(),
    const ExploreTabScreen(),
    Container(color: Colors.red.withValues(alpha: .4)),
    Container(color: Colors.blue.withValues(alpha: .4)),
    Container(color: Colors.black.withValues(alpha: .4)),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentNavIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentNavIndex,
        builder: (context, _, _) {
          return HomeBottomNavBar(
            currentIndex: _currentNavIndex.value,
            cartCount: 0,
            onTap: (index) {
              _currentNavIndex.value = index;
              _pageController.jumpToPage(index);
            },
          );
        }
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _taps.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            _taps[index],
      ),
    );
  }
}
