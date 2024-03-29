import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/histories_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../models/histories_model.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/read_more.dart';

class HistoriesScreen extends GetView<MyZoomDrawerController> {
  final String title;
  final String source;
  final bool leftPadding;
  const HistoriesScreen({Key? key, required this.title, required this.source, this.leftPadding = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoriesController historiesController = Get.find<HistoriesController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        leftPadding: leftPadding == true ? getHeight * 0.05 : 0,
        appBarHeight: getHeight * 0.02,
        leading: AppCircleButton(
          // clipBehavior: Clip.none,
          onTap: controller.toggleDrawer,
          child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        padding: EdgeInsets.all(mobileScreenPadding * 0.25),
        child: SafeArea(
          child: FutureBuilder(
            future: historiesController.loadHistories(source: source),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              int historiesLength = historiesController.histories.length;

              return ListView.builder(
                itemCount: historiesLength,
                itemBuilder: (_, index) {
                  HistoriesModel history = historiesController.histories[index];

                  return Column(
                    children: [
                      _timelineTile(index: index, historiesLength: historiesLength, history: history),
                      _timelineDivider(index: index, historiesLength: historiesLength),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

TimelineTile _timelineTile({
  required int index,
  required historiesLength,
  required HistoriesModel history,
}) {
  double width = getHeight * 0.06;
  double height = getHeight * 0.06;

  if (index.isEven) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: index == 0,
      isLast: index == historiesLength - 1,
      indicatorStyle: IndicatorStyle(
        width: width,
        height: height,
        indicator: _indicator(yearNumber: history.year),
        drawGap: true,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.lightGreenAccent.withOpacity(0.25),
        thickness: 3,
      ),
      endChild: ReadMore(
        paddingLeft: 0.025,
        paddingRight: 0.1,
        history: history,
        maxLines: 4,
        alignment: Alignment.centerLeft,
      ),
    );
  } else {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.9,
      isFirst: index == 0,
      isLast: index == historiesLength - 1,
      indicatorStyle: IndicatorStyle(
        width: width,
        height: height,
        indicator: _indicator(yearNumber: history.year),
        drawGap: true,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.lightGreenAccent.withOpacity(0.25),
        thickness: 3,
      ),
      startChild: ReadMore(
        paddingLeft: 0.1,
        paddingRight: 0.025,
        history: history,
        maxLines: 4,
        alignment: Alignment.centerRight,
      ),
    );
  }
}

Container _indicator({required String yearNumber}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: UIParameters.isDarkMode() ? kMainGradientDark : kMainGradientLight,
      border: Border.fromBorderSide(
        BorderSide(
          color: Colors.lightGreen.shade400,
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

TimelineDivider _timelineDivider({required int index, required int historiesLength}) {
  if (index < historiesLength - 1) {
    return TimelineDivider(
      begin: 0.1,
      end: 0.9,
      color: Colors.lightGreenAccent.withOpacity(0.25),
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
