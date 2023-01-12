import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/app/widgets/argon_button_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        Get.toNamed(Routes.login);
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 55),
                    Image.asset("assets/logo/ax_logo2.png",
                        color: Colors.blue.shade800, height: 45),
                    const SizedBox(height: 40),
                    Container(
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? screenSize.width * 0.9
                          : 500,
                      padding: const EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 4.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ResponsiveWidget.isSmallScreen(context)
                                    ? screenSize.width * 0.05
                                    : 50),
                            child: Text("Forgot Password ",
                                style: TextStyle(
                                    fontFamily: 'MontserratMedium',
                                    color: kPrimaryTextColor,
                                    fontSize:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 22
                                            : 28)),
                          ),
                          const SizedBox(height: 30),
                          _textFieldWidget(context,
                              fieldType: "Mobile number",
                              textController: mobileNumber,
                              screenSize: screenSize),
                          _textFieldWidget(context,
                              fieldType: "OTP",
                              textController: otp,
                              screenSize: screenSize),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 25, top: 5),
                                child: ArgonButtonWidget(
                                    height: 50,
                                    width: 175,
                                    minWidth: 175,
                                    borderRadius: 8.0,
                                    color: Colors.green.shade800,
                                    roundLoadingShape: false,
                                    splashColor: Colors.grey,
                                    onTap: (startLoader, stopLoader,
                                        btnState) async {
                                      if (btnState == ButtonState.Idle &&
                                          _formKey.currentState!.validate()) {
                                        startLoader();
                                        stopLoader();
                                      }
                                    },
                                    loader: const CupertinoActivityIndicator(),
                                    child: const Text("Continue",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'MontserratRegular',
                                            color: Colors.white,
                                            fontSize: 18))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Remember your password?",
                                  style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontFamily: 'MontserratRegular',
                                  )),
                              InkWell(
                                  onTap: () => Get.toNamed(Routes.login),
                                  child: Text(" Login",
                                      style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontFamily: 'MontserratRegular',
                                      ))),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldWidget(BuildContext context,
      {required String fieldType,
      required TextEditingController textController,
      required Size screenSize}) {
    double width = screenSize.width < 350 ? screenSize.width * 0.7 : 300;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: fieldType.contains("OTP") ? width - 120.0 : width,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: false,
              validator: (value) {
                switch (fieldType) {
                  case "Password":
                    if (value!.isEmpty) {
                      return "Password should not be empty";
                    } else if (value.length < 6) {
                      return "Password should contain at-least 6 characters";
                    }
                    break;
                  case "OTP":
                    if (value!.isEmpty) {
                      return "OTP should not be empty";
                    } else if (value.length < 4) {
                      return "OTP should must contain 4 characters";
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
                  suffix: fieldType.contains("Password")
                      ? InkWell(
                          onTap: () => controller.showPassword.value =
                              !controller.showPassword.value,
                          child: Text(controller.showPassword.value == false
                              ? "Show"
                              : "Hide"))
                      : const SizedBox.shrink(),
                  labelText: fieldType,
                  labelStyle: const TextStyle(
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
          if (fieldType.contains("OTP"))
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ArgonButtonWidget(
                  height: 50,
                  width: 110,
                  minWidth: 110,
                  borderRadius: 8.0,
                  color: kGrey,
                  roundLoadingShape: false,
                  splashColor: Colors.grey,
                  onTap: (startLoader, stopLoader, btnState) async {
                    if (btnState == ButtonState.Idle &&
                        mobileNumber.text.isNotEmpty &&
                        mobileNumber.text.isPhoneNumber) {
                      startLoader();
                      controller.otpReceived.value =
                          !controller.otpReceived.value;
                      stopLoader();
                    }
                  },
                  loader: const CupertinoActivityIndicator(),
                  child: Obx(
                    () => Text(
                        controller.otpReceived.value == true
                            ? "Resend"
                            : "Get OTP",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: Colors.black,
                            fontSize: 16)),
                  )),
            )
          else
            const SizedBox.shrink()
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
