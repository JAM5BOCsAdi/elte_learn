import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/news_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';

class ElteSekFacebookScreen extends GetView<NewsController> {
  const ElteSekFacebookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _facebookUrl = "https://m.facebook.com/elte.sek";
    MyZoomDrawerController myZoomDrawerController = Get.find();

    final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
      Factory(() => EagerGestureRecognizer()),
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const AutoSizeText("ELTE SEK Facebook"),
        leading: AppCircleButton(
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
          future: controller.loadWebView(url: _facebookUrl),
          builder: (context, snapshot) {
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
