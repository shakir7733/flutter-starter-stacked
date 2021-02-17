import 'package:flutter_starter_stacked/src/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_starter_stacked/src/services/authentication_service.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future logout() async {
    _authenticationService.logout();
  }
}
