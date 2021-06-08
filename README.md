## Afrocom
A `Super`, `Interactive map`, `Directory based` & `Geotagged` Application that collects & maps members activities (users, postings, polls, projects,reports, campaigns, businesses, resources, etc.) These data get spatialized & clusterized with customed markers on the map as per the whole continent, region, countries, towns and localities. Map interaction by tapping a map parts ulters feeds per chosen area. Also with filter and search functions that upon changed by user, the map view automatially changes.

-`afrocentric & afrothentic`
-`members built, owned & ran`
-`realtime data mapping & access`
-`community & resource networking`
-`change facilitation through projects & campaign tools`
-`80/20 principle: 80% of profit invested in Ubujima commnuity projects and 20% as incentive to contributors & team`
-`and whole lot more`

### Download App
Explore Africa around you with Afrocom.

<a href="https://apps.apple.com/us/app/spot-videos/id1564675926?utm_source=github&utm_campaign=static" target="blank"><img src="https://raw.githubusercontent.com/dshukertjr/spot/main/assets/readme/download_ios.svg" alt="Download from AppStore" height="96" /></a></span><a href='https://play.google.com/store/apps/details?id=app.spotvideo&utm_source=github&utm_campaign=static&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1' target="blank"><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' height="100" /></a>


### Features
* App features is mentioned at project section [ Click here](https://github.com/Ubujima/Afrocom/projects)


### Screenshots

Welcome Page               |  Login Page               | Signup Page               |  Forgot Password Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Auth/screenshot_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Auth/screenshot_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Auth/screenshot_3.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Auth/screenshot_4.jpg?raw=true)|

Home Page Sidebaar         |  Home Page       |   Home Page               |  Home Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Home/screenshot_5.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Home/screenshot_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Home/screenshot_7.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Home/screenshot_6.jpg?raw=true)|

Compose Tweet Page                  | Reply To Tweet       |   Reply to Tweet      |     Compose Retweet with comment
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_4.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_3.jpg?raw=true)|

Tweet Detail Page         |  Tweet Thread              |   Nested Tweet Thread     | Tweet options
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/TweetDetail/screenshot_3.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/TweetDetail/screenshot_4.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/TweetDetail/screenshot_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/TweetDetail/screenshot_2.jpg?raw=true)|



## Contributing

