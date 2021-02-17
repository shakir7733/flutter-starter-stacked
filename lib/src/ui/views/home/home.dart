import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src//ui/views/home/home_viewmodel.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: kBackgroundGradient,
          ),
          child: RoundedButton(
            buttonTitle: 'Logout',
            onTap: () => model.logout(),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
