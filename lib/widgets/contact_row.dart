import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/custom_text_styles.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/ui_parameters.dart';

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool enabled;
  final VoidCallback? onTap;
  const ContactRow({
    super.key,
    required this.icon,
    required this.text,
    this.enabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kOnSurfaceTextColor, size: getHeight * 0.035),
        Gap(getWidth * 0.05),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: AutoSizeText(
            text,
            style: const TextStyle(
              color: kOnSurfaceTextColor,
              // fontSize: 18.0,
            ),
            minFontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
