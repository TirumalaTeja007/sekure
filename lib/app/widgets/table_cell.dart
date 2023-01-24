import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';

import '../../utils/responsive.dart';

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
      width: kCellWidth(context),
      alignment: Alignment.center,
      child: value == "Actions" && valueType == "Body"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => onTap(rowData, valueType),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Tooltip(
                      message: "View info",
                      child: Icon(MdiIcons.information,
                          color: Colors.blue,
                          size: ResponsiveWidget.isSmallScreen(context)
                              ? 18
                              : 22),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => onTap(rowData, valueType),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Tooltip(
                      message: "Edit record",
                      child: Icon(MdiIcons.textBoxEdit,
                          color: kGreen,
                          size: ResponsiveWidget.isSmallScreen(context)
                              ? 18
                              : 22),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => onTap(rowData, valueType),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Tooltip(
                      message: "Delete record",
                      child: Icon(MdiIcons.delete,
                          color: kRed,
                          size: ResponsiveWidget.isSmallScreen(context)
                              ? 18
                              : 22),
                    ),
                  ),
                ),
              ],
            )
          : Text(
              value ?? '',
              style: TextStyle(
                  fontSize: ResponsiveWidget.isLargeScreen(
                      context)
                      ? 14
                      : 12,
                  fontFamily: valueType == "Header"
                      ? 'MontserratBold'
                      : 'MontserratRegular',
                  color: valueType == "Header" ? Colors.white : Colors.black),
            ),
    );
  }
}
