import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter_stacked/src/app/locator.dart';
import 'package:flutter_starter_stacked/src/app/router.gr.dart';
import 'package:flutter_starter_stacked/src/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_starter_stacked/src/models/base_models.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.homeView);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  // Future login() async {
  //   print('Here in view model');
  //   var log = await _api.login();
  //   print('Done');
  //   print(log);
  //   notifyListeners();
  // }
}
