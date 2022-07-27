import 'package:flutter/cupertino.dart';
import 'package:project_b/core/shared_widgets/general_app_bar.dart';
import 'package:project_b/generated/locale_keys.g.dart';

import '../../../../core/_core_exports.dart';
import '../widgets/search_body.dart';
import '../widgets/shoowsheet/filter_showsheet.dart';
import '../widgets/shoowsheet/sort_showsheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const GeneralAppBar(isBackArrowShow: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              filterAndSortButton(context),
              const SearchBody(),
            ],
          ),
        ),
      ),
    ));
  }

  Row filterAndSortButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                LocaleKeys.filter.locale,
                style: AppTextStyles.button12Regular
                    .copyWith(color: AppColors.appWhite),
              ),
              width: ScreenSize().getWidthPercent(.3),
              height: ScreenSize().getWidthPercent(.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.appBlue,
              ),
            ),
            onPressed: () {
              FilterShowSheet().bottomShowSheet(context);
            }),
        CupertinoButton(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                LocaleKeys.sortBy.locale,
                style: AppTextStyles.button12Regular
                    .copyWith(color: AppColors.appWhite),
              ),
              width: ScreenSize().getWidthPercent(.3),
              height: ScreenSize().getWidthPercent(.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.appBlue,
              ),
            ),
            onPressed: () {
              SortShowSheet().bottomShowSheet(context);
            }),
      ],
    );
  }
}
