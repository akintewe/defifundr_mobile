// 🐦 Flutter imports:
import 'package:defifundr_mobile/core/global/constants/size.dart';
import 'package:defifundr_mobile/core/global/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 📦 Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// 🌎 Project imports:

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.color,
    required this.text,
    this.isActive = true,
    this.gradient,
    this.icon,
    this.iconRtr,
    this.iconSize,
    this.borderRadius,
    required this.textColor,
    this.textSize = 16,
    this.borderColor,
    this.isRounded = false,
    this.preserveIconColor = false,
    required this.onTap,
  });
  final Color? color;
  final String text;
  final bool? isActive;
  final bool? isRounded;
  final String? icon;
  final String? iconRtr;
  final double? iconSize;
  final double? borderRadius;
  final Color textColor;
<<<<<<< Updated upstream:lib/core/shared/button/buttons.dart
  final double? textSize;
=======
  final double? textSize, height, width;
>>>>>>> Stashed changes:lib/core/shared/buttons/primary_button.dart
  final bool? gradient;
  final void Function()? onTap;
  final Color? borderColor;
  final bool preserveIconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
      child: Container(
<<<<<<< Updated upstream:lib/core/shared/button/buttons.dart
        height: 58.sp,
        width: (context.screenWidth() * 0.85),
=======
        height: height ?? 56.sp,
>>>>>>> Stashed changes:lib/core/shared/buttons/primary_button.dart
        decoration: BoxDecoration(
          color: isActive! ? color : AppColors.grey200,
          borderRadius: BorderRadius.circular(
            borderRadius ?? (isRounded == true ? 40.sp : 15.sp)
          ),
          border: Border.all(
<<<<<<< Updated upstream:lib/core/shared/button/buttons.dart
            width: 0.5.sp,
=======
            width: width ?? 0.5.sp,
>>>>>>> Stashed changes:lib/core/shared/buttons/primary_button.dart
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: isActive == true ? onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconRtr != null)
                SvgPicture.asset(
                  iconRtr!,
                  height: iconSize ?? 16.sp,
                  width: iconSize ?? 16.sp,
                  color: preserveIconColor ? null : textColor,
                )
              else
                const SizedBox(),
              const HorizontalMargin(5),
              Text(
                text,
                style: Config.b1(context).copyWith(
                  color: isActive! ? textColor : AppColors.white100,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const HorizontalMargin(7),
              if (icon != null)
                SvgPicture.asset(
                  icon!,
                  height: iconSize ?? 16.sp,
                  width: iconSize ?? 16.sp,
                  color: preserveIconColor ? null : textColor,
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
