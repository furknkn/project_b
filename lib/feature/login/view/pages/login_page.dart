import 'package:project_b/core/shared_widgets/general_app_bar.dart';
import 'package:project_b/feature/login/_feature_exports.dart';
import 'package:project_b/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';
import '../../../../core/_core_exports.dart';
import '../widgets/sing_in_body.dart';
import '../widgets/sing_up_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GeneralAppBar(isBackArrowShow: false),
      body: SafeArea(
        child: Consumer<LoginViewModel>(
          builder: (context, loginViewModel, child) {
            return loginViewModel.isLoad
                ? GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: ScreenSize().getWidthPercent(.3),
                              height: ScreenSize().getWidthPercent(.3),
                              child:
                                  Image.asset(ImageConstants.instance.getLogo)),
                          SizedBox(
                            height: context.mediumValue,
                          ),
                          loginViewModel.isSingIn
                              ? const SingInBody()
                              : const SingUpBody(),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                loginViewModel.changeIsSingIn();
                              },
                              child: Text(!loginViewModel.isSingIn
                                  ? LocaleKeys.singIn.locale
                                  : LocaleKeys.singUp.locale))
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: AppColors.appGreen),
                  );
          },
        ),
      ),
    );
  }
}
