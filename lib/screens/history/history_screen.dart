import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../configs/themes/app_colors.dart';
import '../../models/event_model.dart';
import '../../sources/histories/elte_sek_history.dart';
import '../../widgets/custom_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Event sekHistory = elteSekHistory[0];
    return Scaffold(
      appBar: CustomAppBar(title: sekHistory.title ?? "Nincs Címe", appBarHeight: getHeight * 0.02),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        padding: EdgeInsets.all(mobileScreenPadding * 0.25),
        child: SafeArea(
          child: ListView.builder(
            itemCount: elteSekHistory.length,
            itemBuilder: (_, index) {
              sekHistory = elteSekHistory[index];

              return Column(
                children: [
                  _timelineTile(sekHistory: sekHistory, index: index),
                  _timelineDivider(index: index),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

TimelineTile _timelineTile({
  required Event sekHistory,
  required int index,
}) {
  if (index.isEven) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: index == 0,
      isLast: index == elteSekHistory.length - 1,
      indicatorStyle: IndicatorStyle(
        width: 40,
        height: 40,
        indicator: _indicator(yearNumber: sekHistory.year),
        drawGap: true,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.white.withOpacity(0.2),
        thickness: 3,
      ),
      endChild: _gestureDetector(
        sekHistory: sekHistory,
        paddingLeft: 0.025,
        paddingRight: 0.1,
      ),
    );
  } else {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.9,
      isFirst: index == 0,
      isLast: index == elteSekHistory.length - 1,
      indicatorStyle: IndicatorStyle(
        width: 40,
        height: 40,
        indicator: _indicator(yearNumber: sekHistory.year),
        drawGap: true,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.white.withOpacity(0.2),
        thickness: 3,
      ),
      startChild: _gestureDetector(
        sekHistory: sekHistory,
        paddingLeft: 0.1,
        paddingRight: 0.025,
      ),
    );
  }
}

Container _indicator({required String yearNumber}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.fromBorderSide(
        BorderSide(
          color: Colors.white.withOpacity(0.2),
          width: 2,
        ),
      ),
    ),
    child: Center(
      child: AutoSizeText(
        yearNumber,
        style: const TextStyle(color: kOnSurfaceTextColor),
        // style: const TextStyle(fontSize: 30),
      ),
    ),
  );
}

GestureDetector _gestureDetector({
  required Event sekHistory,
  required double paddingLeft,
  required double paddingRight,
}) {
  return GestureDetector(
    onTap: () => print("Tapped: ${sekHistory.year}"),
    child: Padding(
      padding: EdgeInsets.only(
        left: getWidth * paddingLeft,
        right: getWidth * paddingRight,
        top: getHeight * 0.025,
        bottom: getHeight * 0.025,
      ),
      child: Text(
        sekHistory.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: const TextStyle(
          color: kOnSurfaceTextColor,
          fontSize: 18,
        ),
      ),
    ),
  );
}

TimelineDivider _timelineDivider({required int index}) {
  if (index < elteSekHistory.length - 1) {
    return const TimelineDivider(
      begin: 0.1,
      end: 0.9,
      color: Colors.blue,
      thickness: 3,
    );
  } else {
    return const TimelineDivider(
      begin: 0.1,
      end: 0.9,
      color: Colors.transparent,
      thickness: 3,
    );
  }
}
