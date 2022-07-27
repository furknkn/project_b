import 'package:flutter/cupertino.dart';
import 'package:project_b/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../../core/_core_exports.dart';
import '../../../../../core/shared_models/film.dart';
import '../../../_feature_exports.dart';

class FavoriteShowSheet {
  final Film film;

  FavoriteShowSheet({required this.film});
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
            height: ScreenSize().getWidthPercent(.6),
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
                  ListTile(
                    title: Text(
                      LocaleKeys.removeFavorit.locale,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      LocaleKeys.yes.locale,
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      homePageViewModel.removeFavorite(film);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      LocaleKeys.no.locale,
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ]);
              },
            ),
          ),
        );
      },
    );
  }
}
