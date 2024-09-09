import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webgrade_technologies/screen/authflow/forgot_password.dart';
import 'package:webgrade_technologies/screen/home/home.dart';
import 'package:webgrade_technologies/utils/colours.dart';
import 'package:webgrade_technologies/utils/commonFunction.dart';
import 'package:webgrade_technologies/utils/constant.dart';
import 'package:webgrade_technologies/utils/flutter_flow_animations.dart';
import 'package:webgrade_technologies/utils/font_text_Style.dart';
import 'package:webgrade_technologies/utils/form_field_style.dart';
import 'package:webgrade_technologies/utils/no_space_input_formatter_class.dart';
import 'package:webgrade_technologies/utils/pref_utils.dart';
import 'package:webgrade_technologies/utils/validator_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  late final formKey = GlobalKey<FormState>();
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final GlobalKey<FormFieldState<String>> _emailKey =
  GlobalKey<FormFieldState<String>>();
  late final GlobalKey<FormFieldState<String>> _passwordKey =
  GlobalKey<FormFieldState<String>>();
  late final FocusNode _emailFocusNode = FocusNode();
  late final FocusNode _passwordFocusNode = FocusNode();

  bool passwordVisible = true;
  bool checkboxChecked = false;
  bool isButtonEnabled = false;
  bool passIncorrect = false;
  bool emailIncorrect = false;
  String emailError = "";

  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;

  bool isValidPass(String pass) {
    if (pass.isEmpty) {
      return false;
    }
    return true;
  }

  bool isLoading = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();

    String password = PrefUtils.getUserPassword();
    String email = PrefUtils.getUserEmailLogin();

    _password.text = password;
    _email.text = email;

    if (email.isNotEmpty && password.isNotEmpty) {
      rememberMe = PrefUtils.getRememberMe();
      isButtonEnabled = rememberMe;
      checkboxChecked = rememberMe;
    } else {
      rememberMe = false;
      isButtonEnabled = false;
      checkboxChecked = false;
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

    return Scaffold(
      backgroundColor:Colors.black12,

      body:  Center(
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
              (displayType == 'desktop' || displayType == 'tablet')
                  ? 50
                  : 20,
            ),
            child: ListView(

              children: [


                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topCenter,

                  child: Image.asset(
                    'assets/images/applogo.png',
                    width: (displayType == 'desktop' || displayType == 'tablet')
                        ? 450.w
                        : 250,
                    height: (displayType == 'desktop' || displayType == 'tablet')
                        ? 100.h
                        : 140,
                  ),
                ),

                Center(
                  child: Text(
                    Constants.welcomeTxt,
                    style: FTextStyle.HeadingTxtStyle,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Form(

                    onChanged: () {
                      if (ValidatorUtils.isValidEmail(_email.text) &&
                          isValidPass(_password.text)) {
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
                      if (isPasswordFieldFocused == true) {
                        _passwordKey.currentState!.validate();
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          Constants.emailLabel,
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 5),
                        TextFormField(
                          key: _emailKey,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          decoration: FormFieldStyle.defaultemailDecoration,
                          inputFormatters: [NoSpaceFormatter()],
                          controller: _email,
                          validator: ValidatorUtils.emailValidator,
                          onTap: () {
                            setState(() {
                              isEmailFieldFocused = true;
                              isPasswordFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 15),
                        Text(
                          "Password",
                          style: FTextStyle.formLabelTxtStyle,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          key: _passwordKey,
                          focusNode: _passwordFocusNode,
                          decoration: FormFieldStyle
                              .defaultPasswordInputDecoration
                              .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.FormFieldBackColour,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: AppColors.FormFieldBackColour,
                          ),
                          controller: _password,
                          obscureText: !passwordVisible,
                          inputFormatters: [NoSpaceFormatter()],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            } else {
                              return null;
                            }
                          },
                          onTap: () {
                            setState(() {
                              isPasswordFieldFocused = true;
                              isEmailFieldFocused = false;
                            });
                          },
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              checkboxChecked = !checkboxChecked;
                              if (checkboxChecked) {
                                PrefUtils.setRememberMe(true);
                                PrefUtils.setUserEmailLogin(
                                    _email.text.toString());
                                PrefUtils.setUserPassword(
                                    _password.text.toString());
                              } else {
                                PrefUtils.setRememberMe(false);
                                PrefUtils.setUserEmailLogin("");
                                PrefUtils.setUserPassword("");
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: IconTheme(
                              data: const IconThemeData(
                                color: AppColors.primaryColour,
                                size: 21,
                              ),
                              child: Icon(
                                checkboxChecked
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          Constants.rememberMeTxt,
                          style: FTextStyle.rememberMeTextStyle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        Constants.forgotPassword,
                        style: FTextStyle.forgotPasswordTxtStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 65),

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
                        builder: (context) => const HomePage(),
                      ),
                    );

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
                      "Login",
                      style: FTextStyle.loginBtnStyle,
                    ),
                  ),
                ).animateOnPageLoad(
                  animationsMap['imageOnPageLoadAnimation2']!,
                ),
              ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
}}
