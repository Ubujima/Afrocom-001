# Afrocom <img align="left" width="100" height="100" src="https://github.com/Ubujima/Afrocom/blob/master/Afrocom%20logo.png">  


A `Super`, `Interactive`, `Directory` & `Geo-tagging` Application that collects & maps members activities (users, postings, polls, projects,reports, campaigns, businesses, resources, etc.) These data get spatialized & clusterized with customed markers on the map as per the whole continent, region, countries, towns and localities. Map interaction by tapping a map parts ulters feeds per chosen area. Also with filter and search functions that upon changed by user, the map view automatially changes.

* afrocentric & afrothentic
* members built, owned & ran
* realtime data mapping & access
* community & resource networking
* change facilitation through projects & campaign tools
* 80/20 principle: 80% of profit invested in Ubujima commnuity projects and 20% as incentive to contributors & team
* and whole lot more

### Download App
Explore Africa around you with Afrocom.

<a href="https://apps.apple.com/us/app/spot-videos/id1564675926?utm_source=github&utm_campaign=static" target="blank"><img src="https://raw.githubusercontent.com/dshukertjr/spot/main/assets/readme/download_ios.svg" alt="Download from AppStore" height="96" /></a></span><a href='https://play.google.com/store/apps/details?id=app.spotvideo&utm_source=github&utm_campaign=static&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1' target="blank"><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' height="100" /></a>


### Project Roadmap
App features and status are mentioned at project section [ Click here](https://github.com/Ubujima/Afrocom/projects)


### Designs 
* [Check out AfroCom designs and the aspirations roadmap](https://www.figma.com/file/9YkMdzZ8Qub40xHslT4HbY/AfroCom-MVP?node-id=0%3A1)

## Screenshots

Splash Screen              |  Onboarding Page              | Login Page              |  Sign up Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/Ubujima/Afrocom/blob/68ff0b4c4719736eaf3d42c94f4aa8e5cb93a640/Readme%20Screenshots/Splash%20Screen.png?raw=true)|![](https://github.com/Ubujima/Afrocom/blob/2650cc0a8380dd665c6acc750adb93fa9e2fa1af/Readme%20Screenshots/Onboarding%203.png?raw=true)|![](https://github.com/Ubujima/Afrocom/blob/68ff0b4c4719736eaf3d42c94f4aa8e5cb93a640/Readme%20Screenshots/Connection%20Options.png?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Auth/screenshot_4.jpg?raw=true)|

Home Page        |  Home Main Menu     |   Home Profile Menu               |  Home Taskbar
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/Ubujima/Afrocom/blob/2650cc0a8380dd665c6acc750adb93fa9e2fa1af/Readme%20Screenshots/Main%20Navigation%20Screen.png?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Home/screenshot_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/Home/screenshot_7.jpg?raw=true)|![](https://github.com/Ubujima/Afrocom/blob/68ff0b4c4719736eaf3d42c94f4aa8e5cb93a640/Readme%20Screenshots/Taskbar%20Icon%20Opened.png?raw=true)|

User Location                  | Profile Page       |   NewsFeed- Moments      |     Compose Retweet with comment
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_4.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_twitter_clone/blob/master/screenshots/CreateTweet/screenshot_3.jpg?raw=true)|



## Contributing

If you wish to contribute a change to any of the existing feature or add new in this repo,
please review our [contribution guide](https://github.com/Ubujima/Afrocom/blob/master/CONTRIBUTING.md), check out our issues list [issues list](https://github.com/Ubujima/Afrocom/issues) or send a [pull request](https://github.com/Ubujima/Afrocom/pulls). 
We welcome and encourage all pull requests. It usually will take us within 24-48 hours to respond to any issue or request.


### Getting Started

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


### Local Set-up

* [Check out the demo video on setting up your dev environment](https://www.youtube.com/watch?v=FrpTPiU8EiQ&list=PL1l89snvC0ZuDa0aTtWITulGOs4Rkgz8P&index=8)
	

### Dependencies
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


### Directory Structure
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
     
### Working with Localizations 
This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].
<details>
     <summary> Click to expand </summary>
	
- Adding Strings
  
1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:spot/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

- Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

- Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```
</details>


## Created & Maintained By

[Ubujima Foundation](https://github.com/ubujima), [Twitter](https://www.twitter.com/ubujima), [Instagram](https://www.instagram.com/ubujima)
 

> If you found this project worth donating and please donnate here [PayPal](https://paypal.me/ubujima?locale.x=en_US)


