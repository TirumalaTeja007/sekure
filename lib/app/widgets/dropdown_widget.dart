import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/services/app_state_service.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {required this.items,
      required this.dropDownValue,
      required this.fieldType,
      Key? key})
      : super(key: key);

  final List items;

  final RxString dropDownValue;

  final String fieldType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                                    fontSize: 16,
                                    color: item == dropDownValue.value
                                        ? Colors.black
                                        : Colors.black38),
                              ),
                            ))
                        .toList(),
                    value: dropDownValue.value,
                    onChanged: (value) {
                      if(value != items[0]) {
                        dropDownValue.value = value as String;
                      }
                    },
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    iconSize: 24,
                    buttonHeight: 50,
                    buttonWidth: kTextFieldWidth(context) - 20,
                    buttonPadding: EdgeInsets.zero,
                    buttonDecoration: const BoxDecoration(color: Colors.white),
                    itemHeight: 50,
                    itemPadding: const EdgeInsets.only(left: 10, right: 10),
                    dropdownMaxHeight: 4.0 * 50,
                    dropdownWidth: kTextFieldWidth(context) - 20,
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