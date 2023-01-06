import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../utils/responsive.dart';
import '../../../widgets/dot.dart';
import '../controller/policy_page_controller.dart';

class TermsAndConditionsView extends GetView<PolicyPageController> {
  const TermsAndConditionsView({super.key});

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
              "TERMS AND CONDITIONS",
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
              "These Terms of Service (“Terms”, “Terms of Service”) govern your use of our website located at ninedots.axonifytech.com/dashboard (together or individually “Service”) operated by Axonify Tech Systems."
              "\n\nOur Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages."
              "\n\nYour agreement with us includes these Terms and our Privacy Policy (“Agreements”). You acknowledge that you have read and understood Agreements, and agree to be bound of them."
              "\n\nIf you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at info@axonifytech.com so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.",
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(Get.key.currentContext!).size;

    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: true,
          dragDevices: MyCustomScrollBehavior().dragDevices),
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
                        'assets/images/terms_and_conditions.jpg',
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
                        'assets/images/terms_and_conditions.jpg',
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
                const Text("COMMUNICATIONS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nBy using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at info@axonifytech.com.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CONTESTS, SWEEPSTAKES AND PROMOTIONS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nAny contests, sweepstakes or other promotions (collectively, “Promotions”) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CONTENT",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nOur Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (“Content”). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness."
                    "\n\nBy posting Content on or through Service, You represent and warrant that: Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright."
                    "\n\nYou retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms."
                    "\n\nAxonify Tech Systems has the right but not the obligation to monitor and edit all Content provided by users."
                    "\n\nIn addition, Content found on or through this Service are the property of Axonify Tech Systems or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("PROHIBITED USERS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nYou may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:"
                    "\n\n0.1. In any way that violates any applicable national or international law or regulation."
                    "\n\n0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise."
                    "\n\n0.3. To transmit, or procure the sending of, any advertising or promotional material, including any “junk mail”, “chain letter,” “spam,” or any other similar solicitation."
                    "\n\n0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity."
                    "\n\n0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity."
                    "\n\n0.6. To engage in any other conduct that restricts or inhibits anyone's use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability."
                    "\n\nAdditionally, you agree not to:"
                    "\n\n0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party's use of Service, including their ability to engage in real time activities through Service."
                    "\n\n0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service."
                    "\n\n0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent."
                    "\n\n0.4. Use any device, software, or routine that interferes with the proper working of Service."
                    "\n\n0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful."
                    "\n\n0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service."
                    "\n\n0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack."
                    "\n\n0.8. Take any action that may damage or falsify Company rating."
                    "\n\n0.9. Otherwise attempt to interfere with the proper working of Service.",
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
                const Text("NO USE BY MINORS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nService is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("ACCOUNTS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWhen you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service."
                    "\n\nYou are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account."
                    "\n\nYou may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.\n\nWe reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("INTELLECTUAL PROPERTY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of Axonify Tech Systems and its licensors. Service is protected by copyright, trademark, and other laws of and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of Axonify Tech Systems.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("COPYRIGHT POLICY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (“Infringement”) of any person or entity."
                    "\n\nIf you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to info@axonifytech.com, with the subject line: “Copyright Infringement”"
                    "\n\nYou may be held accountable for damages (including costs and attorneys fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("ERROR REPORTING AND FEEDBACK",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nYou may provide us either directly at info@axonifytech.com or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (“Feedback”). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("LINK TO OTHER WEBSITES",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nOur Service may contain links to third party web sites or services that are not owned or controlled by Axonify Tech Systems."
                    "\n\nAxonify Tech Systems has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites."
                    "\n\nYOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES."
                    "\n\nWE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("DISCLAIMER OF WARRANTY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nTHESE SERVICES ARE PROVIDED BY COMPANY ON AN “AS IS” AND “AS AVAILABLE” BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK."
                    "\n\nNEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS."
                    "\n\nCOMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE."
                    "\n\nTHE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("LIMITATIONS OF LIABILITY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nEXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS’ FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("TERMINATION",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms."
                    "\n\nIf you wish to terminate your account, you may simply discontinue using Service."
                    "\n\nAll provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("GOVERNING LAW",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nThese Terms shall be governed and construed in accordance with the laws of India, which governing law applies to agreement without regard to its conflict of law provisions."
                    "\n\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("CHANGES TO SERVICE",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("AMENDMENTS TO TERMS",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nWe may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically."
                    "\n\nYour continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you."
                    "\n\nBy continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("WAIVER AND SEVERABILITY",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nNo waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision."
                    "\n\nIf any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(height: screenSize.height / 16),
                const Text("ACKNOWLEDGMENT",
                    style: TextStyle(
                        fontFamily: 'MontserratBold',
                        color: Colors.black,
                        fontSize: 16)),
                const Text(
                    "\nBY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.",
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
