import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.view.dart';
import 'package:afrocom/meta/views/decider/decider.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/splash_view/splash.view.dart';

final String DeciderRoute = "/decider";
final String SplashRoute = "/splash";
final String LoginRoute = "/login";
final String SignupRoute = "/signup";
final String HomeRoute = "/home";
final routes = {
  DeciderRoute: (context) => SessionDecider(),
  SplashRoute: (context) => SplashView(),
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
  HomeRoute: (context) => HomeView()
};
