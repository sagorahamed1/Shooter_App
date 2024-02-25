import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String title;
  final Color color;
  const CustomButton({
    super.key,
    required this.title,
    required this.onpress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: 345.w,
        height: 52.h,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              color: Colors.white,
              fontsize: 20.h,
              fontName: 'Aldrich',
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
