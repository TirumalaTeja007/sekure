import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_dashboard/widgets/user_profile_info.dart';
import 'package:smartsocket/app/modules/user_profile/controller/user_profile_controller.dart';
import 'package:smartsocket/app/modules/user_profile/widgets/user_wallet_balance_widget.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/app/widgets/session_chart_widget.dart';
import 'package:smartsocket/models/user_model.dart';
import 'package:smartsocket/utils/responsive.dart';

class UserProfileScreen extends GetView<UserProfileController> {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveWidget.isLargeScreen(context) ? 30.0 : 10.0),
        child: Obx(
          () => controller.fetchUserInfoState.value ==
                  MessageProcessingState.completed
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserProfileInfo(
                        userData: UserData.fromMap(
                            controller.userInfoResponse.value)),
                    Row(
                      children: [
                        SizedBox(
                          width: ResponsiveWidget.isLargeScreen(context)
                              ? screenSize.width - 380
                              : screenSize.width - 30,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 0.0,
                            children: [
                              UserWalletBalanceWidget(controller),
                              SessionChartWidget(
                                  controller.refreshSessionsChart, {
                                "type": "INDIVIDUAL",
                                "userName": controller
                                    .userInfoResponse.value["userName"]
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : controller.fetchUserInfoState.value ==
                      MessageProcessingState.failed
                  ? NoDataWidget(controller.userInfoResponse.value["errorInfo"])
                  : Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.4),
                      child: const CupertinoActivityIndicator(),
                    ),
        ),
      ),
    );
  }

  Widget buildBody(String widgetType, List<Widget> widgetList) {
    return widgetType == 'Row'
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList)
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList);
  }
}
