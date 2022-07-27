import 'package:flutter/cupertino.dart';
import 'package:project_b/feature/home_page/_feature_exports.dart';
import 'package:project_b/feature/home_page/view/widgets/shoowsheet/favorite_showsheet.dart';
import 'package:project_b/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/cards/film_card.dart';
import '../../../../core/shared_widgets/input_fields/customTextField.dart';
import '../../../../core/utility/validator/validator.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: ScreenSize().getWidthPercent(.1),
          ),
          Consumer<HomePageViewModel>(
              builder: (context, homePageViewModel, child) => SizedBox(
                    width: ScreenSize().getWidthPercent(.9),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: CustomTextFormField(
                        hintText: LocaleKeys.search.locale,
                        textEditingController:
                            homePageViewModel.txtSearchController,
                        validator: (final value) {
                          return Validator().validatorNullCheck(value ?? "");
                        },
                        focusNode: homePageViewModel.searchFocusNode,
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                  )),
          SizedBox(
            width: double.infinity,
            height: ScreenSize().getWidthPercent(.1),
            child: Consumer<HomePageViewModel>(
              builder: (context, homePageViewModel, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homePageViewModel.search.listSearch.length,
                itemBuilder: (context, index) {
                  return Chip(
                      label: Text(homePageViewModel.search.listSearch[index]));
                },
              ),
            ),
          ),
          CupertinoButton(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.appBlue),
                  child: Center(
                    child: Text(
                      LocaleKeys.search.locale,
                      style: AppTextStyles.button16Bold.copyWith(
                        color: AppColors.appWhite,
                      ),
                    ),
                  ),
                  width: ScreenSize().getWidthPercent(.4),
                  height: ScreenSize().getWidthPercent(.1)),
              onPressed: () {
                Provider.of<HomePageViewModel>(context, listen: false)
                    .fetchFilmList();
              }),
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<HomePageViewModel>(
                builder: (context, homePageViewModel, child) {
                  return Wrap(
                    children: [
                      for (var item in homePageViewModel.listFavoriteFilm)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilmCard(
                              item: item,
                              onPress: () {
                                FavoriteShowSheet(film: item)
                                    .bottomShowSheet(context);
                              }),
                        ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
