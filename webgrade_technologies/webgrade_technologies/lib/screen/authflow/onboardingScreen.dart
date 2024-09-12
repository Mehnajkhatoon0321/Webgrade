import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webgrade_technologies/screen/authflow/login_screen.dart';
import 'package:webgrade_technologies/utils/colours.dart';

import '../../utils/font_text_Style.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onBoardingList = [
    {
      "image": "assets/images/onboard.png",
      "title": "Mobile Application ",
      "desc":
      "A mobile application developer is a skilled professional who creates, tests, and maintains software applications for mobile devices, ensuring seamless functionality and a superior user experience through expertise in coding, design principles, and platform-specific guidelines.",
    },
    {
      "image": "assets/images/onboard1.png",
      "title": "Web Development ",
      "desc":
      "A web developer designs, builds, and maintains websites and web applications, ensuring they are visually appealing, user-friendly, and optimized for performance across various devices and browsers, utilizing skills in coding, design, and front-end and back-end technologies.",
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Graphic Designer",
      "desc":
      "A graphic designer creates visually compelling designs for print and digital media, using artistic skills and design software to craft engaging visuals that communicate messages, brand identities, and concepts effectively.",
    },
  ];

  void onNext() {
    if (currentIndex < onBoardingList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
        const LoginScreen(),),
      );
    }
  }

  @override
  void initState() {
    currentIndex = 0;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    // Background content
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(295.r),
                              bottomRight: Radius.circular(2.r),
                            ),
                            child: Image(
                              image: AssetImage(onBoardingList[index]['image']!),
                              width: double.infinity,
                              height: mediaQuery.height * 0.4,
                              fit: BoxFit.fill, // Changed to cover for better fit
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              onBoardingList[index]['title']!,
                              style: FTextStyle.aboutUsText2,
                              textAlign: TextAlign.center, // Center aligned for title
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              onBoardingList[index]['desc']!,
                              style: FTextStyle.Faqssubtitle,
                              textAlign: TextAlign.center, // Center aligned for description
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Skip button
                    Positioned(
                      top: 30.h, // Adjust this value to position the button vertically
                      right: 10.w, // Adjust this value to position the button horizontally
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text(
                          currentIndex == onBoardingList.length - 1
                              ? ""
                              : "Skip",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingList.length,
                  effect: ExpandingDotsEffect(
                    paintStyle: PaintingStyle.fill,
                    dotColor: AppColors.dotColor,
                    dotWidth: 10.w,
                    dotHeight: 10.h,
                    activeDotColor: AppColors.activeDotColor,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: GestureDetector(
                      onTap: onNext,
                      child: Container(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColour,
                          borderRadius: BorderRadius.circular(mediaQuery.height),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentIndex == onBoardingList.length - 1
                                    ? "Get Started"
                                    : "Next   ",
                                style: FTextStyle.loginBtnStyle,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 19.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 60.w),
                //   child: GestureDetector(
                //     onTap: () {
                //       if (currentIndex == onBoardingList.length - 1) {
                //
                //       } else {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(builder: (context) =>
                //           const LoginScreen()),
                //         );
                //       }
                //     },
                //     child: SizedBox(
                //       width: double.infinity,
                //       height: 52.h,
                //       child: Center(
                //         child: Text(
                //           currentIndex == onBoardingList.length - 1
                //               ? ""
                //               : "Skip",
                //           style: FTextStyle.drawerText,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}