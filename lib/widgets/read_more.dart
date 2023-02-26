import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/app_colors.dart';
import '../configs/themes/ui_parameters.dart';
import '../models/event_model.dart';

// ReadMore
class ReadMore extends StatefulWidget {
  final Event sekHistory;
  final double paddingLeft;
  final double paddingRight;
  final int maxLines;
  final AlignmentGeometry alignment;
  const ReadMore({
    Key? key,
    required this.sekHistory,
    required this.paddingLeft,
    required this.paddingRight,
    required this.maxLines,
    required this.alignment,
  }) : super(key: key);

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool _isExpanded = false;
  bool _shouldShowMore = false;

  @override
  void initState() {
    super.initState();
    _shouldShowMore = _checkIfShouldShowMore();
  }

  bool _checkIfShouldShowMore() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.sekHistory.description,
        style: const TextStyle(
          color: kOnSurfaceTextColor,
          fontSize: 18,
        ),
      ),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: getWidth * (1 - widget.paddingLeft - widget.paddingRight));

    return textPainter.didExceedMaxLines;
  }

  Widget detector() {
    if (_shouldShowMore) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
            // print("Tapped");
          });
        },
        child: Text(
          widget.sekHistory.description,
          maxLines: _isExpanded ? widget.sekHistory.description.length : widget.maxLines,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kOnSurfaceTextColor,
            fontSize: 18,
          ),
        ),
      );
    } else {
      return Text(
        widget.sekHistory.description,
        maxLines: widget.sekHistory.description.length,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: kOnSurfaceTextColor,
          fontSize: 18,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth * widget.paddingLeft,
        right: getWidth * widget.paddingRight,
        top: getHeight * 0.025,
        bottom: getHeight * 0.025,
      ),
      child: detector(),
    );
  }
}
