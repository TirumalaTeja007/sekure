import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/constants/constants.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/responsive.dart';
import '../../../utils/scroll_behaviour.dart';
import '../../widgets/argon_button_widget.dart';

class ContactUsWidget extends StatelessWidget {
  ContactUsWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.325
        : screenSize.width > 800
            ? screenSize.width * 0.4
            : screenSize.width * 0.7;
    double bodyTextSize = ResponsiveWidget.isSmallScreen(context)
        ? 14
        : ResponsiveWidget.isMediumScreen(context)
            ? 16
            : 18;
    Widget image = Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: const DecorationImage(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                image: AssetImage(
                  'assets/images/axonify_map_view.png',
                ))));
    Widget forms = SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Questions?",
            style: TextStyle(
                fontFamily: 'MontserratBold',
                color: Colors.black,
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
          ),
          Row(
            children: [
              Text(
                "We're ",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: Colors.green,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
              ),
              Text(
                "Here to Help.",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: Colors.black,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Please fill out the form below and our team will get "
            "in touch with you within 24 hrs.",
            style: TextStyle(
                fontFamily: 'Questrial',
                color: kPrimaryTextColor,
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 14
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 16
                        : 18),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldWidget(context,
                      fieldType: "First name",
                      textController: firstName,
                      width: width * 0.45),
                  SizedBox(width: width * 0.1),
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
                  SizedBox(width: width * 0.1),
                  _textFieldWidget(context,
                      fieldType: "Mobile number",
                      textController: mobileNumber,
                      width: width * 0.45),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _textFieldWidget(context,
                  fieldType: "What can we help you with?",
                  textController: description,
                  width: width * 0.95),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ArgonButtonWidget(
                height: 50,
                width: 200,
                minWidth: 200,
                borderRadius: 8.0,
                color: Colors.green.shade900,
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
                        fontSize: ResponsiveWidget.isLargeScreen(context)
                            ? 16
                            : 14))),
          )
        ],
      ),
    );
    List<Widget> contactInfo = [
      SizedBox(
        width: (screenSize.width < 800 ? width : (width * 2) / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.call, color: kGreen),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Call us",
                  style: TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: Colors.black,
                      fontSize: bodyTextSize),
                ),
                Text(
                  "\n+91 8069033833\n\n",
                  style: TextStyle(
                      fontFamily: 'Questrial',
                      color: Colors.black,
                      fontSize: bodyTextSize),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: (screenSize.width < 800 ? width : (width * 2) / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.email, color: kGreen),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Write to us",
                  style: TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: Colors.black,
                      fontSize: bodyTextSize),
                ),
                SizedBox(
                  width: (screenSize.width < 800
                      ? width - 39
                      : (width * 2) / 3 - 39),
                  child: Text(
                    "\ninfo@axonifytech.com \nsales@axonifytech.com\n\n",
                    style: TextStyle(
                        fontFamily: 'Questrial',
                        color: Colors.black,
                        fontSize: bodyTextSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: (screenSize.width < 800 ? width : (width * 2) / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_rounded, color: kGreen),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where to find us",
                  style: TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: Colors.black,
                      fontSize: bodyTextSize),
                ),
                SizedBox(
                  width: (screenSize.width < 800
                      ? width - 39
                      : (width * 2) / 3 - 39),
                  child: Text(
                    "\n2nd Floor, Unit No. B-23, Phase – II, "
                    "Technocrats Industrial Estate, "
                    "Balanagar, Hyderabad – 500037, "
                    "Telangana, India\n\n",
                    style: TextStyle(
                        fontFamily: 'Questrial',
                        color: Colors.black,
                        fontSize: bodyTextSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
    return Column(
      children: [
        Container(
          width: screenSize.width,
          padding:
              EdgeInsets.fromLTRB(horizontalPadding, 0, horizontalPadding, 0),
          child: screenSize.width > 800
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    forms,
                    SizedBox(width: screenSize.width * 0.05),
                    image
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    forms,
                    SizedBox(height: screenSize.height * 0.05),
                    image,
                  ],
                ),
        ),
        Container(
            width: screenSize.width,
            padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                screenSize.height / 16,
                horizontalPadding,
                screenSize.height / 12),
            child: screenSize.width < 800
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: contactInfo,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contactInfo,
                  )),
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
              maxLines: fieldType.contains("help") ? 8 : 1,
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
        borderSide: const BorderSide(color: kPrimaryTextColor),
        borderRadius: BorderRadius.circular(8.0));
  }
}
