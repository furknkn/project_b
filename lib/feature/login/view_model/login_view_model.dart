import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_b/core/_core_exports.dart';
import 'package:project_b/core/init/data/network/firebase_manager/firebase_user_manager.dart';
import 'package:project_b/generated/locale_keys.g.dart';

class LoginViewModel with ChangeNotifier {
  bool isSingIn = true;
  bool isLoad = false;
  late User? user;

  final TextEditingController txtUserNameController = TextEditingController();
  final TextEditingController txtPasswordController = TextEditingController();
  final TextEditingController txtEmailController = TextEditingController();

  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  void changeIsload() {
    isLoad = !isLoad;
    notifyListeners();
  }

  void changeIsSingIn() {
    txtUserNameController.clear();
    txtPasswordController.clear();
    txtEmailController.clear();

    isSingIn = !isSingIn;
    notifyListeners();
  }

  Future<void> singIn() async {
    changeIsload();
    String _email = txtEmailController.text;
    String _password = txtPasswordController.text;
    user = await FirebaseManager.instance
        .signInWithEmailAndPassword(_email, _password);
    if (user == null) {
      changeIsload();
      ErrorSnackBar().showMessageSnackBar(LocaleKeys.loginWarning.locale);
    } else {
      changeIsload();
      NavigationService.instance
          .navigateToPage(path: NavigationConstants.HOME_PAGE);
    }
  }

  Future<void> singUp() async {
    changeIsload();
    String _email = txtEmailController.text;
    String _password = txtPasswordController.text;
    user = await FirebaseManager.instance
        .signUpWithEmailAndPassword(_email, _password);
    if (user == null) {
      changeIsload();
      ErrorSnackBar().showMessageSnackBar(LocaleKeys.loginWarning.locale);
    } else {
      changeIsload();
      singIn();
    }
  }
}
