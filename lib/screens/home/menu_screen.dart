import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.infinity,
      // decoration: BoxDecoration(color: Colors.transparent),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: kOnSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: BackButton(
              //     color: kOnSurfaceTextColor,
              //     onPressed: () {
              //       print("Tapped");
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
