import 'package:flutter/material.dart';
import 'package:tudkabir/core/routing/app_router.dart';
import 'package:tudkabir/shared/utils/theming.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.appTheme,
    );
  }
}
