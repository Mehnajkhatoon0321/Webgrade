import 'package:flutter/material.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({super.key});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {

  final TextEditingController _controller = TextEditingController();
  bool _isTextEmpty = true;
  List<Map<String, dynamic>> listItem = [
    {'date': '12-08-2003', 'inTime': "10:30","outTime":"06:30","day":"Monday","location":"Gomti Nagar"},
    {'date': '12-08-2003', 'inTime': "10:30","outTime":"06:30","day":"Monday","location":"Gomti Nagar"},
    {'date': '12-08-2003', 'inTime': "10:30","outTime":"06:30","day":"Monday","location":"Gomti Nagar"},
    {'date': '12-08-2003', 'inTime': "10:30","outTime":"06:30","day":"Monday","location":"Gomti Nagar"},



  ];
  void _clearText() {
    _controller.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }
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
          'Attendance List',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ), // Title of the app bar
        centerTitle: true,
      ),

      backgroundColor:Colors.white.withOpacity(0.9),
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
                            const Text("Date: ", style: FTextStyle.listTitle),
                            Expanded(child: Text("${item["date"]}", style: FTextStyle.listTitleSub)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("Day: ", style: FTextStyle.listTitle),
                            Text("${item["day"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Location: ", style: FTextStyle.listTitle),
                            Text("${item["location"]}", style: FTextStyle.listTitleSub),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("InTime: ", style: FTextStyle.listTitle),
                                Text("${item["inTime"]}", style: FTextStyle.listTitleSub),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("OutTime: ", style: FTextStyle.listTitle),
                                Text("${item["outTime"]}", style: FTextStyle.listTitleSub),
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
