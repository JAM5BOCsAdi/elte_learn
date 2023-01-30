import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'drawer_tile.dart';

class ExpandableDrawerTile extends StatelessWidget {
  final String title;
  final List<DrawerTile> children;
  const ExpandableDrawerTile({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: kOnSurfaceTextColor,
      collapsedIconColor: kOnSurfaceTextColor,
      title: AutoSizeText(title, style: const TextStyle(color: kOnSurfaceTextColor)),
      children: children.map((e) => e).toList(),
    );
  }
}
