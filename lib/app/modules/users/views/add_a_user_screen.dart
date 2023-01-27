import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/users/controllers/users_controller.dart';
import 'package:smartsocket/app/widgets/argon_button_widget.dart';
import 'package:smartsocket/app/widgets/dropdown_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';

class AddANewUser extends GetView<UsersController> {
  AddANewUser({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                      fieldType: "First name", textController: firstName),
                  _textFieldWidget(context,
                      fieldType: "Last name", textController: lastName),
                  _textFieldWidget(context,
                      fieldType: "Username", textController: userName),
                  _textFieldWidget(context,
                      fieldType: "Email", textController: email),
                  _textFieldWidget(context,
                      fieldType: "Mobile number", textController: phoneNumber),
                  _textFieldWidget(context,
                      fieldType: "Password", textController: password),
                  SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? (screenSize.width - 85) * .5
                        : 225,
                    child: DropdownWidget(
                        items: userRoleFiltersList.sublist(1),
                        dropDownValue: controller.userRole,
                        fieldType: "User Role",
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? (screenSize.width - 85) * .5
                            : 225,
                        height: 48),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: ArgonButtonWidget(
                        height: 45,
                        width: 150,
                        minWidth: 150,
                        borderRadius: 8.0,
                        color: Colors.green.shade900,
                        roundLoadingShape: false,
                        splashColor: Colors.grey,
                        onTap: (startLoader, stopLoader, btnState) async {
                          FocusScope.of(context).unfocus();
                          if (btnState == ButtonState.Idle &&
                              _formKey.currentState!.validate() &&
                              controller.userRole.value != "User Role") {
                            startLoader();
                            await controller.addAUser({
                              "firstName": firstName.text,
                              "lastName": lastName.text,
                              "email": email.text.trim(),
                              "password": "SS-2023",
                              "active": 1,
                              "phoneNumber": phoneNumber.text,
                              "userName": userName.text,
                            });
                            stopLoader();
                            firstName.clear();
                            lastName.clear();
                            email.clear();
                            phoneNumber.clear();
                            userName.clear();
                            controller.userRole.value = "User Role";
                          }
                        },
                        loader: const CupertinoActivityIndicator(),
                        child: const Text("Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Colors.white,
                                fontSize: 18))),
                  )
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
    return SizedBox(
      width: ResponsiveWidget.isSmallScreen(context)
          ? (screenSize.width - 85) * .5
          : 225,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fieldType,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'MontserratMedium',
                    color: kBgShade,
                    fontSize:
                        ResponsiveWidget.isLargeScreen(context) ? 14 : 12)),
            const SizedBox(height: 8),
            SizedBox(
              width: kTextFieldWidth(context),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.disabled,
                readOnly: false,
                validator: (value) {
                  switch (fieldType) {
                    case "Confirm password":
                      if (value!.isEmpty) {
                        return "Password should not be empty";
                      } else if (value.length < 8) {
                        return "Password should contain at-least 8 characters";
                      } else if (password.text != value) {
                        return "Passwords mismatch";
                      }
                      break;
                    case "Password":
                      if (value!.isEmpty) {
                        return "Password should not be empty";
                      } else if (value.length < 8) {
                        return "Password should contain at-least 8 characters";
                      }
                      break;
                    case "Name":
                      if (value!.isEmpty) {
                        return "Name should not be empty";
                      }
                      break;
                    case "Email":
                      if (value!.isEmpty) {
                        return "Name should not be empty";
                      } else if (!value.isEmail) {
                        return "Invalid email address";
                      }
                      break;
                    case "Mobile number":
                      if (value!.isEmpty) {
                        return "Mobile number should not be empty";
                      } else if (!value.isPhoneNumber) {
                        return "Invalid mobile number";
                      }
                      break;
                  }
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    isDense: true,
                    filled: true,
                    errorMaxLines: 2,
                    fillColor: Colors.white24,
                    border: _outlineBorder(),
                    enabledBorder: _outlineBorder(),
                    focusedBorder: _outlineBorder(),
                    hintText: fieldType,
                    hintStyle: TextStyle(
                        fontSize:
                            ResponsiveWidget.isLargeScreen(context) ? 14 : 12,
                        fontFamily: 'MontserratRegular',
                        color: kPrimaryTextColorShade),
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
      ),
    );
  }

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryTextColor),
        borderRadius: BorderRadius.circular(8.0));
  }
}
