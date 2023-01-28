import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => LineChartWidgetState();
}

class LineChartWidgetState extends State<LineChartWidget> {
  bool showAvg = false;
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 304) < 850
            ? screenSize.width - 379
            : (screenSize.width - 394) * 0.6
        : screenSize.width > 850
            ? (screenSize.width - 60) * 0.5
            : screenSize.width - 30;
    return SizedBox(
      width: width,
      height: 500,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.only(top: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              tileColor: kGrey,
              dense: true,
              leading: Text(
                "Transactions",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: kPrimaryTextColor,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 18 : 20),
              ),
              trailing: SizedBox(
                width: 180,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: kPrimaryTextColorShade)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text(
                            "2022 ",
                            style: TextStyle(
                              color: kPrimaryTextColorShade,
                              fontFamily: 'MontserratRegular',
                              fontSize: 14,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down_outlined, size: 24)
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            showAvg = !showAvg;
                          });
                        },
                        icon: const Icon(Icons.refresh)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 37),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 6),
                child: LineChart(mainData(context)),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: kPrimaryTextColor,
      fontFamily: 'MontserratBold',
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 1:
        text = const Text('Feb', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 3:
        text = const Text('Apr', style: style);
        break;
      case 4:
        text = const Text('May', style: style);
        break;
      case 5:
        text = const Text('Jun', style: style);
        break;
      case 6:
        text = const Text('Jul', style: style);
        break;
      case 7:
        text = const Text('Aug', style: style);
        break;
      case 8:
        text = const Text('Sept', style: style);
        break;
      case 9:
        text = const Text('Oct', style: style);
        break;
      case 10:
        text = const Text('Nov', style: style);
        break;
      case 11:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: kPrimaryTextColor,
      fontFamily: 'MontserratRegular',
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0K';
        break;
      case 2:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 4:
        text = '50k';
        break;
      case 5:
        text = '70k';
        break;
      case 6:
        text = '90k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(context) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
              color: kPrimaryTextColorShade,
              strokeWidth: 1,
              dashArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: kPrimaryTextColor),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1),
            FlSpot(1, 2),
            FlSpot(2, 2.5),
            FlSpot(3, 4),
            FlSpot(4, 4.25),
            FlSpot(5, 3.85),
            FlSpot(6, 4.75),
            FlSpot(7, 6),
            FlSpot(8, 5.25),
            FlSpot(9, 5.1),
            FlSpot(10, 4.75),
            FlSpot(11, 4.85),
          ],
          isCurved: false,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
