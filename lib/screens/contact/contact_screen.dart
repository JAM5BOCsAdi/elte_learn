import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.white,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
