import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/constants/constants.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../utils/responsive.dart';
import '../../../../utils/scroll_behaviour.dart';
import '../../../widgets/argon_button_widget.dart';
import '../controller/contactus_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  ContactUsView({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Widget> children = [_forms(context), _contactInfo(context)];
    print(screenSize);
    return ListView(
      controller: controller.scrollController,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      children: [
        SizedBox(height: screenSize.height / 10),
        Container(
          width: screenSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
        ),
        SizedBox(height: screenSize.height / 8),
        const BottomBar()
      ],
    );
  }

  Widget _forms(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: ResponsiveWidget.isLargeScreen(context)
          ? 500
          : screenSize.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Get in touch",
            style: TextStyle(
                fontFamily: 'MontserratBold',
                color: Colors.black,
                fontSize: 30),
          ),
          const SizedBox(height: 10),
          const Text(
            "Please fill out the form below and our team will get "
            "in touch with you within 24 hrs.",
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: kPrimaryTextColor,
                fontSize: 14),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldWidget(context,
                      fieldType: "First name",
                      textController: firstName,
                      screenSize: screenSize),
                  _textFieldWidget(context,
                      fieldType: "Email",
                      textController: email,
                      screenSize: screenSize),
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
                      screenSize: screenSize),
                  _textFieldWidget(context,
                      fieldType: "Mobile number",
                      textController: mobileNumber,
                      screenSize: screenSize),
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
                  screenSize: screenSize),
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
                child: const Text("Send Message",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.white,
                        fontSize: 16))),
          )
        ],
      ),
    );
  }

  Widget _contactInfo(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? 350
          : screenSize.width * 0.8,
      margin: EdgeInsets.fromLTRB(screenSize.width > 900 ? 50 : 0,
          ResponsiveWidget.isLargeScreen(context) ? 110 : 60, 0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 350,
            child: Text(
              "We are here for you!",
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
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          const SizedBox(height: 20),
          const Text(
            "Reach out to us for any query regarding EV chargers for commercial use",
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: Colors.black,
                fontSize: 16),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.email, color: kGreen),
              SizedBox(width: 15),
              Text(
                "info@axonifytech.com \nsales@axonifytech.com",
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.black,
                    fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.location_on_rounded, color: kGreen),
              SizedBox(width: 15),
              Text(
                "2nd Floor, Unit No. B-23, Phase – II,"
                "\nTechnocrats Industrial Estate, "
                "\nBalanagar, Hyderabad – 500037,"
                "\nTelangana, India",
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.black,
                    fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textFieldWidget(BuildContext context,
      {required String fieldType,
      required TextEditingController textController,
      required Size screenSize}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: fieldType.contains("help")
                ? ResponsiveWidget.isSmallScreen(context)
                    ? 380
                    : 470
                : ResponsiveWidget.isSmallScreen(context)
                    ? 175
                    : 220,
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
                  fontSize: 16,
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
