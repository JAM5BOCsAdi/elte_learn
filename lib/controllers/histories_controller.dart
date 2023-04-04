import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/utils/consts.dart';

import '../models/histories_model.dart';

class HistoriesController extends GetxController {
  final RxList<HistoriesModel> elteHistories = RxList([]);
  final RxList<HistoriesModel> elteSekHistories = RxList([]);
  final RxList<HistoriesModel> elteSekPtiHistories = RxList([]);
  // @override
  // void onInit() {
  //   super.onInit();
  //   loadHistories();
  // }

  Future<void> loadElteHistories() async {
    final data = await rootBundle.loadString(elteHistoryTxt);
    final lines = data.split('\n');
    print("loadElteHistories: $data");

    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        final year = parts[0];
        final description = parts[1];
        elteHistories.add(HistoriesModel(year: year, description: description));
      }
    }
  }

  Future<void> loadElteSekHistories() async {
    final data = await rootBundle.loadString(elteSekHistoryTxt);
    final lines = data.split('\n');
    print("loadElteSekHistories: $data");

    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        final year = parts[0];
        final description = parts[1];
        elteSekHistories.add(HistoriesModel(year: year, description: description));
      }
    }
  }

  Future<void> loadElteSekPtiHistories() async {
    final data = await rootBundle.loadString(elteSekPtiHistoryTxt);
    final lines = data.split('\n');
    print("loadElteSekPtiHistories: $data");

    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        final year = parts[0];
        final description = parts[1];
        elteSekPtiHistories.add(HistoriesModel(year: year, description: description));
      }
    }
  }
}
