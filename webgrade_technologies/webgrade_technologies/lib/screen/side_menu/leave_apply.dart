import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:webgrade_technologies/screen/side_menu/leave_list.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/commonFunction.dart';
import 'package:webgrade_technologies/utils/flutter_flow_animations.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';
import 'package:webgrade_technologies/utils/form_field_style.dart';
import 'package:webgrade_technologies/utils/no_space_input_formatter_class.dart';
import 'package:webgrade_technologies/utils/validator_utils.dart';

class LeaveApply extends StatefulWidget {
  const LeaveApply({super.key});

  @override
  State<LeaveApply> createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply> {
  late final formKey = GlobalKey<FormState>();

  late final TextEditingController customerPrice = TextEditingController();

  late final TextEditingController productCategory = TextEditingController();

  late final TextEditingController descriptions = TextEditingController();
  late final TextEditingController warranty = TextEditingController();
  late final TextEditingController gst = TextEditingController();
  late final TextEditingController remark = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _modelKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _customerPriceKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _productCategoryKey =
  GlobalKey<FormFieldState<String>>();

  late final GlobalKey<FormFieldState<String>> _descriptionsKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _warrantyKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _gstKey =
  GlobalKey<FormFieldState<String>>();

  late final FocusNode _modelNode = FocusNode();
  late final FocusNode _customerPriceNode = FocusNode();

  late final FocusNode _productCategoryNode = FocusNode();


  late final FocusNode _descriptionNode = FocusNode();
  late final FocusNode _warrantyNode = FocusNode();
  late final FocusNode _gstNode = FocusNode();




  bool isButtonEnabled = false;

  String? selectedProductCategory;
  String? selectedDayTypes;
  String? selectedDomain;
  String? selectedBrand;


  bool isModelFieldFocused = false;
  bool isCustomerPriceFieldFocused = false;
  bool isDealerFocused = false;
  bool isProductCategoryFieldFocused = false;
  bool isDayTypesFieldFocused = false;
  bool isDomainFieldFocused = false;
  bool isBrandFieldFocused = false;
  bool isDescriptionFieldFocused = false;
  bool isWarrantyFieldFocused = false;
  bool isGstFieldFocused = false;
  bool isRemarkFieldFocused = false;


  List<String> productCategories = [
    'Sick Leaves',
    'Casuals Leaves',
    'Restricted Leaves',
    'Annual Leave',
    'Maternity Leave',
    'Paternity Leave',
    'Compensatory Leave',
    'Public Holidays',
    'Unpaid Leave',
    'Sabbatical Leave',
    'Bereavement Leave',
    'Study Leave',
    'Medical Leave'
  ];


  bool isLoading = false;

  String productCategoryText = "";




  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

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
  void _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      // Format the date to dd-MM-yyyy
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      setState(() {
        remark.text = formattedDate;
      });
    }
  }
  void _selectDateTo(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      // Format the date to dd-MM-yyyy
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      setState(() {
        warranty.text = formattedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

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
          'Leave Apply ',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ), // Title of the app bar
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment:CrossAxisAlignment.center ,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15,left: 20,right: 20),
            child: Form(

              onChanged: () {
                if ( selectedProductCategory != null &&
                    selectedProductCategory!.isNotEmpty &&
                    ValidatorUtils.isValidDate(remark.text) &&
                    ValidatorUtils.isValidDate(warranty.text) &&
                    ValidatorUtils.isValidCommon(customerPrice.text) &&
                    ValidatorUtils.isValidCommon(gst.text) &&
                    ValidatorUtils.isValidCommon(descriptions.text)
                ) {
                  setState(() {
                    isButtonEnabled = true;
                  });
                } else {
                  setState(() {
                    isButtonEnabled = false;
                  });
                }
                if (isProductCategoryFieldFocused == true) {
                  _productCategoryKey.currentState!.validate();
                }


                if (isWarrantyFieldFocused == true) {
                  _warrantyKey.currentState!.validate();
                } if (isCustomerPriceFieldFocused == true) {
                  _customerPriceKey.currentState!.validate();
                } if (isGstFieldFocused == true) {
                  _gstKey.currentState!.validate();
                } if (isDescriptionFieldFocused == true) {
                  _descriptionsKey.currentState!.validate();
                }






              },


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "From Date",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _modelKey,
                      focusNode: _modelNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "dd-mm-yyyy",
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.calendar_today, // Calendar icon
                            color: Colors.grey, // Adjust color as needed
                          ),
                          onPressed: () {
                            // Show date picker when the icon is pressed
                            _selectDate(context);
                          },
                        ),
                      ),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: remark,
                      validator: ValidatorUtils.dateValidator,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = true;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!,
                    ),
                  ),


                  Text(
                    "To Date",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _warrantyKey,
                      focusNode: _warrantyNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "dd-mm-yyyy",
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.calendar_today, // Calendar icon
                            color: Colors.grey, // Adjust color as needed
                          ),
                          onPressed: () {
                            // Show date picker when the icon is pressed
                            _selectDateTo(context);
                          },
                        ),
                      ),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: warranty,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = true;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),

                  Text(
                    "Leave Type",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      key: _productCategoryKey,
                      focusNode: _productCategoryNode,
                      value: selectedProductCategory,
                      hint: const Text("Select Leave Types",style: FTextStyle.formhintTxtStyle,),
                      items: productCategories
                          .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                          .toList(),
                      onChanged: (newValue) {


                        setState(() {
                          selectedProductCategory = newValue;

                        });


                        isProductCategoryFieldFocused=true;
                        isBrandFieldFocused=false;
                        isModelFieldFocused = false;
                        isCustomerPriceFieldFocused = false;
                        isDealerFocused = false;
                        isDescriptionFieldFocused = false;
                        isWarrantyFieldFocused = false;
                        isGstFieldFocused = false;
                        isRemarkFieldFocused = false;

                      },
                      decoration:FormFieldStyle.dropDown,

                      validator: ValidatorUtils.model,
                    ),
                  ),












                  Text(
                    "Leave Reasons ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _customerPriceKey,
                      focusNode: _customerPriceNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter leave reasons"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: customerPrice,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = true;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),

                  Text(
                    "Work Handover ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _gstKey,
                      focusNode: _gstNode,
                      keyboardType: TextInputType.text,
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(hintText: "Enter work hand over"),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: gst,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused=false;
                          isBrandFieldFocused=false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = false;

                          isGstFieldFocused = true;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),




















                  Text(
                    "Leaves Description ",
                    style: FTextStyle.formLabelTxtStyle,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: _descriptionsKey,
                      focusNode: _descriptionNode,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4, // Allows for multiple lines
                      decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                        hintText: "Enter description",
                      ),
                      inputFormatters: [NoSpaceFormatter()],
                      controller: descriptions,
                      validator: ValidatorUtils.model,
                      onTap: () {
                        setState(() {
                          isProductCategoryFieldFocused = false;
                          isBrandFieldFocused = false;
                          isModelFieldFocused = false;
                          isWarrantyFieldFocused = false;
                          isCustomerPriceFieldFocused = false;
                          isDealerFocused = false;
                          isDescriptionFieldFocused = true;
                          isGstFieldFocused = false;
                          isRemarkFieldFocused = false;
                        });
                      },
                    ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!,
                    ),
                  )

                ],
              ),
            ),
          ),

          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              height:
              (displayType == 'desktop' || displayType == 'tablet')
                  ? 70
                  : 52,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () async {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const LeaveList(),
                    ),
                  );

                }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  backgroundColor: isButtonEnabled
                      ? AppColors.primaryColour
                      : AppColors.drawerdisableButtonColor,
                ),
                child: Text(
                  'Apply' ,
                  style: FTextStyle.loginBtnStyle,
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
