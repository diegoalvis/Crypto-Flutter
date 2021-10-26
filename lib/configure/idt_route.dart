import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueb_tecnica_cryptocurrency/pages/home/home_page.dart';

class IdtRoute {
  static final IdtRoute _singleton = IdtRoute._internal();

  factory IdtRoute() {
    return _singleton;
  }

  IdtRoute._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  void popT<T>(T result) {
    navigatorKey.currentState!.pop<T>(result);
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }


  goHome() {
    return navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }
}
