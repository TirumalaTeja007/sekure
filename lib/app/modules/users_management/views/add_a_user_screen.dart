import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/users_management/controllers/users_management_controller.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/app/widgets/subheadings.dart';
import 'package:smartsocket/constants/color_constants.dart';
class AddANewUser extends GetView<UsersManagementController> {
  AddANewUser({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController userType = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

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
    return ResponsiveWidget.isSmallScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textFieldWidget(context,
                      fieldType: "Name", textController: name),
                  _textFieldWidget(context,
                      fieldType: "Email", textController: email),
                  _textFieldWidget(context,
                      fieldType: "Password", textController: password),
                  _textFieldWidget(context,
                      fieldType: "Mobile number", textController: mobileNumber),
                  _textFieldWidget(context,
                      fieldType: "User type", textController: userType),
                  _textFieldWidget(context,
                      fieldType: "Confirm password",
                      textController: confirmPassword),
                  _addUsersButton(context)
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldWidget(context,
                      fieldType: "Name", textController: name),
                  _textFieldWidget(context,
                      fieldType: "Email", textController: email),
                  _textFieldWidget(context,
                      fieldType: "Password", textController: password),
                  _addUsersButton(context)
                ],
              ),
              const SizedBox(width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldWidget(context,
                      fieldType: "Mobile number", textController: mobileNumber),
                  _textFieldWidget(context,
                      fieldType: "User type", textController: userType),
                  _textFieldWidget(context,
                      fieldType: "Confirm password",
                      textController: confirmPassword),
                ],
              ),
            ],
          );
  }

  Widget _addUsersButton(context) {
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
              await controller.addAUser({
                "name": name.text,
                "email": email.text.trim(),
                "password": password.text,
                "dialCode": "+91",
                "mobileNumber": mobileNumber.text,
                "countryCode": "IN"
              });
              stopLoader();
            }
          },
          loader: const CupertinoActivityIndicator(),
          child: const Text("Submit",
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

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryTextColor),
        borderRadius: BorderRadius.circular(8.0));
  }
}
