import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/news_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';

class ElteSekWebsiteScreen extends GetView<NewsController> {
  const ElteSekWebsiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _websiteUrl = "https://sek.elte.hu/";
    MyZoomDrawerController myZoomDrawerController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const AutoSizeText("ELTE SEK Weboldal"),
        leading: AppCircleButton(
          // clipBehavior: Clip.none,
          onTap: myZoomDrawerController.toggleDrawer,
          child: Padding(
            padding: EdgeInsets.only(left: getWidth * 0.05),
            child: Icon(AppIcons.menuLeft, size: getHeight * 0.025),
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.loadWebView(url: _websiteUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return RefreshIndicator(
                onRefresh: () => controller.reload(),
                child: WebViewWidget(
                  controller: controller.webViewController,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
