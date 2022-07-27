import '../../_core_exports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? hintText;
  final bool obscureText;
  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      required this.focusNode,
      this.validator,
      this.autovalidateMode,
      this.textInputType,
      this.obscureText = false,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.requestFocus(),
      child: SizedBox(
        width: ScreenSize().getWidthPercent(.9),
        height: ScreenSize().getWidthPercent(.2),
        child: Align(
          alignment: Alignment.center,
          child: TextFormField(
              obscureText: obscureText,
              keyboardType: textInputType,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide:
                        const BorderSide(color: AppColors.appGrey, width: 3),
                  )),
              focusNode: focusNode,
              controller: textEditingController,
              maxLines: 1,
              validator: validator),
        ),
      ),
    );
  }
}
