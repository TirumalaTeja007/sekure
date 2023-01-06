import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_dashboard/widgets/user_profile_info.dart';
import 'package:smartsocket/app/modules/user_profile/controller/user_profile_controller.dart';
import 'package:smartsocket/app/widgets/efi_http_error_message_widget.dart';
import 'package:smartsocket/app/widgets/session_chart_widget.dart';
import 'package:smartsocket/app/modules/user_profile/widgets/user_wallet_balance_widget.dart';
import 'package:smartsocket/utils/responsive.dart';

class UserProfileScreen extends GetView<UserProfileController> {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FutureBuilder(
          future: controller.streamUserInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data!.length != 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileInfo(userData: snapshot.data),
                      buildBody(
                        ResponsiveWidget.isLargeScreen(context)
                            ? screenSize.width > 1304
                                ? "Row"
                                : "Column"
                            : screenSize.width > 1000
                                ? "Row"
                                : "Column",
                        [
                          UserWalletBalanceWidget(() => null, {
                            "type": "INDIVIDUAL",
                            "userName": snapshot.data["userName"]
                          }),
                          SessionChartWidget(
                              controller.refreshSessionsChart, {
                            "type": "INDIVIDUAL",
                            "userName": snapshot.data["userName"]
                          }),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Center(
                      child: EfiHttpErrorMessageWidget("Exception"));
                }
              } else {
                return const Center(child: CupertinoActivityIndicator());
              }
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
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
