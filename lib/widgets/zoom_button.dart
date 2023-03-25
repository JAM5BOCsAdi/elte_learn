import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class ZoomButton extends StatelessWidget {
  final IconData icon;
  final void Function() zoom;
  final Color color;
  const ZoomButton({Key? key, required this.zoom, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        minimumSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
      ),
      onPressed: zoom,
      child: Icon(icon),
    );
  }
}
