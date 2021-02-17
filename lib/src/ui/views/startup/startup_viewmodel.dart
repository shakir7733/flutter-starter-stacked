import 'dart:async';

import 'package:flutter_starter_stacked/src/app/locator.dart';
import 'package:flutter_starter_stacked/src/app/router.gr.dart';
import 'package:flutter_starter_stacked/src/services/authentication_service.dart';
import 'package:flutter_starter_stacked/src/models/base_models.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    // var timer = Timer(
    //     Duration(seconds: 5),
    //     () => {
    // if (hasLoggedInUser)
    //   {_navigationService.navigateTo(Routes.homeView)}
    // else
    //   {_navigationService.navigateTo(Routes.loginView)}
    //         });

    // timer.cancel();
    Timer setTimeout(callback, [int duration = 4000]) {
      return Timer(Duration(milliseconds: duration), callback);
    }

    void clearTimeout(Timer t) {
      t.cancel();
    }

    setTimeout(() => {
          if (hasLoggedInUser)
            {_navigationService.navigateTo(Routes.homeView)}
          else
            {_navigationService.navigateTo(Routes.loginView)}
        });
  }
}
