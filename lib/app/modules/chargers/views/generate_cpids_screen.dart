import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/controllers/chargers_controller.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/app/widgets/subheadings.dart';

class GenerateCPIDScreen extends GetView<ChargersController> {
  GenerateCPIDScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController cpid = TextEditingController();
  final TextEditingController serialNumber = TextEditingController();
  final TextEditingController modelNumber = TextEditingController();
  final TextEditingController vendorId = TextEditingController();
  final TextEditingController evseVersion = TextEditingController();
  final TextEditingController efiVersion = TextEditingController();
  final TextEditingController macAddress = TextEditingController();
  final TextEditingController stationAddress = TextEditingController();
  final TextEditingController latitude = TextEditingController();
  final TextEditingController longitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? SizedBox(
            height: screenSize.height - 80,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 30, top: 50, bottom: 50),
                      child: SubHeading("Fill the form", kPrimaryTextColor)),
                  _getBody(context),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(left: 30, top: 50, bottom: 50),
                        child: SubHeading("Fill the form", kPrimaryTextColor)),
                    _getBody(context),
                  ],
                ),
              ),
            ),
          );
  }

  _getBody(BuildContext context) {
    return !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldWidget(context,
                      fieldType: "CPID", textController: cpid),
                  _textFieldWidget(context,
                      fieldType: "Serial number", textController: serialNumber),
                  _textFieldWidget(context,
                      fieldType: "Model number", textController: modelNumber),
                  _textFieldWidget(context,
                      fieldType: "MAC Address", textController: macAddress),
                  _textFieldWidget(context,
                      fieldType: "Vendor ID", textController: vendorId),
                  _addCPIDButton(context)
                ],
              ),
              const SizedBox(width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldWidget(context,
                      fieldType: "E.F.I Version", textController: efiVersion),
                  _textFieldWidget(context,
                      fieldType: "Longitude", textController: longitude),
                  _textFieldWidget(context,
                      fieldType: "E.V.S.E Version",
                      textController: evseVersion),
                  _textFieldWidget(context,
                      fieldType: "Station Address",
                      textController: stationAddress),
                  _textFieldWidget(context,
                      fieldType: "Latitude", textController: latitude),
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textFieldWidget(context,
                      fieldType: "CPID", textController: cpid),
                  _textFieldWidget(context,
                      fieldType: "Serial number", textController: serialNumber),
                  _textFieldWidget(context,
                      fieldType: "Model number", textController: modelNumber),
                  _textFieldWidget(context,
                      fieldType: "MAC Address", textController: macAddress),
                  _textFieldWidget(context,
                      fieldType: "Vendor ID", textController: vendorId),
                  _textFieldWidget(context,
                      fieldType: "E.F.I Version", textController: efiVersion),
                  _textFieldWidget(context,
                      fieldType: "Longitude", textController: longitude),
                  _textFieldWidget(context,
                      fieldType: "E.V.S.E Version",
                      textController: evseVersion),
                  _textFieldWidget(context,
                      fieldType: "Latitude", textController: latitude),
                  _textFieldWidget(context,
                      fieldType: "Station Address",
                      textController: stationAddress),
                  _addCPIDButton(context)
                ],
              ),
            ],
          );
  }

  Widget _addCPIDButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ArgonButton(
          height: 50,
          width: 150,
          minWidth: 150,
          borderRadius: 8.0,
          color: Colors.green.shade900,
          roundLoadingShape: false,
          splashColor: Colors.grey,
          onTap: (startLoader, stopLoader, btnState) async {
            if (btnState == ButtonState.Idle &&
                _formKey.currentState!.validate()) {
              startLoader();
              final result = await controller.addCPID({
                "chargePointID": cpid.text,
                "chargeBoxSerialNumber": serialNumber.text,
                "chargePointModel": modelNumber.text,
                "address": stationAddress.text,
                "latitude": double.parse(latitude.text),
                "longitude": double.parse(longitude.text),
                "efiVersion": efiVersion.text,
                "evseVersion": evseVersion.text,
                "vendorId": vendorId.text,
                "macAddress": macAddress.text,
              });
              stopLoader();
              if (result == "Success") {
                // callAlertDialog(
                //     'Success', "CPID is successfully generated!", cpid.text);
                cpid.clear();
                serialNumber.clear();
                modelNumber.clear();
                stationAddress.clear();
                latitude.clear();
                longitude.clear();
                efiVersion.clear();
                evseVersion.clear();
                vendorId.clear();
                macAddress.clear();
              }
            }
          },
          loader: const CupertinoActivityIndicator(),
          child: const Text("Generate",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.white,
                  fontSize: 18))),
    );
  }

  Widget _textFieldWidget(BuildContext context,
      {required String fieldType,
      required TextEditingController textController}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: kTextFieldWidth(context),
            child: TextFormField(
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
                  border: _outlineBorder(),
                  enabledBorder: _outlineBorder(),
                  focusedBorder: _outlineBorder(),
                  labelText: fieldType,
                  labelStyle: const TextStyle(
                      fontFamily: 'MontserratRegular', color: kPrimaryTextColorShade),
                  errorStyle: const TextStyle(height: 1),
                  floatingLabelBehavior: fieldType == "Select duration"
                      ? FloatingLabelBehavior.always
                      : FloatingLabelBehavior.auto),
              keyboardType: TextInputType.text,
              controller: textController,
            ),
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
