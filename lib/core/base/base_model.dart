abstract class BaseModel<T> {
  String toJson();
  T fromJson(Map<String, dynamic> json);
}
