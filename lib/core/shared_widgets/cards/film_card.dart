import '../../_core_exports.dart';
import '../../shared_models/film.dart';

class FilmCard extends StatelessWidget {
  final Film item;
  final Function() onPress;

  const FilmCard({Key? key, required this.item, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize().getWidthPercent(.7),
      width: ScreenSize().getWidthPercent(.4),
      child: Card(
        child: Column(children: [
          Container(
            color: AppColors.appGrey.withOpacity(.4),
            height: ScreenSize().getWidthPercent(.45),
            width: ScreenSize().getWidthPercent(.4),
            child: Image.network(
              item.poster!,
            ),
          ),
          SizedBox(
            height: ScreenSize().getWidthPercent(.02),
          ),
          Text(
            (item.title ?? " - ") + "(" + (item.year ?? " - ") + ")",
            style: AppTextStyles.button11Bold,
            textAlign: TextAlign.center,
          ),
          Text(
            item.type ?? " - ",
            style: AppTextStyles.button11Bold,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: onPress,
              icon: Icon(
                Icons.star,
                color: item.star ? AppColors.darkOrange : AppColors.appGrey,
              ))
        ]),
      ),
    );
  }
}
