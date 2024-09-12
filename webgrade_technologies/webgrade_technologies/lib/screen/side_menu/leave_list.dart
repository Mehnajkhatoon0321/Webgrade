import 'package:flutter/material.dart';
import 'package:webgrade_technologies/screen/side_menu/leave_apply.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({super.key});

  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  final TextEditingController _controller = TextEditingController();
  bool _isTextEmpty = true;
  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }
  List<Map<String, dynamic>> listItem = [
    {'dateFrom': '12-08-2003','toDate': '02-08-2003',"typesLeave":"Casual Leave ","mobileNumber":"9695844884","status":"Success"},
    {'dateFrom': '12-08-2003','toDate': '02-08-2003',"typesLeave":"Casual Leave ","mobileNumber":"9695844884","status":"Success"},
    {'dateFrom': '12-08-2003','toDate': '02-08-2003',"typesLeave":"Casual Leave ","mobileNumber":"9695844884","status":"Success"},
    {'dateFrom': '12-08-2003','toDate': '02-08-2003',"typesLeave":"Casual Leave ","mobileNumber":"9695844884","status":"Success"},
    {'dateFrom': '12-08-2003','toDate': '02-08-2003',"typesLeave":"Casual Leave ","mobileNumber":"9695844884","status":"Success"},


  ];
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add, // Icon for applying leave
              color: Colors.white,
              size: 38,
            ),
            onPressed:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LeaveApply()),
              );
            }, // Trigger leave application
          ),
        ],
        title: Text(
          'Leave List',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ), // Title of the app bar
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search ',
                  hintStyle: FTextStyle.formhintTxtStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide: const BorderSide(color: AppColors.FormFieldHintColour, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide: const BorderSide(color: AppColors.FormFieldHintColour, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                    borderSide: const BorderSide(color: AppColors.primaryColour, width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 18.0),
                  suffixIcon: _isTextEmpty
                      ? const Icon(Icons.search, color: AppColors.FormFieldHintColour)
                      : IconButton(
                    icon: const Icon(Icons.clear, color: AppColors.FormFieldHintColour),
                    onPressed: _clearText,
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _isTextEmpty = value.isEmpty;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listItem.length, // Number of items in the list
              itemBuilder: (context, index) {
                final item = listItem[index];
                return
                  Container(


                    decoration: BoxDecoration(
                      color:Colors.white, // Background color
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      border: Border.all(

                        color: Colors.black, // Border color
                        width: 3, // Border width
                      ), boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 9, // Blur radius
                        offset: const Offset(0, 3), // Offset from the container
                      ),
                    ],
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Sr. No. : ", style: FTextStyle.listTitle),
                              Text("${index + 1}", style: FTextStyle.listTitleSub),
                            ],
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              const Text("Leaves Types: ", style: FTextStyle.listTitle),
                              Text("${item["typesLeave"]}", style: FTextStyle.listTitleSub),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text("Leave Status: ", style: FTextStyle.listTitle),
                              Text("${item["status"]}", style:item["status"]=="Success"? FTextStyle.listTitleSub.copyWith(color: Colors.green):FTextStyle.listTitleSub.copyWith(color: Colors.red)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text("Mobile Number: ", style: FTextStyle.listTitle),
                              Text("${item["mobileNumber"]}", style: FTextStyle.listTitleSub),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text("From Date: ", style: FTextStyle.listTitle),
                                  Text("${item["dateFrom"]}", style: FTextStyle.listTitleSub),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("TO Date: ", style: FTextStyle.listTitle),
                                  Text("${item["toDate"]}", style: FTextStyle.listTitleSub),
                                ],
                              ),
                            ],
                          ),



                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
