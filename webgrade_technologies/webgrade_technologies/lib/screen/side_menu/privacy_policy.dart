import 'package:flutter/material.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ), // Menu icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Leave Policy',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Webgrade Leave Policy",  style:FTextStyle.preHeadingBoldStyle),
            Text(
              '\n'
                  '1. After completing the probation period of 3 months, you will be eligible for 14 earned leaves in a calendar year, pro-rated for the portion of the year worked post-probation.\n\n'
                  '2. For the calendar year 2024, your number of eligible earned leaves will be 3 from 17th September 2024 after the completion of the probation period. This is in addition to any leaves accrued during the probation period.\n\n'
                  '3. Anyone serving the probation period will be entitled for 1 leave in a month.\n\n'
                  '4. Planned leaves (leave for more than 2 days) should be applied in a week advance and will be considered after approval of Manager/ authorities.\n\n'
                  '5. Casual leaves (leave for 1 or 2 days) should be applied at least 2 days in advance and will be considered after approval of Manager/authorities.\n\n'
                  '6. Sick leaves/ emergency leaves should be at least prior intimated to the Manager/ authorities and get approval after resuming the work. In case of more than 3 days of sick leave, a medical certificate is mandatory.\n\n'
                  '7. Any leaves beyond your entitlement will be considered as leave without pay. In this case one-day salary will be deducted per leave. However, the deduction of the salary will be on sole discretion of the management.\n\n'
                ,
              style:FTextStyle.Faqssubtitle
            ),
          ],
        ),
      ),
    );
  }
}

