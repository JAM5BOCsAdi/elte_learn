import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class AppCircleButton extends StatelessWidget {
  final Widget child;
  final Color? colour;
  final double width;
  final VoidCallback? onTap;
  const AppCircleButton({Key? key, required this.child, this.colour, this.width = 60.0, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
