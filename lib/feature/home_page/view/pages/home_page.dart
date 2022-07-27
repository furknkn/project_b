import 'package:project_b/core/shared_widgets/general_app_bar.dart';
import 'package:project_b/feature/home_page/_feature_exports.dart';
import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';
import '../widgets/home_page_body.dart';

class HomePagePage extends StatefulWidget {
  const HomePagePage({Key? key}) : super(key: key);

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false).getFavoriteList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GeneralAppBar(isBackArrowShow: true),
      body: HomePageBody(),
    ));
  }
}
