import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../models/histories_model.dart';

class HistoriesController extends GetxController {
  final RxList<HistoriesModel> histories = RxList([]);

  Future<void> loadHistories({required String source}) async {
    histories.clear();
    String data = await rootBundle.loadString(source);
    List<String> lines = data.split('§');

    for (var line in lines) {
      List<String> parts = line.split(':').map((e) => e.trim()).toList();
      if (parts.length == 2) {
        String year = parts[0];
        String description = parts[1];
        histories.add(HistoriesModel(year: year, description: description));
      }
    }
  }
}
