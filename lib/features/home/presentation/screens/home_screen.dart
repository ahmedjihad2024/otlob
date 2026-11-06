import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_state.dart';
import 'package:otlob/features/cart/presentation/screens/cart_screen.dart';
import 'package:otlob/features/explore/presentation/screens/explore_tab_screen.dart';
import 'package:otlob/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:otlob/features/orders/presentation/screens/orders_screen.dart';
import 'package:otlob/features/profile/presentation/screens/profile_screen.dart';

import 'home_tap_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentNavIndex = ValueNotifier(0);
  late PageController _pageController;

  late final List<Widget> _taps = [
    const HomeTapScreen(),
    const ExploreTabScreen(),
    CartScreen(onExploreTap: () => _onTabSelected(1)),
    const OrdersScreen(),
    ProfileScreen(onOrdersTap: () => _onTabSelected(3)),
  ];

  void _onTabSelected(int index) {
    _currentNavIndex.value = index;
    _pageController.jumpToPage(index);
  }

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
    return BlocProvider.value(
      value: sl<CartCubit>()..loadBasket(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            return ValueListenableBuilder(
              valueListenable: _currentNavIndex,
              builder: (context, currentIndex, _) {
                return HomeBottomNavBar(
                  currentIndex: currentIndex,
                  cartCount: 0,
                  onTap: _onTabSelected,
                );
              },
            );
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _taps.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => _taps[index],
        ),
      ),
    );
  }
}
