import 'package:afrocom/core/notifier/authentication.notifier.dart';
import 'package:afrocom/core/notifier/utility.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ...remoteProviders,
    ...localProviders
  ];

  static List<SingleChildWidget> remoteProviders = [
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => UtilityNotifier()),
  ];
  static List<SingleChildWidget> localProviders = [];
}
