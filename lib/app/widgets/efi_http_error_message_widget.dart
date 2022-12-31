import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/constants/color_constants.dart';

class EfiHttpErrorMessageWidget extends StatelessWidget {
  const EfiHttpErrorMessageWidget(this.data, {Key? key}) : super(key: key);
  final dynamic data;

  getLabel1() {
    return data.runtimeType != String
        ? "No data available"
        : data.contains("Exception")
            ? data
            : "Error";
  }

  getLabel2() {
    // if (dynamicController.networkStatus.value == EfiNetworkStatus.offline) {
    //   return "No Internet. \nPlease make sure you are online and you have good internet connection.";
    // } else
    if ((data.runtimeType != String) || data == "No data") {
      return "No records are found for the requested action. Try changing the "
          "filters or create some data.";
    } else if (data == "SocketException") {
      return "We apologize for the inconvenience. A connection attempt failed while "
          "trying to process your request. OS Error: Connection refused.";
    } else if (data == "TimeoutException") {
      return "We apologize for the inconvenience. The connection has timed out i.e.,"
          " the server is taking too long to respond."
          "\nPlease try again in a few moments.";
    } else {
      return "We apologize for the inconvenience. We are unable to perform the "
          "requested action at this moment.";
    }
  }

  getIcon(Size screenSize) {
    return
        // dynamicController.networkStatus.value == EfiNetworkStatus.offline
        //   ? Icon(MdiIcons.wifiAlert, size: height * 0.125)
        //   :
        data.runtimeType != String
            ? Image.asset("assets/images/no_data.png",
                height: screenSize.height * 0.125)
            : Icon(MdiIcons.alertOctagonOutline,
                size: screenSize.height * 0.125);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.025,
          horizontal: screenSize.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(screenSize),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(getLabel1(),
                style: const TextStyle(
                    fontSize: 16,
                    color: kPrimaryTextColor,
                    fontFamily: 'MontserratBold')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(getLabel2(),
                  style: const TextStyle(
                      fontSize: 14,
                      color: kPrimaryTextColorShade,
                      fontFamily: 'MontserratRegular')),
            ],
          )
        ],
      ),
    );
  }
}
