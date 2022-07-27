import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/_core_exports.dart';
import 'core/init/notifier/theme_notifier.dart';

void main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProviderList.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
        startLocale: LanguageManager.instance.trLocale,
        saveLocale: true,
        child: const AlphaProject(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  await HiveManager.boxInit();
}

class AlphaProject extends StatelessWidget {
  const AlphaProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ScreenSize().screenSize = MediaQuery.of(context).size;
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      title: 'project_b',
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: GlobalContextKey.instance.globalKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
