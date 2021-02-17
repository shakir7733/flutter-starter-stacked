import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter_stacked/src/app/locator.dart';
import 'package:flutter_starter_stacked/src/app/router.gr.dart';
import 'package:flutter_starter_stacked/src/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_starter_stacked/src/models/user_model.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService {
  // final storage = new FlutterSecureStorage();
  final NavigationService _navigationService = locator<NavigationService>();
  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await (http.post(kAPIEndpoint + 'auth/delivery/jwt/create/',
          body: {'email': email, 'password': password}));
      if (user.statusCode == 200) {
        var token = json.decode(user.body);
        _populateCurrentUser(token);
        return user != null;
      }
      var message = json.decode(user.body);
      if (message['detail']?.isEmpty == false) {
        return message['detail'];
      }
      return false;
    } catch (e) {
      return e.message;
    }
  }

  Future logout() async {
    await FlutterSession().set('token', '');
    await FlutterSession().set('user', '');
    await FlutterSession().set('refresh', '');
    _navigationService.navigateTo(Routes.loginView);
  }

  //   Future signUpWithEmail({
  //   @required String email,
  //   @required String password,
  // }) async {
  //   try {
  //     var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return authResult.user != null;
  //   } catch (e) {
  //     return e.message;
  //   }
  // }
  // final response = await http.get(
  //   'https://jsonplaceholder.typicode.com/albums/1',
  //   headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
  // );

  Future<bool> isUserLoggedIn() async {
    // var user = await _firebaseAuth.currentUser();
    // await _populateCurrentUser(user);
    // return user != null;
    dynamic token = await FlutterSession().get("token");
    if (token?.isEmpty == false) {
      var payload = Jwt.parseJwt(token);
      var expiry = payload['exp'];
      if (isTokenExpired(expiry)) {
        dynamic refresh = await FlutterSession().get("refresh");
        if (refresh?.isEmpty == false) {
          var newToken =
              await (http.post(kAPIEndpoint + 'auth/jwt/refresh/', body: {
            'refresh': refresh,
          }));

          if (newToken.statusCode == 200) {
            var token = json.decode(newToken.body);
            _populateCurrentUser(token);
            return true;
          }
          return false;
        }

        return false;
      }
      return true;
    }
    return false;
  }

  Future _populateCurrentUser(user) async {
    if (user != null) {
      // _currentUser = await _firestoreService.getUser(user.uid);
      // await storage.write(key: 'currentUser', value: user);
      await FlutterSession().set('token', user['access']);
      await FlutterSession().set('user', user['user_name']);
      await FlutterSession().set('refresh', user['refresh']);
    }
  }
}

bool isTokenExpired(expired) {
  int bufferSeconds = 10;
  if (expired != null) {
    var currentTime = DateTime.now();
    var expiredDate =
        DateTime.fromMillisecondsSinceEpoch(expired * 1000, isUtc: true);
    Duration durationRemaining = expiredDate.difference(currentTime);

    return (durationRemaining.inSeconds - bufferSeconds) <= 0 ? true : false;
  }
  return false;
}
