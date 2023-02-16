import 'package:auto_size_text/auto_size_text.dart';
import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/sources/histories/elte_history.dart';
import 'package:elte_learn/sources/histories/elte_sek_history.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../models/event_model.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                const Text(
                  'ELTE SEK Története',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: elteSekHistory.length,
                    itemBuilder: (_, index) {
                      final example = elteSekHistory[index];

                      return Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: true,
                              indicatorStyle: const IndicatorStyle(
                                width: 20,
                                color: Colors.purple,
                              ),
                              beforeLineStyle: const LineStyle(
                                color: Colors.purple,
                                thickness: 6,
                              ),
                            ),
                            const TimelineDivider(
                              begin: 0.1,
                              end: 0.9,
                              thickness: 6,
                              color: Colors.purple,
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.9,
                              beforeLineStyle: const LineStyle(
                                color: Colors.purple,
                                thickness: 6,
                              ),
                              afterLineStyle: const LineStyle(
                                color: Colors.deepOrange,
                                thickness: 6,
                              ),
                              indicatorStyle: const IndicatorStyle(
                                width: 20,
                                color: Colors.cyan,
                              ),
                            ),
                            const TimelineDivider(
                              begin: 0.1,
                              end: 0.9,
                              thickness: 6,
                              color: Colors.deepOrange,
                            ),
                            TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isLast: true,
                              beforeLineStyle: const LineStyle(
                                color: Colors.deepOrange,
                                thickness: 6,
                              ),
                              indicatorStyle: const IndicatorStyle(
                                width: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: AutoSizeText(
          number,
          style: const TextStyle(fontSize: 30, color: kOnSurfaceTextColor),
        ),
      ),
    );
  }
}