If you wish to contribute a change to any of the existing feature or add new in this repo,
please review our [contribution guide](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/CONTRIBUTING.md),
and send a [pull request](https://github.com/TheAlphamerc/flutter_twitter_clone/pulls). 
I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request.


## Getting Started

This project contains 3 branches:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define=SUPABASE_URL=[Supabase Url] --dart-define=SUPABASE_ANNON_KEY=[Supabase annon key]

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart --dart-define=SUPABASE_URL=[Supabase Url] --dart-define=SUPABASE_ANNON_KEY=[Supabase annon key]
```

_\*Afrocom works on iOS and Android._

---


## Dependencies
<details>
     <summary> Click to expand </summary>
     
* [intl](https://pub.dev/packages/intl)
* [uuid](https://pub.dev/packages/uuid)
* [http](https://pub.dev/packages/http)
* [share](https://pub.dev/packages/share)
* [provider](https://pub.dev/packages/provider)
* [url_launcher](https://pub.dev/packages/url_launcher)
* [google_fonts](https://pub.dev/packages/google_fonts)
* [image_picker](https://pub.dev/packages/image_picker)
* [firebase_auth](https://pub.dev/packages/firebase_auth)
* [google_sign_in](https://pub.dev/packages/google_sign_in)
* [firebase_analytics](https://pub.dev/packages/firebase_analytics)
* [firebase_database](https://pub.dev/packages/firebase_database)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [flutter_advanced_networkimage](https://pub.dev/packages/flutter_advanced_networkimage)
     
</details>


## Directory Structure
<details>
     <summary> Click to expand </summary>
  
```
|-- lib
|   |-- helper
|   |   |-- constant.dart
|   |   |-- customRoute.dart
|   |   |-- enum.dart
|   |   |-- routes.dart
|   |   |-- theme.dart
|   |   |-- utility.dart
|   |   '-- validator.dart
|   |-- main.dart
|   |-- model
|   |   |-- chatModel.dart
|   |   |-- feedModel.dart
|   |   |-- notificationModel.dart
|   |   '-- user.dart
|   |-- page
|   |   |-- Auth
|   |   |   |-- forgetPasswordPage.dart
|   |   |   |-- selectAuthMethod.dart
|   |   |   |-- signin.dart
|   |   |   |-- signup.dart
|   |   |   |-- verifyEmail.dart
|   |   |   '-- widget
|   |   |       '-- googleLoginButton.dart
|   |   |-- common
|   |   |   |-- sidebar.dart
|   |   |   |-- splash.dart
|   |   |   |-- usersListPage.dart
|   |   |   '-- widget
|   |   |       '-- userListWidget.dart
|   |   |-- feed
|   |   |   |-- composeTweet
|   |   |   |   |-- composeTweet.dart
|   |   |   |   |-- state
|   |   |   |   |   '-- composeTweetState.dart
|   |   |   |   '-- widget
|   |   |   |       |-- composeBottomIconWidget.dart
|   |   |   |       |-- composeTweetImage.dart
|   |   |   |       '-- widgetView.dart
|   |   |   |-- feedPage.dart
|   |   |   |-- feedPostDetail.dart
|   |   |   '-- imageViewPage.dart
|   |   |-- homePage.dart
|   |   |-- message
|   |   |   |-- chatListPage.dart
|   |   |   |-- chatScreenPage.dart
|   |   |   |-- conversationInformation
|   |   |   |   '-- conversationInformation.dart
|   |   |   '-- newMessagePage.dart
|   |   |-- notification
|   |   |   '-- notificationPage.dart
|   |   |-- profile
|   |   |   |-- EditProfilePage.dart
|   |   |   |-- follow
|   |   |   |   |-- followerListPage.dart
|   |   |   |   '-- followingListPage.dart
|   |   |   |-- profileImageView.dart
|   |   |   |-- profilePage.dart
|   |   |   '-- widgets
|   |   |       '-- tabPainter.dart
|   |   |-- search
|   |   |   '-- SearchPage.dart
|   |   '-- settings
|   |       |-- accountSettings
|   |       |   |-- about
|   |       |   |   '-- aboutTwitter.dart
|   |       |   |-- accessibility
|   |       |   |   '-- accessibility.dart
|   |       |   |-- accountSettingsPage.dart
|   |       |   |-- contentPrefrences
|   |       |   |   |-- contentPreference.dart
|   |       |   |   '-- trends
|   |       |   |       '-- trendsPage.dart
|   |       |   |-- dataUsage
|   |       |   |   '-- dataUsagePage.dart
|   |       |   |-- displaySettings
|   |       |   |   '-- displayAndSoundPage.dart
|   |       |   |-- notifications
|   |       |   |   '-- notificationPage.dart
|   |       |   |-- privacyAndSafety
|   |       |   |   |-- directMessage
|   |       |   |   |   '-- directMessage.dart
|   |       |   |   '-- privacyAndSafetyPage.dart
|   |       |   '-- proxy
|   |       |       '-- proxyPage.dart
|   |       |-- settingsAndPrivacyPage.dart
|   |       '-- widgets
|   |           |-- headerWidget.dart
|   |           |-- settingsAppbar.dart
|   |           '-- settingsRowWidget.dart
|   |-- state
|   |   |-- appState.dart
|   |   |-- authState.dart
|   |   |-- chats
|   |   |   '-- chatState.dart
|   |   |-- feedState.dart
|   |   |-- notificationState.dart
|   |   '-- searchState.dart
|   '-- widgets
|       |-- bottomMenuBar
|       |   |-- HalfPainter.dart
|       |   |-- bottomMenuBar.dart
|       |   '-- tabItem.dart
|       |-- customAppBar.dart
|       |-- customWidgets.dart
|       |-- newWidget
|       |   |-- customClipper.dart
|       |   |-- customLoader.dart
|       |   |-- customProgressbar.dart
|       |   |-- customUrlText.dart
|       |   |-- emptyList.dart
|       |   |-- rippleButton.dart
|       |   '-- title_text.dart
|       '-- tweet
|           |-- tweet.dart
|           '-- widgets
|               |-- parentTweet.dart
|               |-- retweetWidget.dart
|               |-- tweetBottomSheet.dart
|               |-- tweetIconsRow.dart
|               |-- tweetImage.dart
|               '-- unavailableTweet.dart
|-- pubspec.yaml
```

</details>
     

## Created & Maintained By

[Ubujima Foundation](https://github.com/ubujima) ([Twitter](https://www.twitter.com/ubujima)) ([Insta](https://www.instagram.com/ubujima))
 

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> * [PayPal](https://paypal.me/ubujima/)


