import 'package:elte_learn/configs/themes/app_light_theme.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/news_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';

class NewsScreens extends GetView<NewsController> {
  final bool isBackButton;
  final String title;
  final String url;
  final Color backgroundColor;
  const NewsScreens({
    Key? key,
    required this.title,
    required this.url,
    required this.backgroundColor,
    this.isBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyZoomDrawerController myZoomDrawerController = Get.find();

    final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
      Factory(() => EagerGestureRecognizer()),
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: AutoSizeText(title),
        leading: isBackButton
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
          future: controller.loadWebView(url: url),
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
