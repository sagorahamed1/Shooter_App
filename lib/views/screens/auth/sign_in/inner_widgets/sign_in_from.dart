import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shooter_app/routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/dimentions.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../verifyEmailScreen/verify_email_screen.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.1,
      blur: 15,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.r), topLeft: Radius.circular(42.r)),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 2.w, color: AppColors.primaryColor)),
          //border: Border.,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFA1131).withOpacity(0.12),
              const Color(0xFF130D13).withOpacity(1),
            ],
            stops: const [0.0, 2.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ///--------------------------Email and password text field section-------------------------------------------?>
              _TextFieldSection(),

              ///---------------------------------------forgot password--------------------------------->
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgetPasswordScreen);
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: AppString.forgotPass,
                      fontsize: 16.h,
                      color: AppColors.primaryColor,
                      top: 16.h,
                      bottom: 16.h,
                    )),
              ),

              ///-------------------------------------Log In botton------------------------------->
              CustomButton(
                onpress: () {
                  if (formKey.currentState!.validate()) {
                    Get.toNamed(AppRoutes.bottomNavBar);
                  }
                },
                title: AppString.logIn,
                titlecolor: Colors.white,
              ),

              ///--------------------------------or login with text--------------------------------->
              CustomText(
                text: AppString.orLogin,
                fontsize: Dimensions.fontSizeDefault.h,
                top: 16.h,
                bottom: 16.h,
              ),

              ///---------------------------------------google and facebook image------------------------------------------------>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        border: Border.all(color: const Color(0xFFFD92A0))),
                    child: Center(
                        child: SvgPicture.asset(
                      AppIcons.google,
                      width: 24.w,
                      height: 24.h,
                    )),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        border: Border.all(color: const Color(0xFFFD92A0))),
                    child: Center(
                        child: SvgPicture.asset(
                      AppIcons.facebook,
                      width: 24.w,
                      height: 24.h,
                    )),
                  )
                ],
              ),

              SizedBox(
                height: 21.h,
              ),

              ///------------------------------Don’t have an account? Sign up ------------------------>
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppString.dontHave,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: Colors.white,
                        fontFamily: "Aldrich",
                      ),
                    ),
                    TextSpan(
                      text: AppString.signUp,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: AppColors.primaryColor,
                        fontFamily: "Aldrich",
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.signUpScreen);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///-----------------------------text field section---------------------------->
  _TextFieldSection() {
    return Column(
      children: [
        ///--------------------------Email------------------------------------>
        CustomTextField(
          controller: _emailController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.email,
          filColor: AppColors.fieldColor,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your email";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),

        ///--------------------------Password------------------------------------>
        CustomTextField(
          controller: _passController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.password,
          filColor: AppColors.fieldColor,
          sufixicons: _sufixIcon(AppIcons.obscure_true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your password";
            }
            return null;
          },
        ),
      ],
    );
  }

  _sufixIcon(String icon) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset(
        icon,
        width: 12.h,
        height: 12.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
