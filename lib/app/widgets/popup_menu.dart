import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sekure/constants/constants.dart';
import 'package:sekure/utils/debouncer.dart';
import 'package:sekure/utils/responsive.dart';
import 'package:sekure/constants/color_constants.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget(this.itemsList, this.selectedItem, this.title,
      {Key? key})
      : super(key: key);
  final List itemsList;
  final String title;
  final RxString selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kFilterButtonWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: 'MontserratMedium',
                  color: kBgShade,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 14)),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            color: kGrey,
            margin: const EdgeInsets.only(bottom: 15, right: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              height: 40,
              width: kFilterButtonWidth(context),
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Expanded(
                      child: Text(selectedItem.value,
                          style: TextStyle(
                              fontFamily: 'MontserratRegular',
                              color: kPrimaryTextColor,
                              fontSize: ResponsiveWidget.isSmallScreen(
                                  context)
                                  ? 11
                                  : 13)),
                    ),
                  ),
                  PopupMenuButton(
                    constraints: BoxConstraints.expand(
                        width: kFilterButtonWidth(context),
                        height: itemsList.length * 50),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                    onSelected: (value) {
                      selectedItem.value = value as String;
                    },
                    offset: Offset(-kFilterButtonWidth(context) + 40, 50),
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
                                    fontSize: ResponsiveWidget.isSmallScreen(
                                        context)
                                        ? 11
                                        : 13)),
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
      ),
    );
  }
}
