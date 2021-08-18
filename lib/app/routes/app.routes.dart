import 'package:afrocom/meta/views/authentication/login/login.view.dart';
import 'package:afrocom/meta/views/authentication/signup/signup.view.dart';
import 'package:afrocom/meta/views/decider/decider.view.dart';
import 'package:afrocom/meta/views/home/add_post/add_post.view.dart';
import 'package:afrocom/meta/views/home/feed/feed.view.dart';
import 'package:afrocom/meta/views/home/home.view.dart';
import 'package:afrocom/meta/views/onboarding/onboarding.view.dart';
import 'package:afrocom/meta/views/profile_setup/profile_setup.view.dart';
import 'package:afrocom/meta/views/share_view/share_view.dart';

const String DeciderRoute = "/decider";
const String OnBoardingRoute = "/onboarding";
const String LoginRoute = "/login";
const String SignupRoute = "/signup";
const String ShareRoute = "/share";
const String ProfileSetupRoute = "/profile-setup";
const String HomeRoute = "/home";
const String AddPostRoute = "/add-post";
const String FeedRoute = "/feed";
final routes = {
  DeciderRoute: (context) => SessionDecider(),
  OnBoardingRoute: (context) => OnBoardingView(),
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
  ShareRoute: (context) => ShareView(),
  ProfileSetupRoute: (context) => ProfileSetupView(),
  HomeRoute: (context) => HomeView(),
  AddPostRoute: (context) => AddPostView(),
  FeedRoute: (context) => FeedView()
};
