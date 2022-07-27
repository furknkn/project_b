import 'package:project_b/core/init/notifier/_notifier_exports.dart';
import 'package:provider/provider.dart';

import '../_core_exports.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackArrowShow;
  const GeneralAppBar({Key? key, required this.isBackArrowShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenSize().getWidthPercent(.4),
      child: Padding(
        padding: context.paddingHighHorizontal,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          isBackArrowShow
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : const SizedBox.shrink(),
          IconButton(
              onPressed: () {
                Provider.of<ThemeNotifier>(context, listen: false)
                    .changeTheme();
              },
              icon: const Icon(Icons.sunny))
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenSize().getWidthPercent(.2));
}
