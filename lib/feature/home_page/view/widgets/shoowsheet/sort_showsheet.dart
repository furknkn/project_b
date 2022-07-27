import 'package:flutter/cupertino.dart';
import 'package:project_b/core/constants/enums/sort_enum.dart';
import 'package:provider/provider.dart';

import '../../../../../core/_core_exports.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../_feature_exports.dart';

class SortShowSheet {
  Future<void> bottomShowSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (final BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            width: double.infinity,
            height: ScreenSize().getWidthPercent(.99),
            child: Consumer<HomePageViewModel>(
              builder: (context, homePageViewModel, child) {
                return Column(children: [
                  Container(
                    margin: EdgeInsets.all(ScreenSize().getWidthPercent(.021)),
                    width: ScreenSize().getWidthPercent(.064),
                    height: ScreenSize().getWidthPercent(.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.appGrey),
                  ),
                  SizedBox(
                    height: ScreenSize().getWidthPercent(.05),
                  ),
                  sortButton(name: LocaleKeys.az.locale, sortEnum: SortEnum.AZ),
                  sortButton(name: LocaleKeys.za.locale, sortEnum: SortEnum.ZA),
                  sortButton(
                      name: LocaleKeys.sortYear.locale, sortEnum: SortEnum.YEAR)
                ]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget sortButton({required final String name, required SortEnum sortEnum}) {
    return Consumer<HomePageViewModel>(
      builder: (context, value, child) => CupertinoButton(
          child: Container(
              color: AppColors.appGrey.withOpacity(.1),
              child: Center(
                  child: Text(
                name,
                style: AppTextStyles.button16Regular
                    .copyWith(color: AppColors.appBlue),
              )),
              height: ScreenSize().getWidthPercent(.1),
              width: double.infinity),
          onPressed: () {
            value.sort(sortEnum);
          }),
    );
  }
}
