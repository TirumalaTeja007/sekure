import 'package:flutter/material.dart';
import 'package:smartsocket/constants/color_constants.dart';

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
      alignment: Alignment.center,
      child: value == "Actions" && valueType == "Body"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                InkWell(
                  onTap: () => onTap(rowData, valueType),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Tooltip(
                      message: "Edit record",
                      child: Icon(Icons.edit_note_rounded, color: kGreen),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => onTap(rowData, valueType),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Tooltip(
                      message: "Delete record",
                      child: Icon(Icons.delete, color: kRed),
                    ),
                  ),
                ),
              ],
            )
          : Text(
              value ?? '',
              style: TextStyle(
                  fontSize: screenSize.width < 650 ? 14 : 16.0,
                  fontFamily: valueType == "Header"
                      ? 'MontserratBold'
                      : 'MontserratRegular',
                  color: valueType == "Header" ? Colors.white : Colors.black),
            ),
    );
  }
}
