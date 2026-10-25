import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otlob/core/app.dart';
import 'package:otlob/features/explore_products/presentation/screens/explore_products_screen.dart';
import 'package:otlob/features/home/presentation/screens/home_screen.dart';
import 'package:otlob/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:otlob/features/sign_in/presentation/sign_in_screen.dart';
import 'package:otlob/features/sign_up/presentation/sign_up_screen.dart';

/// Centralized path/name constants — pass these to `context.pushNamed` /
/// `context.go` so we never typo a route name and IDE rename works.
///
// dart format off
enum Routes {
  // Shared routes
  splash                 ('splash'),
  auth                   ('auth'),
  signUp                 ('sign-up'),

  // User routes
  onboarding             ('onboarding'),
  authSuccess            ('auth-success'),
  home                   ('home'),
  search                 ('search'),
  sections               ('sections'),
  products               ('products'),
  productDetails         ('product-details'),
  cart                   ('cart'),
  confirmOrder           ('confirm-order'),
  orderDetails           ('order-details'),
  language               ('language'),
  editProfile            ('edit-profile'),
  legalPolicies          ('legal-policies'),
  helpSupport            ('help-support'),

  // Cashier routes
  cashierHome            ('cashier-home'),
  cashierOrderDetails    ('cashier-order-details'),

  // Captain routes
  captainHome            ('captain-home'),
  captainOrderDetails    ('captain-order-details'),
  captainDeliveryOutcome ('captain-delivery-outcome'),

  // Shared (cashier + captain)
  support                ('support');

  final String name;
  const Routes(this.name);

  String get path => '/$name';
}
// dart format on

Widget _slideFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final inCurve = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );

  final outCurve = CurvedAnimation(
    parent: secondaryAnimation,
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );

  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(inCurve),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-0.3, 0),
      ).animate(outCurve),
      child: child,
    ),
  );
}

GoRoute _r({
  required String name,
  required String path,
  required Widget Function(BuildContext context, GoRouterState state) builder,
}) => GoRoute(
  name: name,
  path: path,
  pageBuilder: (context, state) => CustomTransitionPage<void>(
    key: state.pageKey,
    name: name,
    child: builder(context, state),
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: _slideFadeTransition,
  ),
);

final GoRouter appRouter = GoRouter(
  navigatorKey: NAVIGATOR_KEY,
  initialLocation: Routes.auth.path,
  routes: [
    _r(
      name: Routes.splash.name,
      path: Routes.splash.path,
      builder: (_, __) => const SignInScreen(),
    ),
    _r(
      name: Routes.onboarding.name,
      path: Routes.onboarding.path,
      builder: (_, __) => const SignInScreen(),
    ),
    _r(
      name: Routes.auth.name,
      path: Routes.auth.path,
      builder: (_, __) => const SignInScreen(),
    ),
    _r(
      name: Routes.signUp.name,
      path: Routes.signUp.path,
      builder: (_, __) => const SignUpScreen(),
    ),
    _r(
      name: Routes.authSuccess.name,
      path: Routes.authSuccess.path,
      builder: (_, __) => const HomeScreen(),
    ),
    _r(
      name: Routes.home.name,
      path: Routes.home.path,
      builder: (_, __) => const HomeScreen(),
    ),
    _r(
      name: Routes.search.name,
      path: Routes.search.path,
      builder: (_, state) {
        if (state.extra is ExploreProductsArgs) {
          final args = state.extra as ExploreProductsArgs;
          return ExploreProductsScreen(
            title: args.title,
            explorType: args.explorType,
            id: args.id,
          );
        }
        return const ExploreProductsScreen(title: "Search Products");
      },
    ),
    _r(
      name: Routes.sections.name,
      path: Routes.sections.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.products.name,
      path: Routes.products.path,
      builder: (_, state) {
        if (state.extra is ExploreProductsArgs) {
          final args = state.extra as ExploreProductsArgs;
          return ExploreProductsScreen(
            title: args.title,
            explorType: args.explorType,
            id: args.id,
          );
        }
        return const ExploreProductsScreen();
      },
    ),
    _r(
      name: Routes.productDetails.name,
      path: Routes.productDetails.path,
      builder: (_, __) => const ProductDetailsScreen(),
    ),
    _r(
      name: Routes.cart.name,
      path: Routes.cart.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.confirmOrder.name,
      path: Routes.confirmOrder.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.orderDetails.name,
      path: Routes.orderDetails.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.language.name,
      path: Routes.language.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.editProfile.name,
      path: Routes.editProfile.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.legalPolicies.name,
      path: Routes.legalPolicies.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.helpSupport.name,
      path: Routes.helpSupport.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.cashierHome.name,
      path: Routes.cashierHome.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.support.name,
      path: Routes.support.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.cashierOrderDetails.name,
      path: Routes.cashierOrderDetails.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.captainHome.name,
      path: Routes.captainHome.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.captainOrderDetails.name,
      path: Routes.captainOrderDetails.path,
      builder: (_, __) => const SizedBox(),
    ),
    _r(
      name: Routes.captainDeliveryOutcome.name,
      path: Routes.captainDeliveryOutcome.path,
      builder: (_, __) => const SizedBox(),
    ),
  ],
);
