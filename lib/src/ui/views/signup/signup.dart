import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src/app/locator.dart';
import 'package:flutter_starter_stacked/src/app/router.gr.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/already_have_account.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/password_field.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/rounded_button.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/text_field.dart';
import 'package:stacked_services/stacked_services.dart';
import './signup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    Future navigateToLogin() async {
      await _navigationService.navigateTo(Routes.loginView);
    }

    return ViewModelBuilder<SignupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: kBackgroundGradient,
          ),
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //       image: AssetImage("assets/images/bg.png"),
                      //       fit: BoxFit.scaleDown,
                      //       alignment: Alignment.topCenter),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: kLogo,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffefefef),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Expanded(
                        child: ListView(
                          children: <Widget>[
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(4.0),
                                  child: Text(
                                    'SIGN UP',
                                    style: kBoxHeadingTextStyle,
                                  ),
                                ),
                                CustomInputField(
                                  hintText: "Full Name",
                                  onChanged: (value) {},
                                ),
                                CustomInputField(
                                  hintText: "Email Address",
                                  onChanged: (value) {},
                                ),
                                CustomPasswordField(
                                  onChanged: (value) {},
                                ),
                                CustomInputField(
                                  hintText: "Phone NUmber",
                                  onChanged: (value) {},
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'FORGOT PASSWORD?',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 1.20,
                                        color: Color(0xff999999),
                                      ),
                                    ),
                                  ),
                                ),
                                RoundedButton(
                                  buttonTitle: "SIGN UP",
                                  onTap: () {},
                                ),
                                AlreadyHaveAnAccountCheck(
                                    login: false,
                                    onTap: () => navigateToLogin())
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      viewModelBuilder: () => SignupViewModel(),
    );
  }
}
