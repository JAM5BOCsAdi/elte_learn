// import 'package:elte_learn/controllers/histories_controller.dart';
// import 'package:elte_learn/models/histories_model.dart';
// import 'package:elte_learn/packages_barrel/packages_barrel.dart';

// import '../../configs/themes/app_colors.dart';
// import '../../configs/themes/app_icons.dart';
// import '../../configs/themes/ui_parameters.dart';
// import '../../controllers/zoom_drawer_controller.dart';
// import '../../widgets/app_circle_button.dart';
// import '../../widgets/custom_app_bar.dart';
// import '../../widgets/read_more.dart';

// class ElteSekPtiHistoryScreen extends GetView<MyZoomDrawerController> {
//   const ElteSekPtiHistoryScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Get.put(HistoriesController());
//     final HistoriesController historiesController = Get.find<HistoriesController>();

//     return Scaffold(
//       appBar: CustomAppBar(
//         leftPadding: getWidth * 0.05,
//         title: "ELTE SEK PTI Történelme",
//         appBarHeight: getHeight * 0.02,
//         leading: AppCircleButton(
//           // clipBehavior: Clip.none,
//           onTap: controller.toggleDrawer,
//           child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
//         ),
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(gradient: mainGradient()),
//         padding: EdgeInsets.all(mobileScreenPadding * 0.25),
//         child: SafeArea(
//           child: FutureBuilder(
//             future: historiesController.loadElteSekPtiHistories(),
//             builder: (_, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }

//               return ListView.builder(
//                 itemCount: historiesController.elteSekPtiHistories.length,
//                 itemBuilder: (_, index) {
//                   HistoriesModel history = historiesController.elteSekPtiHistories[index];

//                   return Column(
//                     children: [
//                       _timelineTile(
//                           index: index, historiesLength: historiesController.elteSekPtiHistories.length, history: history),
//                       _timelineDivider(index: index, historiesLength: historiesController.elteSekPtiHistories.length),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// TimelineTile _timelineTile({
//   required int index,
//   required historiesLength,
//   required HistoriesModel history,
// }) {
//   double width = getHeight * 0.06;
//   double height = getHeight * 0.06;

//   if (index.isEven) {
//     return TimelineTile(
//       alignment: TimelineAlign.manual,
//       lineXY: 0.1,
//       isFirst: index == 0,
//       isLast: index == historiesLength - 1,
//       indicatorStyle: IndicatorStyle(
//         width: width,
//         height: height,
//         indicator: _indicator(yearNumber: history.year),
//         drawGap: true,
//       ),
//       beforeLineStyle: LineStyle(
//         color: Colors.lightGreenAccent.withOpacity(0.25),
//         thickness: 3,
//       ),
//       endChild: ReadMore(
//         paddingLeft: 0.025,
//         paddingRight: 0.1,
//         history: history,
//         maxLines: 4,
//         alignment: Alignment.centerLeft,
//       ),
//     );
//   } else {
//     return TimelineTile(
//       alignment: TimelineAlign.manual,
//       lineXY: 0.9,
//       isFirst: index == 0,
//       isLast: index == historiesLength - 1,
//       indicatorStyle: IndicatorStyle(
//         width: width,
//         height: height,
//         indicator: _indicator(yearNumber: history.year),
//         drawGap: true,
//       ),
//       beforeLineStyle: LineStyle(
//         color: Colors.lightGreenAccent.withOpacity(0.25),
//         thickness: 3,
//       ),
//       startChild: ReadMore(
//         paddingLeft: 0.1,
//         paddingRight: 0.025,
//         history: history,
//         maxLines: 4,
//         alignment: Alignment.centerRight,
//       ),
//     );
//   }
// }

// Container _indicator({required String yearNumber}) {
//   return Container(
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: kMainGradientLight,
//       border: Border.fromBorderSide(
//         BorderSide(
//           color: Colors.lightGreen.shade400,
//           width: 2,
//         ),
//       ),
//     ),
//     child: Center(
//       child: AutoSizeText(
//         yearNumber,
//         style: const TextStyle(color: kOnSurfaceTextColor),
//         // style: const TextStyle(fontSize: 30),
//       ),
//     ),
//   );
// }

// TimelineDivider _timelineDivider({required int index, required int historiesLength}) {
//   if (index < historiesLength - 1) {
//     return TimelineDivider(
//       begin: 0.1,
//       end: 0.9,
//       color: Colors.lightGreenAccent.withOpacity(0.25),
//       thickness: 3,
//     );
//   } else {
//     return const TimelineDivider(
//       begin: 0.1,
//       end: 0.9,
//       color: Colors.transparent,
//       thickness: 3,
//     );
//   }
// }
