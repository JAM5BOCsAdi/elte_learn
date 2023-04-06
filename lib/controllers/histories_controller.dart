import 'dart:io';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/utils/consts.dart';

import '../models/histories_model.dart';

class HistoriesController extends GetxController {
  final RxList<HistoriesModel> elteHistories = RxList([]);
  final RxList<HistoriesModel> elteSekHistories = RxList([]);
  final RxList<HistoriesModel> elteSekPtiHistories = RxList([]);

  Future<void> loadElteHistories() async {
    elteHistories.clear();
    String data = await rootBundle.loadString(elteHistoryTxt);
    List<String> lines = data.split('§');
    print("loadElteHistories: $data");

    for (var line in lines) {
      List<String> parts = line.split(':').map((e) => e.trim()).toList();
      if (parts.length == 2) {
        String year = parts[0];
        String description = parts[1];
        elteHistories.add(HistoriesModel(year: year, description: description));
      }
    }
  }

  Future<void> loadElteSekHistories() async {
    elteSekHistories.clear();
    String data = await rootBundle.loadString(elteSekHistoryTxt);
    List<String> lines = data.split('§');
    print("loadElteSekHistories: $data");

    for (var line in lines) {
      List<String> parts = line.split(':').map((e) => e.trim()).toList();
      if (parts.length == 2) {
        String year = parts[0];
        String description = parts[1];
        elteSekHistories.add(HistoriesModel(year: year, description: description));
      }
    }
  }

  Future<void> loadElteSekPtiHistories() async {
    elteSekPtiHistories.clear();
    String data = await rootBundle.loadString(elteSekPtiHistoryTxt);
    List<String> lines = data.split('§');
    print("loadElteSekPtiHistories: $data");

    for (var line in lines) {
      List<String> parts = line.split(':').map((e) => e.trim()).toList();
      if (parts.length == 2) {
        String year = parts[0];
        String description = parts[1];
        elteSekPtiHistories.add(HistoriesModel(year: year, description: description));
      }
    }
  }
}
