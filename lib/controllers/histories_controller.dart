import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../models/histories_model.dart';

class HistoriesController extends GetxController {
  final RxList<HistoriesModel> histories = RxList([]);

  // @override
  // void onInit() {
  //   super.onInit();
  //   loadHistories();
  // }

  Future<void> loadElteHistories() async {
    final data = await rootBundle.loadString("assets/DB/histories/elteHistory.txt");
    final lines = data.split(';');
    // print(data);

    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        final year = parts[0];
        final description = parts[1];
        histories.add(HistoriesModel(year: year, description: description));
      }
    }
  }

  Future<void> loadElteSekHistories() async {
    final data = await rootBundle.loadString("assets/DB/histories/elteSekHistory.txt");
    final lines = data.split(';');
    // print(data);

    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        final year = parts[0];
        final description = parts[1];
        histories.add(HistoriesModel(year: year, description: description));
      }
    }
  }
}
