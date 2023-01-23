import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/local_storage.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import 'package:smartsocket/app/widgets/table_cell.dart';

import '../../constants/color_constants.dart';

class TableBody extends StatefulWidget {
  final ScrollController scrollController;
  final RxList cells;
  final Function() refresh;
  final String searchedKeyword;
  final String infoType;

  const TableBody(
      {super.key,
      required this.scrollController,
      required this.cells,
      required this.refresh,
      required this.searchedKeyword,
      required this.infoType});

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _bodyController;
  final ScrollController controller = ScrollController();
  final idRepo = IdRepository();

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List headerKeys = widget.cells[0].keys.toList();
    List data = widget.cells.sublist(1);
    double cellWidth = screenSize.width < 650 ? 135 : 175;
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0 || notification.depth == 1;
      },
      onRefresh: () async {
        widget.refresh();
        await Future.delayed(const Duration(seconds: 2));
      },
      child: widget.cells.isNotEmpty
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: cellWidth * 0.5),
              width: screenSize.width,
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                controller: controller,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: true),
                  child: SingleChildScrollView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: headerKeys.length * cellWidth,
                                  color: kBgShade,
                                  child: ListView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(
                                            parent: ClampingScrollPhysics()),
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                        widget.cells[0].values.toList().length,
                                        (index) {
                                      return CustomTableCell(
                                          color: kPrimaryTextColor,
                                          value: widget.cells[0].values
                                              .toList()[index],
                                          valueType: "Header",
                                          valueIndex: index,
                                          rowData: widget.cells[0],
                                          onTap: viewData);
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: headerKeys.length * cellWidth,
                              child: ListView(
                                physics: const AlwaysScrollableScrollPhysics(
                                    parent: ClampingScrollPhysics()),
                                children: List.generate(data.length, (y) {
                                  final found = _searchForKeyword(data, y);
                                  return found == true
                                      ? Container(
                                    color: y.isEven
                                        ? Colors.white
                                        : kGrey,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                                headerKeys.length, (x) {
                                              return CustomTableCell(
                                                  value: headerKeys[x] ==
                                                          "actions"
                                                      ? "Actions"
                                                      : _getData(
                                                          data, headerKeys, y, x),
                                                  color: Colors.white,
                                                  valueType: "Body",
                                                  valueIndex: x,
                                                  rowData: data[y],
                                                  onTap: viewData);
                                            }),
                                          ),
                                      )
                                      : const SizedBox.shrink();
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const NoDataWidget("No data"),
    );
  }

  viewData(Map data, String valueType) {
    if (valueType == "Body") {
      switch (widget.infoType) {
        case "EndUsersManagement":
          data["userType"] = "User";
          idRepo.saveArguments('userInfoArgs', jsonEncode(data));
          Get.toNamed(Routes.userDashboard);
          break;
        case "ChargersReports":
          break;
        case "TariffManagement":
          break;
        case "TicketsManagement":
          break;
        case "SessionManagement":
          idRepo.saveArguments('sessionInfoArgs', jsonEncode(data));
          Get.toNamed(Routes.sessionInformation);
          break;
      }
    }
  }

  _searchForKeyword(List data, int y) {
    List values = data[y].values.toList();
    bool found = false;
    if (widget.searchedKeyword.isNotEmpty) {
      for (var element in values) {
        if (element.toString().contains(widget.searchedKeyword)) {
          found = true;
        }
      }
    } else {
      found = true;
    }
    return found;
  }

  _getData(List data, List headerKeys, int y, int x) {
    if (headerKeys[x].toString().contains("Time") &&
        data[y][headerKeys[x]].toString() != "null") {
      return DateFormat("dd MMM yyyy, HH:mm:ss")
          .format(DateTime.parse(data[y][headerKeys[x]].toString()));
    } else if (data[y][headerKeys[x]].runtimeType == double) {
      return data[y][headerKeys[x]].toStringAsFixed(2);
    } else {
      return data[y][headerKeys[x]].toString();
    }
  }
}
