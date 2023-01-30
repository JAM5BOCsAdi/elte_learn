import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String routeName;
  const DrawerTile({Key? key, required this.title, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        title,
        style: const TextStyle(color: kOnSurfaceTextColor),
      ),
      onTap: () => Get.toNamed(routeName),
    );
  }
}
