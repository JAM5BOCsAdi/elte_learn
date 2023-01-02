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

  // Set the Orientation to portraitUp => No other allowed
  Future<void> setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // Set the SystemUIOverlayStyle [StatusBar and/or NavigationBar]
  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // systemNavigationBarColor: Colors.white, // Colors.black.withOpacity(0.002)
      ),
    );
  }

  // Future<void> setEnabledSystemUIMode() async {
  //   await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // }
}
