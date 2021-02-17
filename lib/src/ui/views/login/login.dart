import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src/app/locator.dart';
import 'package:flutter_starter_stacked/src/app/router.gr.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/already_have_account.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/busy_button.dart';
// import 'package:flutter_starter_stacked/src/ui/widgets/password_field.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/rounded_button.dart';
// import 'package:flutter_starter_stacked/src/ui/widgets/text_field.dart';
import 'package:stacked_services/stacked_services.dart';
import './login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/input_field.dart';
import 'package:flutter_starter_stacked/src/ui/shared/ui_helpers.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    Future navigateToSignUp() async {
      await _navigationService.navigateTo(Routes.signUpView);
    }

    final a = TextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
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
                  flex: 2,
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
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
                              child: Text(
                                'LOG IN',
                                style: kBoxHeadingTextStyle,
                              ),
                            ),
                            InputField(
                              placeholder: 'Email',
                              controller: emailController,
                            ),
                            verticalSpaceSmall,
                            InputField(
                              placeholder: 'Password',
                              password: true,
                              controller: passwordController,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
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
                            BusyButton(
                              title: 'LOG IN',
                              busy: model.busy,
                              onPressed: () {
                                model.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                            ),
                            AlreadyHaveAnAccountCheck(onTap: () {
                              // print('SignIU');
                              navigateToSignUp();
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
