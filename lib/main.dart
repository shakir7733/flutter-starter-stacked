import 'package:flutter/material.dart';
// import 'src/app.dart';
import 'package:stacked_services/stacked_services.dart';
import 'src/app/locator.dart';
import 'src/app/router.gr.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     primaryColor: Color(0xff33C58E),
      //     scaffoldBackgroundColor: Color(0xff33C58E),
      //     inputDecorationTheme: InputDecorationTheme(
      //         helperStyle: TextStyle(color: Color(0xffcfcfcf)))),
      initialRoute: Routes.startUpView,
      onGenerateRoute: Routers().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
