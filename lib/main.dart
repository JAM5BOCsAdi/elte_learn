import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../bindings/initial_bindings.dart';
import '../controllers/theme_controller.dart';
import '../routes/app_routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      darkTheme: Get.find<ThemeController>().darkTheme,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes(),
    );
  }
}
//TODO: FutureBuilder-be belerakni a "main"-t, hátha úgy egyből frissül a szín