import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../../core/_core_exports.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../_feature_exports.dart';

class FilterShowSheet {
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
            child: Column(children: [
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
              Padding(
                padding: EdgeInsets.all(ScreenSize().getWidthPercent(.05)),
                child: TextField(
                  controller:
                      Provider.of<HomePageViewModel>(context, listen: false)
                          .txtFilterController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    label: Center(
                      child: Text(
                        LocaleKeys.filter.locale,
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<HomePageViewModel>(
                builder: (context, homePageViewModel, child) {
                  return Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: homePageViewModel.radioGroupVal,
                        onChanged: (value) {
                          homePageViewModel
                              .changeRadio(int.parse(value.toString()));
                        },
                        activeColor: Colors.green,
                      ),
                      Text(LocaleKeys.nameFilter.locale),
                      Radio(
                        value: 1,
                        groupValue: homePageViewModel.radioGroupVal,
                        onChanged: (value) {
                          homePageViewModel
                              .changeRadio(int.parse(value.toString()));
                        },
                        activeColor: Colors.green,
                      ),
                      Text(LocaleKeys.yearFilter.locale)
                    ],
                  );
                },
              ),
              Consumer<HomePageViewModel>(
                builder: (context, homePageViewModel, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            homePageViewModel.filter(2);
                            Navigator.pop(context);
                          },
                          child: Text(LocaleKeys.movie.locale)),
                      TextButton(
                          onPressed: () {
                            homePageViewModel.filter(3);
                            Navigator.pop(context);
                          },
                          child: Text(LocaleKeys.series.locale)),
                      TextButton(
                          onPressed: () {
                            homePageViewModel.filter(4);
                            Navigator.pop(context);
                          },
                          child: Text(LocaleKeys.episode.locale))
                    ],
                  );
                },
              ),
              Consumer<HomePageViewModel>(
                builder: (context, homePageViewModel, child) {
                  return CupertinoButton(
                      child: Container(
                          child: Center(
                              child: Text(
                            LocaleKeys.filter.locale,
                            style: AppTextStyles.button12Regular
                                .copyWith(color: AppColors.appWhite),
                          )),
                          width: ScreenSize().getWidthPercent(.9),
                          height: ScreenSize().getWidthPercent(.08),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.appBlue)),
                      onPressed: () {
                        homePageViewModel.filter(null);
                        Navigator.pop(context);
                      });
                },
              )
            ]),
          ),
        );
      },
    );
  }
}
