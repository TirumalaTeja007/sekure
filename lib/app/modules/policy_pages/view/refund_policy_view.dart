import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/policy_pages/controller/policy_page_controller.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/app/widgets/dot.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/responsive.dart';

class RefundPolicyView extends GetView<PolicyPageController> {
  const RefundPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(Get.key.currentContext!).size;

    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    List<Widget> children1 = [
      intro(Get.key.currentContext!, screenSize),
      Padding(
        padding: EdgeInsets.only(
            left: ResponsiveWidget.isLargeScreen(context) ? 30 : 0,
            top: ResponsiveWidget.isLargeScreen(context) ? 5 : 30),
        child: Image.asset(
          'assets/images/refundPolicy1.png',
          width: !ResponsiveWidget.isLargeScreen(context)
              ? screenSize.width * 0.78
              : screenSize.width * 0.285,
          height: screenSize.height * 0.4,
          fit: BoxFit.fill,
        ),
      ),
    ];

    List<Widget> children2 = [
      intro2(Get.key.currentContext!, screenSize),
      Padding(
        padding: EdgeInsets.only(
            left: ResponsiveWidget.isLargeScreen(context) ? 30 : 0,
            top: ResponsiveWidget.isLargeScreen(context) ? 5 : 30),
        child: Image.asset(
          'assets/images/refundPolicy.png',
          width: !ResponsiveWidget.isLargeScreen(context)
              ? screenSize.width * 0.78
              : screenSize.width * 0.285,
          height: screenSize.height * 0.4,
          fit: BoxFit.fitHeight,
        ),
      ),
    ];

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false, dragDevices: MyCustomScrollBehavior().dragDevices),
      child: ListView(
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(height: screenSize.height / 10),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: !ResponsiveWidget.isLargeScreen(context)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children1,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children1,
                  ),
          ),
          pointer(Get.key.currentContext!, screenSize),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(
                vertical: 80, horizontal: horizontalPadding),
            color: const Color(0xfff0ecec),
            child: !ResponsiveWidget.isLargeScreen(context)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children2,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children2,
                  ),
          ),
          const BottomBar()
        ],
      ),
    );
  }

  Widget pointer(BuildContext context, Size screenSize) {
    return Container(
      width: screenSize.width,
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.13, vertical: screenSize.height / 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "If the standard time-frame as mentioned in the below table has "
              "expired and you have still not received the refund,",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Dot(color: Colors.black, size: 8),
              SizedBox(
                width: screenSize.width * 0.7 - 15,
                child: const Text(
                  " For payments made via bank- Please contact your, credit or debit card issuer or your bank for more information. Refunds will not be processed in cash.",
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Dot(color: Colors.black, size: 8),
              SizedBox(
                width: screenSize.width * 0.7 - 15,
                child: const Text(
                  " For payments related to Wallet- Raise a ticket by contacting the customer support team for Smart Socket App.  ",
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget intro(BuildContext context, Size screenSize) {
    final width = !ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.78
        : screenSize.width * 0.4;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Text(
              "REFUND POLICY",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: ResponsiveWidget.isLargeScreen(context)
                      ? 32
                      : ResponsiveWidget.isMediumScreen(context)
                      ? 26
                      : 22),
            ),
          ),
          Container(
            width: 250,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          SizedBox(
            width: width,
            child: const Text(
              "Refund are reversal transactions wherein complete or partial "
              "money is moved back to customer's source account (account "
              "from which actual payment was made). A refund can only be"
              " created for a successful or settled transaction. Use case "
              "for a refund arises in the following scenarios:",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Dot(color: Colors.black, size: 8),
              SizedBox(
                width: (width) - 15,
                child: const Text(
                  " Mismatch in transaction status between Smart Socket and "
                  "merchant, wherein transaction is in failed state at merchant's "
                  "end but is successful at Smart Socket's end or vice-versa. "
                  "A refund request usually takes 3-5 business days to reflect "
                  "in customer's account depending on the bank used for payment. ",
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Dot(color: Colors.black, size: 8),
              SizedBox(
                width: (width) - 15,
                child: const Text(
                  " Customer initiated refund - More than required amount is "
                  "debited from customer’s wallet for a charging session. Refund"
                  " for payment made via wallet is always credited back in the "
                  "user's wallet within 2-3 business days.  ",
                  style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget intro2(BuildContext context, Size screenSize) {
    final width = !ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.78
        : screenSize.width * 0.4;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: const Text(
              "The refund time period for different modes of payments is provided below",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Container(
            width: 250,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          Table(
            defaultColumnWidth: FixedColumnWidth(
                !ResponsiveWidget.isLargeScreen(context)
                    ? screenSize.width * 0.4
                    : screenSize.width * 0.2),
            border: TableBorder.all(
                color: Colors.black, style: BorderStyle.solid, width: 2),
            children: [
              TableRow(children: [
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Available Refund Method',
                        style: TextStyle(
                            fontSize: 20.0, fontFamily: 'MontserratBold')),
                  )
                ]),
                Column(children: const [
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Refund Time-Frame',
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'MontserratBold')))
                ]),
              ]),
              TableRow(children: [
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Credit Card/ Debit Card',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '3-5 Business Days',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
              ]),
              TableRow(children: [
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Net Banking Account (Credited to Bank Account',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '3-5 Business Days',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
              ]),
              TableRow(children: [
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'UPI Linked Bank Account',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '3-5 Business Days',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
              ]),
              TableRow(children: [
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Smart Wallet',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
                Column(children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '2-4 Business Days',
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  )
                ]),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
