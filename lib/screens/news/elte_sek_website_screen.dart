import 'package:elte_learn/configs/themes/app_light_theme.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/news_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';

class ElteSekWebsiteScreen extends GetView<NewsController> {
  final bool isElteSekWebsite;
  const ElteSekWebsiteScreen({Key? key, this.isElteSekWebsite = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _websiteUrl = "https://sek.elte.hu/";
    MyZoomDrawerController myZoomDrawerController = Get.find();

    final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
      Factory(() => EagerGestureRecognizer()),
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLightLT,
        centerTitle: true,
        title: const AutoSizeText("ELTE SEK Weboldal"),
        leading: isElteSekWebsite
            ? AppCircleButton(
                onTap: Get.back,
                child: Icon(Icons.arrow_back, size: getHeight * 0.035),
              )
            : AppCircleButton(
                // clipBehavior: Clip.none,
                onTap: myZoomDrawerController.toggleDrawer,
                child: Padding(
                  padding: EdgeInsets.only(left: getWidth * 0.05),
                  child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
                ),
              ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.loadWebView(url: _websiteUrl),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return RefreshIndicator(
                onRefresh: () => controller.reload(),
                child: WebViewWidget(
                  gestureRecognizers: gestureRecognizers,
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
