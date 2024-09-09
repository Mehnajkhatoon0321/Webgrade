import 'package:flutter/material.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';

class AttendanceApply extends StatefulWidget {
  const AttendanceApply({super.key});

  @override
  State<AttendanceApply> createState() => _AttendanceApplyState();
}

class _AttendanceApplyState extends State<AttendanceApply> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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
          'Attendance ',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ), // Title of the app bar
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: const Center(
        child: Text('Welcome to Apply Page'),
      ),
    );
  }
}
