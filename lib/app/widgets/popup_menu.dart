import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/constants/color_constants.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget(this.itemsList, this.selectedItem, this.title,
      {Key? key})
      : super(key: key);
  final List itemsList;
  final String title;
  final RxString selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontFamily: 'MontserratMedium',
                color: kBgShade,
                fontSize: ResponsiveWidget.isLargeScreen(
                    context)
                    ? 14
                    : 12)),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 15, right: 25),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            height: 45,
            width: kFilterButtonWidth(context),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(selectedItem.value,
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: kPrimaryTextColor,
                          fontSize: ResponsiveWidget.isLargeScreen(
                              context)
                              ? 14
                              : 12)),
                ),
                PopupMenuButton(
                  constraints: BoxConstraints.expand(
                      width: kFilterButtonWidth(context),
                      height: itemsList.length * 50),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                  onSelected: (value) {
                    selectedItem.value = value as String;
                  },
                  offset: Offset(-kFilterButtonWidth(context) * 0.75, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  itemBuilder: (ctx) {
                    return itemsList.toList().map((element) {
                      return PopupMenuItem(
                        enabled: true,
                        value: element,
                        child: Obx(
                          () => Text(element,
                              style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: selectedItem.value != element
                                      ? kPrimaryTextColorShade
                                      : kPrimaryTextColor,
                                  fontSize:
                                  ResponsiveWidget.isLargeScreen(
                                      context)
                                      ? 14
                                      : 12)),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
