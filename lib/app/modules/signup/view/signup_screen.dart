import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/signup/controller/user_signup_controller.dart';
import 'package:smartsocket/app/modules/users_management/controllers/users_management_controller.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/app/widgets/argon_button_widget.dart';
import 'package:smartsocket/app/widgets/subheadings.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';

class SignupView extends GetView<UserSignupController> {
  SignupView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController userType = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

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
                            child: Text("Register",
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
                              fieldType: "First name",
                              textController: firstName,
                              screenSize: screenSize),
                          _textFieldWidget(context,
                              fieldType: "Last name",
                              textController: lastName,
                              screenSize: screenSize),
                          _textFieldWidget(context,
                              fieldType: "Email",
                              textController: email,
                              screenSize: screenSize),
                          _textFieldWidget(context,
                              fieldType: "Mobile number",
                              textController: mobileNumber,
                              screenSize: screenSize),
                          _textFieldWidget(context,
                              fieldType: "Password",
                              textController: password,
                              screenSize: screenSize),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue.shade800,
                                  visualDensity: VisualDensity.compact,
                                  value: controller.agreedToTerms.value,
                                  onChanged: (value) {
                                    controller.agreedToTerms.value =
                                        value as bool;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width < 350
                                    ? screenSize.width * 0.7 - 40
                                    : 260,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: "I have read and agree to the ",
                                    style: const TextStyle(
                                        fontFamily: "MontserratRegular",
                                        decoration: TextDecoration.none,
                                        color: kPrimaryTextColor),
                                    children: [
                                      TextSpan(
                                        text: "\nTerms of Use",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: "MontserratRegular",
                                            color: Colors.green.shade800),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(
                                                Routes.termsAndConditions);
                                          },
                                      ),
                                      const TextSpan(
                                        text: " and ",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: "MontserratRegular",
                                            color: kPrimaryTextColor),
                                      ),
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: "MontserratRegular",
                                            color: Colors.green.shade800),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(Routes.privacyPolicy);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 25, top: 30),
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
                                        await controller.addAUser({
                                          "firstName": firstName.text,
                                          "lastName": lastName.text,
                                          "email": email.text.trim(),
                                          "password": password.text,
                                          "active": 0,
                                          "phoneNumber": mobileNumber.text,
                                          "userName":
                                              "SS_${DateTime.now().microsecond}"
                                        });
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
                              const Text("Already have an account?",
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width < 350 ? screenSize.width * 0.7 : 300,
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
                  case "First name":
                    if (value!.isEmpty) {
                      return "First name should not be empty";
                    }
                    break;
                  case "Last name":
                    if (value!.isEmpty) {
                      return "Last name should not be empty";
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
