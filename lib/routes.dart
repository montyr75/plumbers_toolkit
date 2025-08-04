import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/app/presentation/home_page.dart';
import 'features/app/presentation/not_found_page.dart';
import 'features/offset_calculator/presentation/offset_calculator_page.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  offsetCalculator('/offset-calculator');

  final String? _path;

  String get path => _path ?? name;

  const AppRoute([this._path]);
}

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: false,
    routerNeglect: true,
    initialLocation: AppRoute.home.path,
    observers: [FlutterSmartDialog.observer],
    // redirect: (context, state) {
    //   final appState = ref.read(appServiceProvider);
    //
    //   // if the app starts on a deep link with an uninitialized app state, redirect home
    //   if (appState.isGameActive) {
    //     return null;
    //   }
    //   else {
    //     return '/';
    //   }
    // },
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: AppRoute.offsetCalculator.name,
            path: AppRoute.offsetCalculator.path,
            builder: (context, state) => const OffsetCalculatorPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
