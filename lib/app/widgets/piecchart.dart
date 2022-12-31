import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/constants/color_constants.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget(this.chartData, {super.key});

  final List chartData;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  int length = 4;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final width = (ResponsiveWidget.isLargeScreen(context) &&
            screenSize.width - 304 < 1000)
        ? screenSize.width - 304
        : screenSize.width < 1000
            ? screenSize.width
            : 500.0;
    final height = ResponsiveWidget.isSmallScreen(context) ? 50.0 : 100.0;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: (height * 3.5 -
                      (ResponsiveWidget.isSmallScreen(context) ? 50 : 60)) *
                  0.5,
              left: (width -
                      (ResponsiveWidget.isSmallScreen(context) ? 110 : 120)) *
                  0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${widget.chartData[0].value}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 18 : 20,
                      color: kPrimaryTextColor,
                      fontFamily: 'MontserratBold')),
              const SizedBox(height: 8),
              Text('${widget.chartData[0].name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 12 : 14,
                      color: kPrimaryTextColor,
                      fontFamily: 'MontserratRegular')),
            ],
          ),
        ),
        SizedBox(
          width: width,
          height: height * 3.5,
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
              centerSpaceRadius:
                  ResponsiveWidget.isSmallScreen(context) ? 40 : 60,
              sections: showingSections(context, screenSize, height),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(
      context, Size screenSize, double height) {
    final List sublist = widget.chartData.sublist(1);
    return List.generate(sublist.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? height + 10 : height;
      final percentage = (sublist[i].value * 100 ~/ widget.chartData[0].value);
      return PieChartSectionData(
        color: sublist[i].color,
        value: percentage,
        title: sublist[i].value.toString(),
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      );
    });
  }
}
