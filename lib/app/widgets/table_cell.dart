import 'package:flutter/material.dart';
import 'package:smartsocket/constants/color_constants.dart';

double cellWidth = 175;

class CustomTableCell extends StatelessWidget {
  final String value;
  final Color color;
  final String valueType;
  final Function(Map data, String valueType) onTap;
  final int valueIndex;
  final Map rowData;

  const CustomTableCell({
    super.key,
    required this.value,
    required this.color,
    required this.valueType,
    required this.onTap,
    required this.valueIndex,
    required this.rowData,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width < 650 ? 135 : 175,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: kPrimaryTextColor, width: 0.15)),
      height: 60,
      alignment: Alignment.center,
      child: valueIndex == 0 && valueType == "Body"
          ? Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          value ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenSize.width < 650 ? 14 : 16.0,
                            fontFamily: valueType == "Header"
                                ? 'MontserratBold'
                                : 'MontserratRegular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => onTap(rowData, valueType),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            child: const Tooltip(
                              message: "View info",
                              child: Icon(Icons.info, color: kBoxShadowColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          : Text(
              value ?? '',
              style: TextStyle(
                fontSize: screenSize.width < 650 ? 14 : 16.0,
                fontFamily: valueType == "Header"
                    ? 'MontserratBold'
                    : 'MontserratRegular',
              ),
            ),
    );
  }
}
