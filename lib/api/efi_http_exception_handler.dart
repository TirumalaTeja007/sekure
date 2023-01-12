import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../app/widgets/efi_alert_dialog.dart';

httpException(dynamic errorMessage) {
  String content = errorMessage.status.isNotFound
      ? "No records are found for the requested action."
      : errorMessage.status.connectionError
          ? "We apologize for the inconvenience. A connection attempt failed while"
              "trying to process your request. OS Error: Connection refused."
          : errorMessage.status.isServerError
              ? "We apologize for the inconvenience. The connection has timed out i.e.,"
                  " the server is taking too long to respond."
                  "\nPlease try again in a few moments."
              : "We are unable to perform the requested action at this moment.";
  callAlertDialog(
      "Exception",
      "$content \n(Message: ${errorMessage.body["message"]})",
      "HTTP ERROR");
}

socketException(String routeID, SocketException error) {
  callAlertDialog(
      "Socket Exception",
      "We apologize for the inconvenience. A connection attempt failed while "
          "trying to process your request. OS Error: Connection refused.",
      "");
}

timeoutException(String routeID, TimeoutException error) {
  callAlertDialog(
      "Timeout Exception",
      "We apologize for the inconvenience. The connection has timed out i.e.,"
          " the server is taking too long to respond."
          "\nPlease try again in a few moments.",
      "");
}

unhandledException(String routeID, Exception error) {
  //Get.closeAllSnackbars();
  callAlertDialog(
      "Socket Exception",
      "We apologize for the inconvenience. A connection attempt failed while "
          "trying to process your request. OS Error: Connection refused - bad address.",
      "");
}

void httpErrorResponses(resp) {
  // dynamicController.dismissProgressDialog();
  //Get.closeAllSnackbars();
  final response = jsonDecode(resp.body);
  switch (resp.statusCode) {
    case 400:
      callAlertDialog(
          "Bad request",
          "We have encountered an error and cannot process your request at"
              " this point of time."
              "\n(Message: ${response["message"]})",
          "HTTP ERROR 400");
      break;
    case 401:
      callAlertDialog(
          "Unauthorized",
          "There was an error processing your request as "
              "you are not authorized for the selected action. "
              "\n(Message: ${response["message"]})",
          "HTTP ERROR 401");
      break;
    case 403:
      callAlertDialog(
          "Forbidden",
          "There was an error processing your request. "
              "\n(Message: ${response["message"]})",
          "HTTP ERROR 403");
      break;
    case 404:
      callAlertDialog(
          "Not found",
          "We could not find what you are looking for. "
              "\n(Message: ${response["message"]})",
          "HTTP ERROR 404");
      break;
    case 500:
      callAlertDialog(
          "Internal Server Error",
          "We apologize for the inconvenience. We are currently unable to "
              "handle your request. Please try again later "
              "\n(Message: ${response["message"]})",
          "HTTP ERROR 500");
      break;
    case 502:
      callAlertDialog(
          "Bad Gateway",
          "We apologize for the inconvenience. The web server is temporarily"
              " overloaded and cannot process your request. Please try"
              " again later",
          "HTTP ERROR 502");
      break;
    case 503:
      callAlertDialog(
          "Service Unavailable",
          "We are facing some technical issues. We will have it resolved "
              "shortly so please try again after some time. If the problem persists, "
              "please contact our Technical Support department.",
          "HTTP ERROR 503");
      break;
    case 504:
      callAlertDialog(
          "Service Unavailable",
          "We are facing some technical issues. We will have it resolved "
              "shortly so please try again after some time. If the problem persists, "
              "please contact our Technical Support department.",
          "HTTP ERROR 503");
      break;
    case 417:
      String msg = response["message"] == "Couldn't login user [ACTIVE]"
          ? "Invalid username/password"
          : response["message"];
      callAlertDialog(
          "Expectation Failed",
          "We have encountered an error while processing your request."
              "\n(Message: $msg)",
          "HTTP ERROR 417");
      break;
    default:
      callAlertDialog(
          "Error",
          "We have encountered an error while processing your request."
              "\n(Message: ${response["message"]})",
          "HTTP ERROR ${response.statusCode}");
      break;
  }
}
