import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/constants/color_constants.dart';

class DateRangeWidget extends StatelessWidget {
  const DateRangeWidget(
      this.startDateRange, this.endDateRange, this.selectedDateRange,
      {Key? key})
      : super(key: key);
  final RxString startDateRange;
  final RxString endDateRange;
  final RxString selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: selectedDateRange.value == dateRangeFiltersList.last
            ? kFilterButtonWidth(context) + 230
            : kFilterButtonWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date Range",
                style: TextStyle(
                    fontFamily: 'MontserratMedium',
                    color: kBgShade,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 12 : 14)),
            const SizedBox(height: 8),
            Row(
              children: [
                Card(
                  elevation: 1,
                  color: kGrey,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    height: 40,
                    width: kFilterButtonWidth(context),
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(selectedDateRange.value,
                              style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: kPrimaryTextColor,
                                  fontSize: ResponsiveWidget.isSmallScreen(
                                          context)
                                      ? 11
                                      : 13)),
                        ),
                        PopupMenuButton(
                          constraints: BoxConstraints.expand(
                              width: kFilterButtonWidth(context),
                              height: dateRangeFiltersList.length * 50),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.green),
                          onSelected: (value) {
                            selectedDateRange.value = value;
                          },
                          offset: Offset(-kFilterButtonWidth(context) + 40, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          itemBuilder: (ctx) {
                            return dateRangeFiltersList.toList().map((element) {
                              return PopupMenuItem(
                                enabled: true,
                                value: element,
                                child: Text(element,
                                    style: TextStyle(
                                        fontFamily: 'MontserratRegular',
                                        color:
                                            selectedDateRange.value != element
                                                ? kPrimaryTextColorShade
                                                : kPrimaryTextColor,
                                        fontSize: ResponsiveWidget.isSmallScreen(
                                            context)
                                            ? 11
                                            : 13)),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                selectedDateRange.value == dateRangeFiltersList.last
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Icon(Icons.arrow_forward_rounded,
                                  color: Colors.black26)),
                          Card(
                            elevation: 1,
                            margin: const EdgeInsets.only(bottom: 15),
                            color: kGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      color: kGrey,
                                      alignment: Alignment.center,
                                      child: Text(
                                          startDateRange.value.isEmpty
                                              ? "Start Date"
                                              : startDateRange.value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'MontserratRegular',
                                              color: kPrimaryTextColor,
                                              fontSize: ResponsiveWidget.isSmallScreen(
                                                  context)
                                                  ? 11
                                                  : 13)),
                                    ),
                                  ),
                                  Text(" To ",
                                      style: TextStyle(
                                          fontFamily: 'MontserratRegular',
                                          color: kPrimaryTextColorShade,
                                          fontSize: ResponsiveWidget.isSmallScreen(
                                              context)
                                              ? 11
                                              : 13)),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      color: kGrey,
                                      alignment: Alignment.center,
                                      child: Text(
                                          endDateRange.value.isEmpty
                                              ? "End Date"
                                              : endDateRange.value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'MontserratRegular',
                                              color: kPrimaryTextColor,
                                              fontSize: ResponsiveWidget.isSmallScreen(
                                                  context)
                                                  ? 11
                                                  : 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
