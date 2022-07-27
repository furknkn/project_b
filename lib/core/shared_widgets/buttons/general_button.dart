import 'package:project_b/generated/locale_keys.g.dart';

import '../../_core_exports.dart';

class GeneralButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? buttonText;
  const GeneralButtonWidget({Key? key, this.onTap, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Ink(
          child: Center(
              child: Text(
            buttonText ?? "",
            style:
                AppTextStyles.button20Bold.copyWith(color: AppColors.appWhite),
          )),
          width: ScreenSize().getWidthPercent(.9),
          height: ScreenSize().getWidthPercent(.15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.appGreen),
        ),
      ),
    );
  }
}
