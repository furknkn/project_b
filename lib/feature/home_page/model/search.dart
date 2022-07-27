import 'package:hive/hive.dart';
part 'search.g.dart';

@HiveType(typeId: 1)
class Search {
  Search({required this.listSearch});

  @HiveField(0)
  List<String> listSearch;
}
