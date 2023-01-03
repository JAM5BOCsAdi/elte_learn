import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/app_colors.dart';
import '../configs/themes/ui_parameters.dart';

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
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: showGradient ? null : Theme.of(context).primaryColor,
              gradient: showGradient ? mainGradient() : null,
            ),
            child: CustomPaint(painter: BackgroundPainter()),
          ),
        ),
        Positioned(child: child),
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(getWidth * 0.2, 0);
    path.lineTo(0, getHeight * 0.4);
    path.close();

    final path1 = Path();
    path1.moveTo(getWidth, 0);
    path1.lineTo(getWidth * 0.8, 0);
    path1.lineTo(getWidth * 0.2, getHeight);
    path1.lineTo(getWidth, getHeight);
    path1.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
