import 'package:flutter/material.dart';
import 'package:smartsocket/constants/color_constants.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget(this.data, {Key? key}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/no_data.png", height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
                data.runtimeType != String || data == "No data"
                    ? "No data available"
                    : data.contains("Exception")
                    ? data
                    : "Error",
                style: const TextStyle(
                    fontSize: 16,
                    color: kPrimaryTextColor,
                    fontFamily: 'MontserratBold')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  data.runtimeType != String || data == "No data"
                      ? "No records are found for the requested action. Try changing the "
                      "filters or create some data."
                      : data == "SocketException"
                      ? "We apologize for the inconvenience. A connection attempt failed while"
                  "trying to process your request. OS Error: Connection refused."
                      : data == "TimeoutException"
                      ? "We apologize for the inconvenience. The connection has timed out i.e.,"
                      " the server is taking too long to respond."
                      "\nPlease try again in a few moments."
                      : "We apologize for the inconvenience. We are unable to perform the"
                  "requested action at this moment.",
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
