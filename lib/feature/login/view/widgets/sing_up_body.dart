import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/buttons/general_button.dart';
import '../../../../core/shared_widgets/input_fields/customTextField.dart';
import '../../../../core/utility/validator/validator.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../_feature_exports.dart';

class SingUpBody extends StatelessWidget {
  const SingUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          return Column(children: [
            CustomTextFormField(
              hintText: LocaleKeys.eMail.locale,
              textEditingController: loginViewModel.txtEmailController,
              focusNode: loginViewModel.emailFocusNode,
              validator: (final value) {
                return Validator().validatorEmail(value ?? "");
              },
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            CustomTextFormField(
              obscureText: true,
              hintText: LocaleKeys.password.locale,
              textEditingController: loginViewModel.txtPasswordController,
              focusNode: loginViewModel.passwordFocusNode,
              autovalidateMode: AutovalidateMode.always,
            ),
            SizedBox(
              height: ScreenSize().getWidthPercent(.3),
            ),
            GeneralButtonWidget(
              buttonText: LocaleKeys.singUp.locale,
              onTap: () {
                loginViewModel.singUp();
              },
            )
          ]);
        },
      ),
    );
  }
}
