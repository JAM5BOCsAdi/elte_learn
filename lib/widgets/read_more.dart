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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: getWidth * widget.paddingLeft,
            right: getWidth * widget.paddingRight,
            top: getHeight * 0.025,
            bottom: getHeight * 0.025,
          ),
          child: Text(
            widget.sekHistory.description,
            maxLines: _isExpanded ? widget.sekHistory.description.length : widget.maxLines,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: kOnSurfaceTextColor,
              fontSize: 18,
            ),
          ),
        ),
        if (_shouldShowMore)
          Padding(
            padding: EdgeInsets.only(
              left: getWidth * widget.paddingLeft,
              right: getWidth * widget.paddingRight,
              // top: getHeight * 0.025,
              bottom: getHeight * 0.025,
            ),
            child: Align(
              alignment: widget.alignment,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? "Olvass kevesebbet" : "Olvass tovább",
                  style: TextStyle(
                    color: kOnSurfaceTextColor,
                    fontSize: getHeight * 0.0175,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
