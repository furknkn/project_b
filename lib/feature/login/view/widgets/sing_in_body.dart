import 'package:project_b/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/buttons/general_button.dart';
import '../../../../core/shared_widgets/input_fields/customTextField.dart';
import '../../../../core/utility/validator/validator.dart';
import '../../view_model/login_view_model.dart';

class SingInBody extends StatelessWidget {
  const SingInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          return Column(children: [
            CustomTextFormField(
              autovalidateMode: AutovalidateMode.always,
              hintText: LocaleKeys.eMail.locale,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
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
              buttonText: LocaleKeys.singIn.locale,
              onTap: () {
                loginViewModel.singIn();
              },
            )
          ]);
        },
      ),
    );
  }
}
