import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartsocket/models/chart_data_model.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/constants/color_constants.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget(this.data, this.objKey, {super.key});

  final String data;

  final String objKey;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  int length = 4;

  List<ChartData> chartData = <ChartData>[];

  @override
  void initState() {
    List data = jsonDecode(widget.data)[widget.objKey];
    for (var i in data) {
      i["value"] != 0.0
          ? chartData.add(ChartData(
              i["name"], i["value"], colorIndications[i["color"]], i["radius"]))
          : "";
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 304) < 850
            ? screenSize.width - 440
            : (screenSize.width - 410) * 0.4
        : screenSize.width > 850
            ? (screenSize.width - 60) * 0.465
            : screenSize.width - 30;
    const height = 280.0;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: (width - 50) * 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(chartData[0].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: kPrimaryTextColor,
                      fontFamily: 'MontserratBold')),
              SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 4 : 8),
              Text('${chartData[0].value}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      color: kPrimaryTextColor,
                      fontFamily: 'MontserratRegular')),
            ],
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: showingSections(context, screenSize, 80),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(
      context, Size screenSize, double height) {
    return List.generate(chartData.length - 1, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? height + 10 : height;
      final percentage =
          ((chartData[i + 1].value * 100) ~/ chartData[0].value).toDouble();
      return PieChartSectionData(
        color: chartData[i + 1].color,
        value: percentage,
        title: chartData[i + 1].value.toString(),
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      );
    });
  }
}
