import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../utils/responsive.dart';
import '../../../widgets/dot.dart';
import '../controller/policy_page_controller.dart';

class PrivacyPolicyView extends GetView<PolicyPageController> {
  const PrivacyPolicyView({super.key});

  Widget intro(BuildContext context, Size screenSize) {
    final width = screenSize.width < 850
        ? screenSize.width * 0.78
        : screenSize.width * 0.4;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: const Text(
              "PRIVACY POLICY",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Container(
            width: 200,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          const Text(
            "Effective date: 2022-11-28",
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: Colors.black,
                fontSize: 16),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: width,
            child: const Text(
              "Axonify Tech Systems (“us”, “we”, or “our”) operates ninedots.axonifytech.com (hereinafter referred to as “Service”)."
              "\n\nOur Privacy Policy governs your visit to ninedots.axonifytech.com, and explains how we collect, safeguard and disclose information that results from your use of our Service."
              "\n\nWe use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions."
              "\n\nOur Terms and Conditions (“Terms”) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (“agreement”).",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget bulletPoints(BuildContext context, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Dot(color: Colors.black, size: 8),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(Get.key.currentContext!).size.width * 0.7 - 20,
            child: Text(
              content,
              style: const TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(Get.key.currentContext!).size;

    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false, dragDevices: MyCustomScrollBehavior().dragDevices),
      child: ListView(
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(height: screenSize.height / 10),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: screenSize.width < 850
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      intro(Get.key.currentContext!, screenSize),
                      const SizedBox(width: 30),
                      Image.asset(
                        'assets/images/privacypolicy.jpg',
                        width: screenSize.width < 850
                            ? screenSize.width * 0.78
                            : screenSize.width * 0.3,
                        height: screenSize.height * 0.45,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      intro(Get.key.currentContext!, screenSize),
                      const SizedBox(width: 30),
                      Image.asset(
                        'assets/images/privacypolicy.jpg',
                        width: screenSize.width < 850
                            ? screenSize.width * 0.78
                            : screenSize.width * 0.3,
                        height: screenSize.height * 0.45,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
          ),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveWidget.isLargeScreen(context)
                    ? screenSize.width * 0.12
                    : screenSize.width * 0.075,
                vertical: screenSize.height / 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("DEFINITIONS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                bulletPoints(context,
                    "SERVICE means the ninedots.axonifytech.com website operated by Axonify Tech Systems."),
                bulletPoints(context,
                    "PERSONAL DATA means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession)."),
                bulletPoints(context,
                    "USAGE DATA is data collected automatically either generated by the use of Service or from Service infrastructure itself (for example, the duration of a page visit)."),
                bulletPoints(context,
                    "COOKIES are small files stored on your device (computer or mobile device)."),
                bulletPoints(context,
                    "DATA CONTROLLER means a natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal data are, or are to be, processed. For the purpose of this Privacy Policy, we are a Data Controller of your data."),
                bulletPoints(context,
                    "DATA PROCESSORS (OR SERVICE PROVIDERS) means any natural or legal person who processes the data on behalf of the Data Controller. We may use the services of various Service Providers in order to process your data more effectively."),
                bulletPoints(context,
                    "DATA SUBJECT is any living individual who is the subject of Personal Data."),
                bulletPoints(context,
                    "THE USER is the individual using our Service. The User corresponds to the Data Subject, who is the subject of Personal Data."),
                SizedBox(height: screenSize.height / 16),
                const Text("INFORMATION COLLECTION AND USE",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe collect several different types of information for various purposes to provide and improve our Service to you.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("TYPES OF DATA COLLECTED",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const SizedBox(height: 15),
                const Text("Personal Data",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWhile using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (“Personal Data”). Personally identifiable information may include, but is not limited to:"
                    "\n\n0.1. Email address"
                    "\n\n0.2. First name and last name"
                    "\n\n0.3. Phone number"
                    "\n\n0.4. Address, Country, State, Province, ZIP/Postal code, City"
                    "\n\n0.5. Cookies and Usage Data"
                    "\n\nWe may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 24),
                const Text("Usage Data",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWhile using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (“Personal Data”). Personally identifiable information may include, but is not limited to: \n\nThis Usage Data may include information such as your computer's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data."
                    "\n\nWhen you access Service with a device, this Usage Data may include information such as the type of device you use, your device unique ID, the IP address of your device, your device operating system, the type of Internet browser you use, unique device identifiers and other diagnostic data.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 24),
                const Text("Location Data",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may use and store information about your location if you give us permission to do so (“Location Data”). We use this data to provide features of our Service, to improve and customize our Service."
                    "\n\nYou can enable or disable location services when you use our Service at any time by way of your device settings.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 24),
                const Text("Tracking Cookies Data",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe use cookies and similar tracking technologies to track the activity on our Service and we hold certain information."
                    "\n\nCookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service."
                    "\n\nYou can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service."
                    "\n\nExamples of Cookies we use:"
                    "\n\n0.1. SESSION COOKIES: We use Session Cookies to operate our Service."
                    "\n\n0.2. PREFERENCE COOKIES: We use Preference Cookies to remember your preferences and various settings."
                    "\n\n0.3. SECURITY COOKIES: We use Security Cookies for security purposes."
                    "\n\n0.4. ADVERTISING COOKIES: Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 24),
                const Text("Other Data",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWhile using our Service, we may also collect the following information: sex, age, date of birth, citizenship, registration at place of residence and actual address, telephone number (work, mobile) and other data.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("USE OF DATA",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nAxonify Tech Systems uses the collected data for various purposes:"
                    "\n\n0.1. to provide and maintain our Service;"
                    "\n\n0.2. to notify you about changes to our Service;"
                    "\n\n0.3. to allow you to participate in interactive features of our Service when you choose to do so;"
                    "\n\n0.4. to provide customer support;"
                    "\n\n0.5. to gather analysis or valuable information so that we can improve our Service;"
                    "\n\n0.6. to monitor the usage of our Service;"
                    "\n\n0.7. to detect, prevent and address technical issues;"
                    "\n\n 0.8. to fulfil any other purpose for which you provide it;"
                    "\n\n 0.9. to carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection;"
                    "\n\n0.10. to provide you with notices about your account and/or subscription, including expiration and renewal notices, email-instructions, etc.;"
                    "\n\n0.11. to provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information;"
                    "\n\n0.12. in any other way we may describe when you provide the information;"
                    "\n\n0.13. for any other purpose with your consent.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("RETENTION OF DATA",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies."
                    "\n\nWe will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("TRANSFER OF DATA",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nYour information, including Personal Data, may be transferred to - and maintained on - computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction."
                    "\n\nIf you are located outside India and choose to provide information to us, please note that we transfer the data, including Personal Data, to India and process it there."
                    "\n\nYour consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer."
                    "\n\nAxonify Tech Systems will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organisation or a country unless there are adequate controls in place including the security of your data and other personal information.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("DISCLOSURE OF DATA",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may disclose personal information that we collect, or you provide:"
                    "\n\n0.1. Disclosure for Law Enforcement - Under certain circumstances, we may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities."
                    "\n\n0.2. Business Transaction - If we or our subsidiaries are involved in a merger, acquisition or asset sale, your Personal Data may be transferred."
                    "\n\n0.3. Other cases. We may disclose your information also:"
                    "\n\n0.3.1. to our subsidiaries and affiliates;"
                    "\n\n0.3.2. to contractors, service providers, and other third parties we use to support our business;"
                    "\n\n0.3.3. to fulfill the purpose for which you provide it;"
                    "\n\n0.3.4. for the purpose of including your company’s logo on our website;"
                    "\n\n0.3.5. for any other purpose disclosed by us when you provide the information;"
                    "\n\n0.3.6. with your consent in any other cases;"
                    "\n\n0.3.7. if we believe disclosure is necessary or appropriate to protect the rights, property, or safety of the Company, our customers, or others.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("SECURITY OF DATA",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nThe security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("SERVICE PROVIDERS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may employ third party companies and individuals to facilitate our Service (“Service Providers”), provide Service on our behalf, perform Service-related services or assist us in analysing how our Service is used."
                    "\n\nThese third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("ANALYTICS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may use third-party Service Providers to monitor and analyze the use of our Service.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CI/CD TOOLS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may use third-party Service Providers to automate the development process of our Service.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("BEHAVIORAL REMARKETING",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may use remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimise and serve ads based on your past visits to our Service.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("PAYMENTS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may provide paid services within Service. In that case, we use third-party services for payment processing (e.g. razorpay)."
                    "\n\nWe will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CHILDREN'S PRIVACY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nOur Services are not intended for use by children under the age of 18 (“Child” or “Children”)."
                    "\n\nWe do not knowingly collect personally identifiable information from Children under 18. If you become aware that a Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from Children without verification of parental consent, we take steps to remove that information from our servers.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CHANGES TO THIS PRIVACY POLICY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page."
                    "\n\nWe will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update “effective date” at the top of this Privacy Policy."
                    "\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CONTACT US",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nIf you have any questions about this Privacy Policy, please contact us by email: info@axonifytech.com.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
              ],
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }
}
