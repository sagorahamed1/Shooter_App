import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/auth_controller.dart';
import 'package:shooter_app/controller/profileController.dart';
import 'package:shooter_app/helper/prefs_helper.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_constants.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_text.dart';

class DrawerSection extends StatelessWidget {
  DrawerSection({
    super.key,
  });

  final ProfileController _profileController = Get.put(ProfileController());
  final AuthController _authController = Get.put(AuthController());
  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var profileData = _profileController.profileModel.value.data?.attributes;
      return Drawer(
        width: 286.w,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      children: [
                        //=====================================>  Top Section  <=============================
                        Row(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              width: 64.w,
                              height: 64.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: profileData?.image?.publicFileUrl == null
                                  ? Image.asset(
                                      AppImages.profileImg,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl:
                                          "${ApiConstant.imageBaseUrl}/${profileData?.image?.publicFileUrl}",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 125.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: '${profileData?.name}' ?? '',
                                    fontsize: 18.sp,
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomText(
                                    text: '${profileData?.email}' ?? '',
                                    textOverflow: TextOverflow.ellipsis,
                                    fontsize: 16.sp,
                                  ),
                                  SizedBox(height: 8.h),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.profileScreen);
                                    },
                                    child: const CustomText(
                                      text: 'View Profile',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                //=====================================>  MyMatches  Container <=============================
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.myMatchesScreen);
                  },
                  child: CustomListTile(
                    title: AppString.myMatches,
                    borderColor: AppColors.fieldColor,
                    prefixIcon: SvgPicture.asset(
                      AppIcons.myMatch,
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                ),
            
                SizedBox(height: 16.h),
                //=====================================>  My Scores  Container <=============================
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.myScoresScreen);
                  },
                  child: CustomListTile(
                    title: AppString.myScores,
                    borderColor: AppColors.fieldColor,
                    prefixIcon: SvgPicture.asset(
                      AppIcons.myScores,
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                //=====================================>  Subscription  Container <=============================
            
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.subscriptionScreen,);
                  },
                  child: CustomListTile(
                    title: AppString.subscription,
                    borderColor: AppColors.fieldColor,
                    prefixIcon: SvgPicture.asset(
                      AppIcons.subscriptions,
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                //=====================================>  Settings  Container <=============================
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.settingsScreen);
                  },
                  child: CustomListTile(
                    title: AppString.settings,
                    borderColor: AppColors.fieldColor,
                    prefixIcon: SvgPicture.asset(
                      AppIcons.settings,
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                ),
            
                SizedBox(height: 16.h),
            
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed(AppRoutes.libraryScreen);
                //   },
                //   child: CustomListTile(
                //     title: AppString.library,
                //     borderColor: AppColors.fieldColor,
                //     sufixIcon: const Icon(
                //       Icons.keyboard_arrow_down_rounded,
                //       color: Colors.white,
                //     ),
                //     prefixIcon: SvgPicture.asset(
                //       AppIcons.library,
                //       height: 32.h,
                //       width: 32.w,
                //     ),
                //   ),
                // ),
            
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFE7EA).withOpacity(.31),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey, width: .5)),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.zero,
                    controller: controller,
                    leading: SvgPicture.asset(
                      AppIcons.library,
                      height: 32.h,
                      width: 32.w,
                    ),
                    title: CustomText(
                      text: AppString.library,
                      fontsize: 14.h,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    children: <Widget>[
                      ///=================Expansion Tile ====================>
                      ///================Document and photos===================>
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.documentScreen);
                        },
                        child: CustomListTile(
                          title: AppString.document,
                          borderColor: AppColors.fieldColor,
                          prefixIcon: SvgPicture.asset(
                            AppIcons.document,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
            
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.photosScreen);
                        },
                        child: CustomListTile(
                          title: AppString.photo,
                          borderColor: AppColors.fieldColor,
                          prefixIcon: SvgPicture.asset(
                            AppIcons.photos,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 70.h),
                
            
                //====================================> LogOut Section <====================================
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              backgroundColor: Colors.black,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 26.h),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: AppString.doYou,
                                    fontsize: 16.sp,
                                    maxline: 2,
                                  ),
                                  SizedBox(height: 24.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 120.w,
                                          height: 40.h,
                                          child: CustomButton(
                                            title: 'No',
                                            fontSize: 16.h,
                                            onpress: () {
                                              Get.back();
                                            },
                                            color: Colors.white,
                                            titlecolor: AppColors.primaryColor,
                                          )),
                                      SizedBox(
                                          width: 120.w,
                                          height: 40.h,
                                          child: CustomButton(
                                              title: 'Yes',
                                              fontSize: 16.h,
                                              onpress: () async {
                                                await PrefsHelper.remove(AppConstants.isLogged);
                                                await PrefsHelper.remove(AppConstants.userId);
                                                // await PrefsHelper.remove(AppConstants.bearerToken);
                                                await PrefsHelper.remove(AppConstants.subscription);
                                                _authController.googleSignIn.signOut();
                                                Get.offAllNamed(AppRoutes.signInScreen);
                                              })),
                                    ],
                                  )
                                ],
                              ),
                              elevation: 12.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  side: BorderSide(
                                      width: 1.w,
                                      color: AppColors.primaryColor)));
                        });
                  },
                  child: CustomListTile(
                    title: AppString.logOut,
                    borderColor: AppColors.fieldColor,
                    prefixIcon: SvgPicture.asset(
                      AppIcons.logOut,
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
