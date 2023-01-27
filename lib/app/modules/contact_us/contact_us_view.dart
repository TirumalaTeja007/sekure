import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/contact_us/controllers/contact_us_controller.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/responsive.dart';
import '../../widgets/argon_button_widget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ContactUsView extends GetView<ContactUsController> {
  ContactUsView({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? 575
        : ResponsiveWidget.isMediumScreen(context)
            ? 475
            : screenSize.width * 0.8;
    double bodyTextSize = 14;
    List<Widget> contactInfo = [
      SizedBox(
        width: ResponsiveWidget.isSmallScreen(context)
            ? width
            : (width + 100) * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.call, color: kGreen),
            SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 0 : 10),
            Text(
              "\n+91 8069033833",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: bodyTextSize),
            ),
          ],
        ),
      ),
      SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 25 : 5),
      SizedBox(
        width: ResponsiveWidget.isSmallScreen(context)
            ? width
            : (width + 100) * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.email, color: kGreen),
            SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 0 : 10),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? width
                  : (width + 100) * 0.3,
              child: Text(
                "\ninfo@axonifytech.com \nsales@axonifytech.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.black,
                    fontSize: bodyTextSize),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 25 : 5),
      SizedBox(
        width: ResponsiveWidget.isSmallScreen(context)
            ? width
            : (width + 100) * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_rounded, color: kGreen),
            SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 0 : 10),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? width
                  : (width + 100) * 0.3,
              child: Text(
                "\n2nd Floor, Unit No. B-23, Phase – II, "
                "Technocrats Industrial Estate, "
                "Balanagar, Hyderabad – 500037, "
                "Telangana, India",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.black,
                    fontSize: bodyTextSize),
              ),
            ),
          ],
        ),
      ),
    ];

    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 16),
        SizedBox(
          width: width,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Get in touch!',
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: ResponsiveWidget.isLargeScreen(context)
                      ? 32
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 28
                          : 22),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width * 0.8,
          child: Text(
            "Any question or remarks? Just write us a message",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: kPrimaryTextColorShade,
                fontSize: bodyTextSize),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width + screenSize.width * 0.1,
              padding: EdgeInsets.fromLTRB(
                  0,
                  ResponsiveWidget.isSmallScreen(context)
                      ? screenSize.height / 20
                      : screenSize.height / 12,
                  0,
                  screenSize.height / 20),
              child: ResponsiveWidget.isSmallScreen(context)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: contactInfo,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: contactInfo,
                    ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width + screenSize.width * 0.1,
              padding: EdgeInsets.all(screenSize.width * 0.05),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4.0)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: width,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: 'Contact Information',
                          style: TextStyle(
                              fontFamily: 'MontserratBold',
                              color: Colors.black,
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 24
                                  : ResponsiveWidget.isMediumScreen(context)
                                      ? 20
                                      : 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: width * 0.2),
                    child: SizedBox(
                      width: width * 0.8,
                      child: Text(
                        "Please fill out the form below and our team will get "
                        "in touch with you within 24 hrs.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kPrimaryTextColorShade,
                            fontSize: bodyTextSize),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textFieldWidget(context,
                              fieldType: "First name",
                              textController: firstName,
                              width: width * 0.45),
                          _textFieldWidget(context,
                              fieldType: "Email",
                              textController: email,
                              width: width * 0.45),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textFieldWidget(context,
                              fieldType: "Last name",
                              textController: lastName,
                              width: width * 0.45),
                          _textFieldWidget(context,
                              fieldType: "Mobile number",
                              textController: phoneNumber,
                              width: width * 0.45),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _textFieldWidget(context,
                          fieldType: "What can we help you with?",
                          textController: description,
                          width: (width * 0.9) + 30),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ArgonButtonWidget(
                        height: 50,
                        width: 200,
                        minWidth: 200,
                        borderRadius: 8.0,
                        color: kGreen,
                        roundLoadingShape: false,
                        splashColor: Colors.grey,
                        onTap: (startLoader, stopLoader, btnState) async {
                          if (btnState == ButtonState.Idle &&
                              _formKey.currentState!.validate()) {
                            startLoader();
                            stopLoader();
                          }
                        },
                        loader: const CupertinoActivityIndicator(),
                        child: Text("Send Message",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Colors.white,
                                fontSize: bodyTextSize))),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenSize.height / 8),
        const BottomBar()
      ],
    );
  }

  Widget _textFieldWidget(BuildContext context,
      {required String fieldType,
      required TextEditingController textController,
      required double width}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "$fieldType should not be empty";
                }
              },
              onSaved: (value) => textController.text = value!,
              onFieldSubmitted: (value) => textController.text = value,
              textAlign: TextAlign.start,
              enableInteractiveSelection: true,
              maxLines: fieldType.contains("help") ? 10 : 1,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 14,
                  fontFamily: 'MontserratRegular'),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  isDense: true,
                  filled: true,
                  errorMaxLines: 2,
                  fillColor: Colors.white24,
                  border: outlineBorder(),
                  enabledBorder: outlineBorder(),
                  focusedBorder: outlineBorder(),
                  labelText: fieldType,
                  labelStyle: const TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: kPrimaryTextColorShade),
                  errorStyle: const TextStyle(height: 1),
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              keyboardType: TextInputType.text,
              controller: textController,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryTextColorShade),
        borderRadius: BorderRadius.circular(8.0));
  }
}
