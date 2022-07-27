import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/cards/film_card.dart';
import '../../_feature_exports.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, homePageViewModel, child) {
        return Wrap(
          children: [
            for (var item in homePageViewModel.listFilmFilter)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilmCard(
                    item: item,
                    onPress: () {
                      !item.star
                          ? homePageViewModel.addFavorite(item)
                          : homePageViewModel.removeFavorite(item);
                    }),
              ),
          ],
        );
      },
    );
  }
}
