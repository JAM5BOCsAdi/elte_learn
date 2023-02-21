import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../configs/themes/app_colors.dart';
import '../../sources/histories/elte_sek_history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> appBarTitles = [
      {
        'elte_title': 'ELTE történelme',
        'elte_sek_title': 'ELTE SEK történelme',
        'elte_sek_pti_title': 'ELTE SEK PTI történelme',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("null"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: getHeight * 0.025),
          onPressed: () => Get.back(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        padding: EdgeInsets.all(mobileScreenPadding * 0.25),
        child: SafeArea(
          child: ListView.builder(
            itemCount: elteSekHistory.length,
            itemBuilder: (_, index) {
              final sekHistory = elteSekHistory[index];

              return Column(
                children: [
                  if (index.isOdd)
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.9,
                      isFirst: index == 0,
                      isLast: index == elteSekHistory.length - 1,
                      indicatorStyle: IndicatorStyle(
                        width: 40,
                        height: 40,
                        indicator: _Indicator(yearNumber: sekHistory.year),
                        drawGap: true,
                      ),
                      beforeLineStyle: LineStyle(
                        color: Colors.white.withOpacity(0.2),
                        thickness: 3,
                      ),
                      startChild: GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getWidth * 0.1,
                            right: getWidth * 0.025,
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
                      ),
                    ),
                  if (index.isEven)
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.1,
                      isFirst: index == 0,
                      isLast: index == elteSekHistory.length - 1,
                      indicatorStyle: IndicatorStyle(
                        width: 40,
                        height: 40,
                        indicator: _Indicator(yearNumber: sekHistory.year),
                        drawGap: true,
                      ),
                      beforeLineStyle: LineStyle(
                        color: Colors.white.withOpacity(0.2),
                        thickness: 3,
                      ),
                      endChild: GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getWidth * 0.025,
                            right: getWidth * 0.1,
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
                      ),
                    ),
                  if (index < elteSekHistory.length - 1)
                    const TimelineDivider(
                      begin: 0.1,
                      end: 0.9,
                      color: Colors.blue,
                      thickness: 3,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final String yearNumber;
  const _Indicator({Key? key, required this.yearNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

//
//     GetBuilder<HistoryController>(
//       builder: (_) {
//         return ListView.builder(
//           itemCount: elteSekHistory.length,
//           itemBuilder: (_, index) {
//             Map<String, String> event = elteSekHistory[index];
//             bool isFirst = index % 2 == 0;

//             return TimelineTile(
//               isFirst: isFirst,
//               indicatorStyle: IndicatorStyle(
//                 width: 50,
//                 height: 50,
//                 indicator: _buildYear(event['year']!),
//                 drawGap: true,
//               ),
//               beforeLineStyle: const LineStyle(
//                 color: Colors.grey,
//                 thickness: 1.5,
//               ),
//               afterLineStyle: const LineStyle(
//                 color: Colors.grey,
//                 thickness: 1.5,
//               ),
//               alignment: isFirst ? TimelineAlign.start : TimelineAlign.end,
//               endChild: _buildDescription(event['description']!),
//             );
//           },
//         );
//       },
//     );
//   }

//   Container _buildYear(String year) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Center(
//         child: Text(
//           year,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Padding _buildDescription(String description) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Text(
//         description,
//         style: const TextStyle(
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
// }
