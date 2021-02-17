import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_starter_stacked/src/services/api.dart';
import 'dialog_service.dart';
import 'authentication_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  DiaService get diaService;
  @lazySingleton
  API get apiService;
  @lazySingleton
  AuthenticationService get authService;
}
// flutter pub run build_runner build
// flutter pub cache repair
// flutter pub get
