import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class AppCircleButton extends StatelessWidget {
  final Widget child;

  final VoidCallback? onTap;
  const AppCircleButton({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
