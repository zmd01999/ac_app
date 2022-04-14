import 'package:maple/src/screens/introduction_screen/components/care_view.dart';
import 'package:maple/src/screens/introduction_screen/components/center_next_button.dart';
import 'package:maple/src/screens/introduction_screen/components/mood_diary_vew.dart';
import 'package:maple/src/screens/introduction_screen/components/relax_view.dart';
import 'package:maple/src/screens/introduction_screen/components/splash_view.dart';
import 'package:maple/src/screens/introduction_screen/components/top_back_skip_view.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/login_screen/login/login_screen.dart';


class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            RelaxView(
              animationController: _animationController!,
            ),
            CareView(
              animationController: _animationController!,
            ),
            MoodDiaryVew(
              animationController: _animationController!,
            ),
            // WelcomeView(
            //   animationController: _animationController!,
            // ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.75,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.25) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.25 &&
        _animationController!.value <= 0.5) {
      _animationController?.animateTo(0.25);
    } else if (_animationController!.value > 0.5 &&
        _animationController!.value <= 0.75) {
      _animationController?.animateTo(0.5);
    } else if (_animationController!.value > 0.75 &&
        _animationController!.value <= 0.1) {
      _animationController?.animateTo(0.75);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.25) {
      _animationController?.animateTo(0.5);
    } else if (_animationController!.value > 0.25 &&
        _animationController!.value <= 0.5) {
      _animationController?.animateTo(0.75);
    } else if (_animationController!.value > 0.5 &&
        _animationController!.value <= 0.75) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    // Navigator.pop(context);
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName
    );
  }
}
