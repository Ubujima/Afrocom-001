import 'package:afrocom/app/providers/providers.dart';
import 'package:afrocom/app/routes/app.routes.dart';
import 'package:afrocom/app/shared/colors.dart';
import 'package:afrocom/app/shared/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: DeciderRoute,
        routes: routes,
        theme: ThemeData(
            accentColor: KConstantColors.greenColor,
            primaryColor: KConstantColors.yellowColor,
            fontFamily: KConstantFonts.PoppinsMedium));
  }
}
