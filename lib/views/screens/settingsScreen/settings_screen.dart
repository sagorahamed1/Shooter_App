import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_list_tile.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.settings,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.changepasswordScreen);
              },
              child: CustomListTile(
                title: AppString.changePassword,
                prefixIcon: SvgPicture.asset(
                  AppIcons.lock,
                  color: Colors.white,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {},
              child: CustomListTile(
                title: AppString.privacyPolicy,
                prefixIcon: SvgPicture.asset(
                  AppIcons.privacy,
                  color: Colors.white,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {},
              child: CustomListTile(
                title: AppString.termsConditions,
                prefixIcon: SvgPicture.asset(
                  AppIcons.terms,
                  color: Colors.white,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {},
              child: CustomListTile(
                title: AppString.aboutUs,
                prefixIcon: SvgPicture.asset(
                  AppIcons.about,
                  color: Colors.white,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
