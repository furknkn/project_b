import '../../../generated/locale_keys.g.dart';
import 'package:project_b/core/_core_exports.dart';

class Validator {
  static final Validator _instance = Validator._init();
  Validator._init();

  factory Validator() {
    return _instance;
  }
  String? validatorEmail(String value) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return LocaleKeys.eMailValidate.locale;
    }
    return null;
  }

  String? validatorNullCheck(String value) {
    if (value.isEmpty) {
      return LocaleKeys.searcNotEmpty.locale;
    }
    return null;
  }
}
