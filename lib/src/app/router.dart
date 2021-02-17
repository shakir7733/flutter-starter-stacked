import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_starter_stacked/src/ui/views/login/login.dart';
import 'package:flutter_starter_stacked/src/ui/views/signup/signup.dart';
import 'package:flutter_starter_stacked/src/ui/views/home/home.dart';
import 'package:flutter_starter_stacked/src/ui/views/startup/startup.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: HomeView),
  ],
)
class $Routers {}

// flutter packages pub run build_runner build
