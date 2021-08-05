import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.view.dart';
import 'package:afrocom/meta/views/decider/decider.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';

const String DeciderRoute = "/decider";
const String OnBoardingRoute = "/onboarding";
const String LoginRoute = "/login";
const String SignupRoute = "/signup";
const String HomeRoute = "/home";
final routes = {
  DeciderRoute: (context) => SessionDecider(),
  OnBoardingRoute: (context) => OnBoardingView(),
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
  HomeRoute: (context) => HomeView()
};
