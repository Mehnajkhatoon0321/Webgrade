import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:geolocator/geolocator.dart' as geo;
import 'package:webgrade_technologies/screen/authflow/login_screen.dart';
import 'package:webgrade_technologies/screen/side_menu/attendance_list.dart';
import 'package:webgrade_technologies/screen/side_menu/leave_list.dart';
import 'package:webgrade_technologies/screen/side_menu/privacy_policy.dart';
import 'package:webgrade_technologies/screen/side_menu/profile_details.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/commonFunction.dart';
import 'package:webgrade_technologies/utils/flutter_flow_animations.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> listItem = [
    {'subtitle': 'Attendance', 'icon': Icons.book_outlined},
    {'subtitle': 'Leave List', 'icon': Icons.book},
    {'subtitle': 'Leave Policy', 'icon': Icons.policy},
    {'subtitle': 'My Profile', 'icon': Icons.person},
    {'subtitle': 'Logout', 'icon': Icons.logout},
  ];

  String buttonText = 'Mark as Attendance';
  String buttonTextLogout = 'Attendance Logout';

  Future<void> _updateButtonText(String buttonType) async {
    try {
      // Fetch current date and time
      final now = DateTime.now();
      final dateFormat = DateFormat('dd-MM-yyyy'); // Date format
      final timeFormat = DateFormat('HH:mm'); // Time format

      final formattedDate = dateFormat.format(now);
      final formattedTime = timeFormat.format(now);

      // Fetch current location
      bool serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Location services are disabled.");
      }

      geo.LocationPermission permission =
      await geo.Geolocator.checkPermission();
      if (permission == geo.LocationPermission.denied) {
        permission = await geo.Geolocator.requestPermission();
        if (permission != geo.LocationPermission.whileInUse &&
            permission != geo.LocationPermission.always) {
          throw Exception("Location permissions are denied.");
        }
      }

      geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high,
      );

      // Get human-readable address
      final placemarks = await geoCoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placemark = placemarks.first;
      final address =
          '${placemark.locality ?? ''}, ${placemark.subLocality ?? ''}'; // Customize as needed

      // Update button text based on buttonType
      setState(() {
        if (buttonType == 'attendance') {
          buttonText = '$formattedDate , $formattedTime , $address';
        } else if (buttonType == 'logout') {
          buttonTextLogout = '$formattedDate , $formattedTime , $address';
        }
      });
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 32,
          ), // Menu icon
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Open the drawer
          },
        ),
        title: Text(
          'Home Page',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ), // Title of the app bar
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: UserAccountsDrawerHeader(
                accountName: Text("Mehnaj Khan", style: FTextStyle.nameProfile),
                accountEmail:
                Text("mehnaj@example.com", style: FTextStyle.emailProfile),
                // currentAccountPicture: const CircleAvatar(
                //   backgroundColor: Colors.white,
                //   child: Icon(Icons.person),
                // ),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColour,
                ),
              ),
            ),


            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: SizedBox(
                height: (displayType == 'desktop' || displayType == 'tablet')
                    ? 70
                    : 52,
                child: ElevatedButton.icon(
                  onPressed: () => {
                    _updateButtonText('attendance'),

                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: AppColors.primaryColour,
                  ),
                  icon: const Icon(Icons.lock_clock_outlined, color: Colors.white),
                  // Icon for logout
                  label: Text(
                    buttonText,
                    style: FTextStyle.loginBtnStyle,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: SizedBox(
                height: (displayType == 'desktop' || displayType == 'tablet')
                    ? 70
                    : 52,
                child: ElevatedButton.icon(
                  onPressed: () => {
                    _updateButtonText('logout')
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: AppColors.primaryColour,
                  ),
                  icon: const Icon(Icons.lock_clock_outlined, color: Colors.white),
                  // Icon for logout
                  label: Text(
                    buttonTextLogout,
                    style: FTextStyle.loginBtnStyle,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!),
            ),
            const SizedBox(height: 9,),
            const Divider(height: 1,color: Colors.black,thickness: 2,),
            ...listItem.map((item) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['subtitle'], style: FTextStyle.FaqsTxtStyle),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer

                      switch (item['subtitle']) {
                        case 'Attendance':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AttendanceList()),
                          );
                          break;
                        case 'Leave List':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LeaveList()),
                          );
                          break;
                        case 'Leave Policy':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                          );
                          break;
                        case 'My Profile':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileDetails()),
                          );
                          break;
                        case 'Logout':
                          _showLogDialog();
                          break;
                        default:
                        // Handle default case if needed
                          break;
                      }
                    },
                  ),
                  const Divider(height: 1,color: Colors.black,thickness: 2,), // Add a divider after each ListTile
                ],
              );
            }),

          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi Mehnaj khatoon',style: FTextStyle.preHeadingBoldStyle,).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Good Day',style: FTextStyle.preHeadingBoldStyle.copyWith(color: Colors.blue,fontSize: 24),),
            ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height/6,
                decoration: BoxDecoration(
                  color:Colors.white, // Background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  border: Border.all(

                    color: Colors.black, // Border color
                    width:5 // Border width
                  ), boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius:4,// Blur radius
                    offset: const Offset(0, 3), // Offset from the container
                  ),
                ],
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Welcome \n lets schedule your day',style: FTextStyle.preHeadingStyle,).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topCenter,

                          child: Image.asset(
                            'assets/images/timer.png',
                            width: (displayType == 'desktop' || displayType == 'tablet')
                                ? 150.w
                                : 200,
                            height: (displayType == 'desktop' || displayType == 'tablet')
                                ? 100.h
                                : 140,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showLogDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Are you sure you want to logout?",
                    style: FTextStyle.preHeadingStyle),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.FormFieldBackColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text("OK",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const LoginScreen(),),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

