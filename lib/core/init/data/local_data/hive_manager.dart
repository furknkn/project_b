import 'package:hive/hive.dart';
import 'package:project_b/feature/home_page/model/search.dart';

class HiveManager {
  static final HiveManager instance = HiveManager._init();
  factory HiveManager() {
    return instance;
  }
  HiveManager._init();
  Box? box;
  static Future boxInit() async {
    Hive.registerAdapter(SearchAdapter());
    instance.box ??= await Hive.openBox("localBox");
  }

  void addBox({required final String key, required final dynamic object}) {
    box?.put(key, object);
  }

  dynamic getBox({required final String key}) {
    return box?.get(key);
  }
}
