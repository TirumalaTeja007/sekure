import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/controllers/chargers_controller.dart';
import 'package:smartsocket/app/widgets/argon_button_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/app/widgets/subheadings.dart';

class AddChargersView extends GetView<ChargersController> {
  AddChargersView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController cpid = TextEditingController();
  final TextEditingController serialNumber = TextEditingController();
  final TextEditingController modelNumber = TextEditingController();
  final TextEditingController vendorId = TextEditingController();
  final TextEditingController evseVersion = TextEditingController();
  final TextEditingController efiVersion = TextEditingController();
  final TextEditingController macAddress = TextEditingController();
  final TextEditingController stationAddress = TextEditingController();
  final TextEditingController blockNumber = TextEditingController();
  final TextEditingController floorNumber = TextEditingController();
  final TextEditingController city = TextEditingController();

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
                      fieldType: "Device Name", textController: cpid),
                  _textFieldWidget(context,
                      fieldType: "Serial Number", textController: serialNumber),
                  _textFieldWidget(context,
                      fieldType: "Model Number", textController: modelNumber),
                  _textFieldWidget(context,
                      fieldType: "MAC Address", textController: macAddress),
                  _textFieldWidget(context,
                      fieldType: "E.F.I Version", textController: efiVersion),
                  _textFieldWidget(context,
                      fieldType: "E.V.S.E Version",
                      textController: evseVersion),
                  _textFieldWidget(context,
                      fieldType: "City", textController: city),
                  _textFieldWidget(context,
                      fieldType: "Station Address",
                      textController: stationAddress),
                  _textFieldWidget(context,
                      fieldType: "Block Number", textController: blockNumber),
                  _textFieldWidget(context,
                      fieldType: "Floor Number", textController: floorNumber),
                  _addCPIDButton(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addCPIDButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ArgonButtonWidget(
          height: 45,
          width: 150,
          minWidth: 150,
          borderRadius: 8.0,
          color: Colors.green.shade900,
          roundLoadingShape: false,
          splashColor: Colors.grey,
          onTap: (startLoader, stopLoader, btnState) async {
            // if (btnState == ButtonState.Idle &&
            //     _formKey.currentState!.validate()) {
            //   startLoader();
            //   final result = await controller.addCPID({
            //     "chargePointID": cpid.text,
            //     "chargeBoxSerialNumber": serialNumber.text,
            //     "chargePointModel": modelNumber.text,
            //     "address": stationAddress.text,
            //     "latitude": double.parse(latitude.text),
            //     "longitude": double.parse(longitude.text),
            //     "efiVersion": efiVersion.text,
            //     "evseVersion": evseVersion.text,
            //     "vendorId": vendorId.text,
            //     "macAddress": macAddress.text,
            //   });
            //   stopLoader();
            //   if (result == "Success") {
            //     // callAlertDialog(
            //     //     'Success', "CPID is successfully generated!", cpid.text);
            //     cpid.clear();
            //     serialNumber.clear();
            //     modelNumber.clear();
            //     stationAddress.clear();
            //     latitude.clear();
            //     longitude.clear();
            //     efiVersion.clear();
            //     evseVersion.clear();
            //     vendorId.clear();
            //     macAddress.clear();
            //   }
            // }
            await GetConnect()
                .get(addDeviceUrl, headers: basicHeader)
                .then((response) async {
              print(response.body);
              if (!response.hasError) {
                List devList = response.body["data"];
                for (int i = 0; i < devList.length; i++) {}
              }
            });
          },
          loader: const CupertinoActivityIndicator(),
          child: Text("Submit",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.white,
                  fontSize:
                      ResponsiveWidget.isLargeScreen(context) ? 16 : 14))),
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
