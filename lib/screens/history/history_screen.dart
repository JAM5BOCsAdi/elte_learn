import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../controllers/history_controller.dart';
import '../../utils/const/elte_sek_history.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: SafeArea(
          child: ListView.builder(
            itemCount: elteSekHistory.length,
            itemBuilder: (_, index) {
              return Container(
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}







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
