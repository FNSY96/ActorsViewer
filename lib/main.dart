import 'dart:io';

import 'package:actors_viewer/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'app_model.dart';
import 'constants/routes.dart';

void main() {
  runApp(App(appModel: AppModel(),));
}
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();
class App extends StatelessWidget {
  // This widget is the root of your application.
  final AppModel appModel;

  const App({@required this.appModel});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: appModel,
      child: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // initialRoute: kIsWeb ? ScreenRoutes.LOGIN_SCREEN : ScreenRoutes.SPLASH_SCREEN,
            onGenerateRoute: _getRoute,
            navigatorKey: navigatorKey,
            navigatorObservers: [routeObserver],
          );
        },
      ),
    );
  }
}

Route _getRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return _buildRoute(settings, HomeScreen());
  }
}

_buildRoute(RouteSettings settings, Widget page) {
  return Platform.isAndroid
      ? PageRouteBuilder(
          settings: settings,
          pageBuilder: (BuildContext context, _, __) => page,
        )
      : CupertinoPageRoute(
          builder: (BuildContext context) => page,
          settings: settings,
        );
}
