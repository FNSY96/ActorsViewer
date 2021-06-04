import 'dart:io';

import 'package:actors_viewer/provider/popular_actors_data_provider.dart';
import 'package:actors_viewer/screens/actor_details/actor_details_screen.dart';
import 'package:actors_viewer/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/routes.dart';

void main() {
  runApp(App());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PopularActorsDataProvider(),
          child: HomeScreen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME_SCREEN,
        onGenerateRoute: _getRoute,
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
      ),
    );
  }
}

Route _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.ACTOR_DETAILS:
      var args = settings.arguments as Map<String, dynamic>;
      return _buildRoute(settings, ActorDetailsScreen(id: args['id'] as int));
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
