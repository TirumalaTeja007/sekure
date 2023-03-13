import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sekure/constants/color_constants.dart';
import 'package:sekure/constants/constants.dart';
import 'package:sekure/services/app_state_service.dart';
import 'package:sekure/utils/responsive.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {required this.items,
      required this.dropDownValue,
      required this.fieldType,
      Key? key,
      required this.width,
      required this.height})
      : super(key: key);

  final List items;

  final RxString dropDownValue;

  final String fieldType;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldType,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'MontserratMedium',
                  color: kBgShade,
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 14 : 12)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton2(
                    isExpanded: true,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 14 : 12,
                                    color: item == dropDownValue.value
                                        ? Colors.black
                                        : Colors.black38),
                              ),
                            ))
                        .toList(),
                    value: dropDownValue.value,
                    onChanged: (value) {
                      if (value != items[0]) {
                        dropDownValue.value = value as String;
                      }
                    },
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    iconSize: 24,
                    buttonHeight: height,
                    buttonWidth: width - 20,
                    buttonPadding: EdgeInsets.zero,
                    buttonDecoration: const BoxDecoration(color: Colors.white),
                    itemHeight: 50,
                    itemPadding: const EdgeInsets.only(left: 10, right: 10),
                    dropdownMaxHeight: 4.0 * height,
                    dropdownWidth: width - 20,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-5, 0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
