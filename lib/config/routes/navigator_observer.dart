import 'package:flutter/material.dart';

import '../../core/utils/log_utils.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    Log.i('@ROUTES: [push] current: ${route.settings.name}, previous: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    Log.i('@ROUTES: [pop] current: ${route.settings.name}, previous: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    Log.i('@ROUTES: [replace] current: ${newRoute?.settings.name}, previous: ${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    Log.i('@ROUTES: [remove] current: ${route.settings.name}, previous: ${previousRoute?.settings.name}');
  }
}
