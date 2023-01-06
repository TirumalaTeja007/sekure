
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/argon_button_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';

import '../../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  final RegExp regExp = RegExp('[H0-9]');

  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        Get.toNamed(Routes.home);
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenSize.height * 0.4),
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/axonify_logo.png", height: 70),
                    SizedBox(height: screenSize.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Log in",
                            style: TextStyle(
                                fontFamily: 'MontserratBold',
                                color: kPrimaryTextColorShade,
                                fontSize: 28)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * 0.05),
                    _textFieldWidget(
                        context,
                        fieldType: "Username",
                        screenSize,
                        textController: username),
                    SizedBox(height: screenSize.height * 0.01),
                    _textFieldWidget(
                        context,
                        fieldType: "Password",
                        screenSize,
                        textController: password),
                    SizedBox(height: screenSize.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ArgonButtonWidget(
                            height: 50,
                            width: 150,
                            minWidth: 150,
                            borderRadius: 8.0,
                            color: Colors.green.shade800,
                            roundLoadingShape: false,
                            splashColor: Colors.grey,
                            onTap: (startLoader, stopLoader, btnState) async {
                              if (btnState == ButtonState.Idle &&
                                  _formKey.currentState!.validate()) {
                                startLoader();
                                Map<String, dynamic> payload = {};
                                payload["password"] = password.text;
                                payload["mobileNumber"] = username.text;
                                print(payload);
                                await controller.authenticate(
                                    context, _formKey, payload);
                                stopLoader();
                              }
                            },
                            loader: const CupertinoActivityIndicator(),
                            child: const Text("Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    color: Colors.white,
                                    fontSize: 18))),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.035),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Need an account?",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                              fontFamily: 'MontserratRegular',
                            )),
                        InkWell(
                            onTap: () async {},
                            child: const Text(" Signup",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'MontserratRegular',
                                ))),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () async {},
                            child: const Text("Forgot password?",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'MontserratRegular',
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldWidget(BuildContext context, Size screenSize,
      {required String fieldType,
      required TextEditingController textController}) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => SizedBox(
              width: 300,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                readOnly: false,
                validator: (value) {
                  switch (fieldType) {
                    case "Username":
                      if (value!.isEmpty) {
                        return "Username should not be empty";
                      }
                      break;
                    case "Password":
                      if (value!.isEmpty) {
                        return "Password should not be empty";
                      } else if (value.length < 4) {
                        return "Password should contain at-least 4 characters";
                      }
                  }
                },
                onSaved: (value) => textController.text = value!,
                onFieldSubmitted: (value) => textController.text = value,
                textAlign: TextAlign.start,
                enableInteractiveSelection: true,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                obscureText: controller.showPassword.value == true &&
                        fieldType.contains("Password")
                    ? false
                    : !fieldType.contains("Password")
                        ? false
                        : true,
                style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 16,
                    fontFamily: 'MontserratRegular'),
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    counterText: "",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    isDense: true,
                    filled: true,
                    errorMaxLines: 2,
                    fillColor: Colors.white24,
                    border: outlineBorder(),
                    enabledBorder: outlineBorder(),
                    suffix: fieldType.contains("Password")
                        ? InkWell(
                            onTap: () => controller.showPassword.value =
                                !controller.showPassword.value,
                            child: Text(controller.showPassword.value == false
                                ? "Show"
                                : "Hide"))
                        : const SizedBox.shrink(),
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
