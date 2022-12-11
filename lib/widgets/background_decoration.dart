import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class BackgroundDecorations extends StatelessWidget {
  final Widget child;
  final bool showGradient;
  const BackgroundDecorations({
    Key? key,
    required this.child,
    this.showGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [],
    );
  }
}
