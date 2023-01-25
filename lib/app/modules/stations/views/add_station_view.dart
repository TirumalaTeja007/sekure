import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/controllers/chargers_controller.dart';
import 'package:smartsocket/app/modules/stations/controllers/stations_controller.dart';
import 'package:smartsocket/app/widgets/argon_button_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/app/widgets/subheadings.dart';

class AddStationsView extends GetView<StationsController> {
  AddStationsView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController stationName = TextEditingController();
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController address3 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController latitude = TextEditingController();
  final TextEditingController longitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height - 80,
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.width - 60
                  : 500,
              margin: EdgeInsets.only(
                  left: ResponsiveWidget.isLargeScreen(context) ? 50 : 30,
                  top: 50),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 25.0,
                runSpacing: 0.0,
                children: [
                  _textFieldWidget(context,
                      fieldType: "Station Name", textController: stationName),
                  _textFieldWidget(context,
                      fieldType: "Address1", textController: address1),
                  _textFieldWidget(context,
                      fieldType: "Address2", textController: address2),
                  _textFieldWidget(context,
                      fieldType: "Address3", textController: address3),
                  _textFieldWidget(context,
                      fieldType: "City", textController: city),
                  _textFieldWidget(context,
                      fieldType: "State", textController: state),
                  _textFieldWidget(context,
                      fieldType: "Pincode", textController: pincode),
                  _textFieldWidget(context,
                      fieldType: "Latitude", textController: latitude),
                  _textFieldWidget(context,
                      fieldType: "Longitude", textController: longitude),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 26 : 28),
                    child: ArgonButtonWidget(
                        height: 45,
                        width: 150,
                        minWidth: 150,
                        borderRadius: 8.0,
                        color: Colors.green.shade900,
                        roundLoadingShape: false,
                        splashColor: Colors.grey,
                        onTap: (startLoader, stopLoader, btnState) async {},
                        loader: const CupertinoActivityIndicator(),
                        child: Text("Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Colors.white,
                                fontSize:
                                    ResponsiveWidget.isLargeScreen(context)
                                        ? 16
                                        : 14))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldWidget(BuildContext context,
      {required String fieldType,
      required TextEditingController textController}) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: ResponsiveWidget.isSmallScreen(context)
          ? (screenSize.width - 85) * .5
          : 225,
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldType,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'MontserratMedium',
                  color: kBgShade,
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 14 : 12)),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: false,
            validator: (value) {
              if (value!.isEmpty) return "$fieldType should not be empty";
            },
            onSaved: (value) => textController.text = value!,
            onFieldSubmitted: (value) => textController.text = value,
            textAlign: TextAlign.start,
            enableInteractiveSelection: true,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: ResponsiveWidget.isLargeScreen(context) ? 14 : 12,
                fontFamily: 'MontserratRegular'),
            decoration: InputDecoration(
                counterText: "",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                isDense: true,
                filled: true,
                errorMaxLines: 2,
                fillColor: Colors.white24,
                border: _outlineBorder(),
                enabledBorder: _outlineBorder(),
                focusedBorder: _outlineBorder(),
                hintText: fieldType,
                hintStyle: TextStyle(
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 14 : 12,
                    fontFamily: 'MontserratRegular',
                    color: kPrimaryTextColorShade),
                errorStyle: const TextStyle(height: 1),
                floatingLabelBehavior: fieldType == "Select duration"
                    ? FloatingLabelBehavior.always
                    : FloatingLabelBehavior.auto),
            keyboardType: TextInputType.text,
            controller: textController,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryTextColor),
        borderRadius: BorderRadius.circular(8.0));
  }
}
