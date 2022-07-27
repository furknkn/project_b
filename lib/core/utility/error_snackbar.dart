import '../_core_exports.dart';

//child eklenecek
class ErrorSnackBar {
  void showMessageSnackBar(String content) {
    ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!)
        .showSnackBar(
      SnackBar(
        width: ScreenSize().getWidthPercent(.6),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        content: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.appRed.withOpacity(.9),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: EdgeInsets.all(ScreenSize().getWidthPercent(.03)),
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }
}
