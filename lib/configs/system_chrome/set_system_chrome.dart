import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class SetSystemChrome extends GetxController {
  @override
  void onInit() {
    setSystemChrome();
    super.onInit();
  }

  Future<void> setSystemChrome() async {
    setPreferredOrientations();
    setSystemUIOverlayStyle();
    // setEnabledSystemUIMode();
  }

  Future<void> setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
}
