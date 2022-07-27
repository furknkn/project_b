import 'package:project_b/core/init/notifier/theme_notifier.dart';
import 'package:project_b/feature/home_page/_feature_exports.dart';
import 'package:project_b/feature/login/_feature_exports.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProviderList {
  static ApplicationProviderList? _instance;

  static ApplicationProviderList get instance {
    _instance ??= ApplicationProviderList._init();
    return _instance!;
  }

  ApplicationProviderList._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
