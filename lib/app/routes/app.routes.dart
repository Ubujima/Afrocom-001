import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.view.dart';
import 'package:afrocom/meta/views/decider/decider.view.dart';
import 'package:afrocom/meta/views/home/add_post/add_post.view.dart';
import 'package:afrocom/meta/views/home/feed/feed.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';
import 'package:afrocom/meta/views/profile_setup/profile_setup.view.dart';
import 'package:afrocom/meta/views/profile_view/profile.view.dart';
import 'package:afrocom/meta/views/settings_view/setting.view.dart';
import 'package:afrocom/meta/views/share_view/share_view.dart';
import 'package:afrocom/meta/views/solo_post/solo_post.view.dart';
import 'package:afrocom/meta/views/splash_view/splash.view.dart';

const String SplashRoute = "/splash";
const String DeciderRoute = "/decider";
const String OnBoardingRoute = "/onboarding";
const String LoginRoute = "/login";
const String SignupRoute = "/signup";
const String ShareRoute = "/share";
const String ProfileSetupRoute = "/profile-setup";
const String HomeRoute = "/home";
const String AddPostRoute = "/add-post";
const String FeedRoute = "/feed";
const String ProfileRoute = "/profile";
const String SettingRoute = "/setting";
const String SoloPostRoute = "/solo-post";

final routes = {
  SplashRoute: (context) => SplashView(),
  DeciderRoute: (context) => SessionDecider(),
  OnBoardingRoute: (context) => OnBoardingView(),
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
  ShareRoute: (context) => ShareView(),
  ProfileSetupRoute: (context) => ProfileSetupView(),
  HomeRoute: (context) => HomeView(),
  AddPostRoute: (context) => AddPostView(
        addPostArgument: ModalRoute.of(context)!.settings.arguments as dynamic,
      ),
  FeedRoute: (context) => FeedView(),
  ProfileRoute: (context) => ProfileView(),
  SettingRoute: (context) => SettingView(),
  SoloPostRoute: (context) => SoloPost(
      soloPostArguments: ModalRoute.of(context)!.settings.arguments as dynamic)
};
