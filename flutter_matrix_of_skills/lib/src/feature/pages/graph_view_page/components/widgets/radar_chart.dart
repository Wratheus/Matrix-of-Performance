
import 'package:flutter/material.dart';
import 'package:flutter_matrix_of_skills/src/feature/components/sample_style_container.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../core/constants/constants.dart';

// ignore: must_be_immutable
class SampleRadarChart extends StatelessWidget {
  final List<dynamic> data;
  final double angleValue = 0.0;

  const SampleRadarChart({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 650,
      height: 650,
      child: SampleStyleContainer(
          child: RadarChart(
            RadarChartData(
              dataSets: showingDataSets(data),
              radarBackgroundColor: Colors.transparent,
              radarShape: RadarShape.circle,
              radarBorderData: const BorderSide(
                  color: MyColors.mainBeige, width: 2),
              radarTouchData: RadarTouchData(),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle:
              const TextStyle(color: MyColors.mainBeige, fontSize: 14),
              getTitle: (index, angle) {
                final usedAngle = angle + angleValue;
                return RadarChartTitle(
                  text: data[0].keys.elementAt(index),
                  angle: usedAngle,
                );
              },
            ),
          )
      ),
    );
  }

  List<RadarDataSet> showingDataSets(List<dynamic> data) {

    int index = -1;
    return data.map((e) {
      index++;
      return RadarDataSet(
        fillColor: Colors.transparent,
        borderColor: chartColors[index%10],
        entryRadius: 2,
        dataEntries:
        e.values.toList().sublist(2).map<RadarEntry>((value) => RadarEntry(value: value.toDouble())).toList(),
        borderWidth: 3,
      );
    }).toList();
  }
}