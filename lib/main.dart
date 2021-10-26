import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueb_tecnica_cryptocurrency/pages/home/home_page.dart';
import 'configure/get_it_locator.dart';
import 'configure/idt_route.dart';

void main() async {
  setUpLocator();
  await locator.allReady();

  WidgetsFlutterBinding
      .ensureInitialized(); //deshabilitar el modo horizontal(Landscape)
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: IdtRoute().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'CryptoCurrency',
      home: HomePage(),
    );
  }
}
