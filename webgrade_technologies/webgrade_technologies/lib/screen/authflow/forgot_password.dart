import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webgrade_technologies/screen/authflow/login_screen.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/commonFunction.dart';
import 'package:webgrade_technologies/utils/constant.dart';
import 'package:webgrade_technologies/utils/flutter_flow_animations.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';
import 'package:webgrade_technologies/utils/form_field_style.dart';
import 'package:webgrade_technologies/utils/no_space_input_formatter_class.dart';


import '../../utils/validator_utils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isButtonEnabled = false;
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  bool isEmailFieldFocused = false;
  bool isLoading = false;
  final FocusNode _emailFocusNode = FocusNode();
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
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    print('displayType>> $displayType');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColour,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(140.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: (displayType == 'desktop' ||  displayType == 'tablet') ? 50 : 20),
                  children: [

                    const SizedBox(height:75),
                    Center(
                      child: Text(
                        Constants.ForgotPassTxt,
                        style: FTextStyle.HeadingTxtStyle.copyWith(fontSize: 27,fontWeight: FontWeight.w600),
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    const SizedBox(height:30),
                    Center(
                      child: Text(
                        Constants.ForgotPassSubTxt,
                        style: FTextStyle.formSubheadingTxtStyle,
                        textAlign: TextAlign.center, // Aligning text to center
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),

                    Padding(
                      padding: const EdgeInsets.only(top:40,bottom:15),
                      child: Form(
                          onChanged: () {
                            if (ValidatorUtils.isValidEmail(_email.text)) {
                              setState(() {
                                isButtonEnabled = true;
                              });
                            } else {
                              setState(() {
                                isButtonEnabled = false;
                              });
                            }
                            if (isEmailFieldFocused == true) {
                              _emailKey.currentState!.validate();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Constants.emailLabel,
                                style: FTextStyle.formLabelTxtStyle,
                              ).animateOnPageLoad(animationsMap[
                              'imageOnPageLoadAnimation2']!),
                              const SizedBox(height: 5,),
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: _emailKey,
                                  focusNode: _emailFocusNode,
                                  decoration: FormFieldStyle
                                      .defaultemailDecoration,
                                  inputFormatters: [NoSpaceFormatter()],
                                  controller: _email,
                                  validator: ValidatorUtils.emailValidator,
                                  onTap: () {
                                    setState(() {
                                      isEmailFieldFocused = true;
                                    });
                                  }
                              ),
                              const SizedBox(height: 15,),
                            ],
                          )
                      ),
                    ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white70, // Shadow color with opacity
                          spreadRadius: 1, // Amount of shadow spread

                        )
                      ],
                      borderRadius: BorderRadius.circular(12), // Rounded corners if desired
                    ),
                    width: double.infinity, // Ensure the container takes full width
                    height: (displayType == 'desktop' || displayType == 'tablet') ? 70 : 50,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () async {
                        setState(() {
                          isLoading = true;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                        // BlocProvider.of<AuthenticationBloc>(context).add(
                        //   LoginEventHandler(
                        //     email: _email.text.toString(),
                        //     password: _password.text.toString(),
                        //   ),
                        // );
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: isButtonEnabled
                            ? AppColors.primaryColour
                            : AppColors.drawerdisableButtonColor,
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: FTextStyle.loginBtnStyle,
                        ),
                      ),
                    ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!,
                    ),
                  ).animateOnPageLoad(animationsMap[
                    'imageOnPageLoadAnimation2']!),
                    const SizedBox(height:20),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go back to",
                            style: FTextStyle.formLabelTxtStyle,
                          ),
                          Text(
                            Constants.signintoAccountTxt,
                            style: FTextStyle.authlogin_signupTxtStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
