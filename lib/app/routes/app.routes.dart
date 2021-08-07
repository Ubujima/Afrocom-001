import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';

//! Names routes
const String DeciderRoute = "/decider";
const String OnBoardingRoute = "/onboarding";
const String LoginRoute = "/login";
const String SignupRoute = "/signup";
const String HomeRoute = "/home";

//! Routes allotment
final routes = {
  OnBoardingRoute: (context) => OnBoardingView(),
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
};
