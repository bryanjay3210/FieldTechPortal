import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared_widgets/shared_app_bar.dart';
import '../../utils/utils/theme/global_colors.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const location = 'lib/assets/images/main/';
    return Scaffold(
        appBar: appBarShared('Privacy Policy', null),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 80,
                width: size.width,
                decoration: const BoxDecoration(
                  color: ftGreyDark,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Image.asset('${location}mdu1.png'),
                ),
              ),

              //Privacy Policy Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: ftPrimaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'PRIVACY POLICY',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: ftTextBlack,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Effective: June 1, 2020',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'MDU1 recognizes its responsibility to help protect personally identifiable information collected about visitors to the MDU1 website. This Privacy Policy describes the personally identifiable information we collect online and how we use and protect this information.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Collection Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'COLLECTION OF PERSONALLY IDENTIFIABLE INFORMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We collect personally identifiable information when you complete online forms on this website. The types of personally identifiable information that we collect include: first and last name; home and email addresses; and telephone number. We may also collect additional personally identifiable information if you choose to respond to a voluntary customer survey or enter a sweepstakes or contest offered through this site, or if you request changes to your service through one of our customer service representatives. We also will collect your email address if you choose to ask a question or provide feedback online.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We also may collect non-personally identifiable information when you visit this website. When you access the MDU1 Internet portal page or other MDU1 websites, MDU1 and its affiliates, partners, and advertisers may place small text files or “cookies” on your computer’s hard drive. These cookies, which store only the zip code you have entered, provide information about your activities on our site so that we may provide you with customized content and facilitate your use of the site. Third parties, including our affiliates, partners, and advertisers, may also place cookies on your computer. These cookies collect anonymous information in order to provide information about goods and services that may be of interest to you. Accepting all cookies is voluntary, and you may still use this site if you decline our cookies – although you may not be able to access certain services that we offer. You can also manually delete cookies once they are placed onto your computer. Consult your web browser for instructions on how to decline and/or delete cookies.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We may also collect information about your interests when you choose to click on links in the commercial e-mail messages that we send you. MDU1 does not collect any information that you provide when you visit a particular website; we simply seek to understand the links that you found of interest in our commercial e-mail messages so that we can send you information that may be of interest. MDU1 also does not collect personally identifiable information through this process unless you voluntarily provide it (such as through a sweepstakes entry form), and you can choose not to receive any commercial e-mail messages we send through opt-out links that are provided in every such message.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MDU1 does not routinely monitor the activity of user accounts except for measurements of system utilization, general statistical analyses, and the preparation of billing records and logs, which result in the gathering of minimal personally identifiable information, including names and e-mail addresses of visitors to this website.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Personal Identifiable Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'USE OF PERSONALLY IDENTIFIABLE INFORMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We use the personally identifiable information we collect to make sure you receive the products and services you requested; to send your bills and credit you for payments; to respond promptly to your questions, complaints, and requests for changes in service; to help resolve any service or maintenance problems; to protect the security of our equipment and services; to ensure compliance with applicable laws; to prevent the unauthorized reception of service; and to investigate activity that violates our Terms and Conditions. We may also use your personally identifiable information to send you program or service listings, new product or service offerings, special announcements, and other information we think you may want on behalf of MDU1 or third parties. We do not disclose any of your personally identifiable information when we send you information on behalf of third parties, and you can always choose to opt out of receiving commercial e- mail announcements that we send about our own products or services or those of third parties by clicking on the opt-out link provided in every such e-mail communication.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Disclosure Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'DISCLOSURE OF PERSONALLY IDENTIFIABLE INFORMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MDU1 will not disclose your personally identifiable information to third parties for purposes unrelated to those for which the information was collected without your permission except to respond to proper requests for information from government or judicial officials investigating illegal activity, in the event of bankruptcy or a sale of substantially all or some of the assets of MDU1, to protect the personal safety of its subscribers or the public, to protect and defend the rights or property of MDU1 or our subscribers, or to otherwise comply with the law. MDU1 may share your personally identifiable information with entities affiliated with us through common ownership or control.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Review and Update Personal Identification Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'RIGHT TO REVIEW AND UPDATE PERSONALLY IDENTIFIABLE INFORMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We will maintain personally identifiable information about you only so long as it is necessary for the purpose for which it was collected or to comply with laws governing our business. This period of time could be as long as seven years for our tax and accounting needs. Thereafter, such information will be destroyed unless there are legitimate pending requests for access to such information.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Security Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'SECURITY OF PERSONALLY IDENTIFIABLE INFORMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MDU1 highly prioritizes the security of your personally identifiable information. While no website can guarantee security, we employ security technologies and procedures to help protect the confidentiality of your personally identifiable information.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Security Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'CHILDREN’S PRIVACY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Our website is a general audience site, and we do not knowingly collect personally identifiable information from children under thirteen years of age. If, as a part of future service offerings, we decide to request personally identifiable information from children under thirteen, we will require verifiable parental consent before we collect this information as required by applicable law. Should a child whom we know to be under thirteen send personal information to us, we will use that information only to respond to that child to inform him or her that we must have parental consent before receiving his or her personal information.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //THIRD-PARTY WEBSITES Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'THIRD-PARTY WEBSITES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'There are several places throughout our website where you may accept a link to other websites that do not operate under our privacy practices. When you click through to these websites, our privacy policies and practices no longer apply. We recommend that you examine the privacy policies of all third-party websites before engaging in any transactions with them to understand their procedures for collecting, using, and disclosing your information.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //CHANGES TO OUR PRIVACY POLICY Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'CHANGES TO OUR PRIVACY POLICY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We may modify or update our services from time to time, and if necessary, the provisions of this privacy statement. In the case of material changes to our privacy practices, we will post changes to our privacy policy here for a period of time before such changes become effective.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //CONTACT US Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'CONTACT US',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'If you have questions about this Privacy Statement or any other services we provide, please contact us. This website is intended for use by residents of the United States who are over 18 years of age.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'There are several places throughout our website where you may accept a link to other websites that do not operate under our privacy practices. When you click through to these websites, our privacy policies and practices no longer apply. We recommend that you examine the privacy policies of all third-party websites before engaging in any transactions with them to understand their procedures for collecting, using, and disclosing your information.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'CUSTOMER PROPRIETARY NETWORK INFORMATION (“CPNI”)',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Another aspect of MDU1’s privacy policy relates exclusively to phone information. Federal regulations require that a company providing voice services inform its customers regarding specific protections it establishes for information about the quantity, technical configuration, type, destination, location, and amount of a service used by customers as well as other information contained in the phone bill pertaining to the service received by the customer such as charges and account number. This information when associated with a particular customer is known as “Customer Proprietary Network Information” or “CPNI”. It does not include names, addresses and telephone numbers (unless unlisted) because such information is generally publicly available. In addition, it does not include aggregate information of many customers so long as it does not identify any particular customer.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'In order to protect the confidentiality of your CPNI, we have instituted the following procedures. We follow standard security practices in the industry. We have technical responses in place to resist brute force attacks on our servers as well as other outside attacks on the security of our data. We have taken steps to secure the physical location of our data from all outsiders as well as non-authorized individuals within MDU1. Policies in place impose restrictions on the use and disclosure of customer information, and training is in place to disseminate these policies and refresh them. Of course, no amount of prudent and careful security measures can completely guarantee that every unauthorized attempt to access CPNI will be driven back.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'To add another layer of protection, we will not disclose your CPNI to anyone outside of MDU1 without your consent. This includes company affiliates, unless you are also a customer of that affiliate. If we receive a call from someone purporting to be you, we will not release your CPNI over the phone, but will require the caller to make the request in person at a local MDU1 office in order to confirm identity. If you are a MDU1 Internet customer, you may access your CPNI online with a user ID and password. If you call to discuss your own CPNI, we will review it with you but we will not discuss any of your protected information that you do not reveal to us.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We may use or disclose your CPNI without your permission for limited reasons such as to provide necessary services and support such as maintenance and billing for the phone service you currently have as well as market new or additional adjunct offerings for the phone service you currently have such as call blocking and caller ID. We may also disclose your CPNI in response to a proper legal demand for the information and to protect MDU1, its customers or other parties against fraudulent, abusive or unlawful use of its services.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'While the rules regarding CPNI prohibit the use of CPNI in marketing campaigns without your consent, we have elected not to use CPNI for marketing. Should that decision change, we will notify you and provide you with the opportunity to grant or deny consent to our use of your CPNI in our marketing campaigns.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //DO NOT CALL POLICY Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'DO NOT CALL POLICY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'As part of its general business practice and in compliance with laws and regulations governing telemarketing and consumers’ rights to privacy, MDU1 has instituted the following Do Not Call policy.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'It is the policy of MDU1 that outbound sales calls will not be made to any person who has communicated a desire to us not to receive telephone solicitations or to any person who is on a state or federal Do Not Call list, except as permitted by law. The company reserves the right to make telephone solicitations in the absence of notification.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MDU1 maintains a record of the name and telephone number(s) for consumers who do not wish to be called or contacted. MDU1 and its agents use this internal list as well as the National Do Not Call list and relevant state Do Not Call lists to prevent calls to individuals on these lists. At least quarterly, MDU1 or its telemarketing agents check and update the internal list against all relevant state and federal Do Not Call registries.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'You may contact MDU1, either by phone or in writing, to request to be added to our Do Not Call list. Whether you call or write, you must specifically request to be placed on MDU1’s Do Not Call list and provide your name, address and all telephone number(s) you wish to be included in the list. Your number will be placed on our Do Not Call list within five (5) days of receipt.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Please notify us if there are any changes to your telephone number during that time. If you obtain a new telephone number, you must give us that new number if you want your “do not call” status to remain in effect.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Please note that the law permits MDU1 to contact its customers for non-solicitation purposes, such as surveys, billing issues or service-related matters.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Customers may request a copy of this Policy by contacting MDU1',
                      style: TextStyle(
                        fontSize: 16,
                        color: ftTextColorBody,
                      ),
                    ),
                  ],
                ),
              ),

              //Privacy Policy Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                decoration: const BoxDecoration(
                  color: Color(0xFF50555C),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image:
                          AssetImage("lib/assets/images/main/mdu1_yellow.png"),
                      width: 87,
                      color: ftPrimaryColor,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'MDU1, LLC. \n P.O. Box 725072  \n Atlanta, GA 31139',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ftGreyLight100,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'PRODUCTS & SOLUTIONS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: ftWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MDUWare™ \n Call Center \n Access Control & Security Cameras \n Bulk Services – Internet / TV / Voice \n IPTV Services \n Public Safety DAS \n Shared Fiber Riser',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: ftGreyLight100,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'ABOUT US',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: ftWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Why Choose Us \n How We Work \n Company',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ftGreyLight100,
                      ),
                    ),
                  ],
                ),
              ),

              //Privacy Policy Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                decoration: const BoxDecoration(
                  color: ftGreyDark100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.phone,
                                color: ftGreyLight100,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '+1.844.990.6381',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ftGreyLight100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.phone_android,
                                color: ftGreyLight100,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '+1.844.940.6381',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ftGreyLight100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Terms and Conditions \n Acceptable Use Policy \n Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: ftGreyLight100,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Copyright © 2020 MDU1, LLC. All Rights Reserved. MDU1, the MDU1 logo, and all MDU1 product names are trademarks or service marks of MDU1, LLC. Made with love in USA.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: ftGreyLight100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
