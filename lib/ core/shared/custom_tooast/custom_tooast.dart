// 🐦 Flutter imports:
import 'package:defifundr_mobile/%20core/constants/assets.dart';
import 'package:defifundr_mobile/%20core/constants/color_scheme.dart';
import 'package:defifundr_mobile/%20core/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 📦 Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 🌎 Project imports:

extension ToastExtension on BuildContext {
  void showToast({
    required String title,
    Color? textColor,
    Color? backgroundColor = Colors.white,
    Color? borderColor = Colors.transparent,
    required BuildContext context,
    int toastDurationInSeconds = 3,
    bool isSuccess = false,
    double? height,
    String icon = '',
  }) {
    FToast fToast = FToast();
    fToast.init(this);
    fToast.showToast(
        child: Container(
          padding: const EdgeInsets.only(
            top: 0,
            bottom: 0,
          ),
          width: screenWidth() * 0.90,
          height: height ?? 90.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.0),
            border: Border.all(
              color: borderColor!,
            ),
            color:
                isSuccess ? AppColors.successColor : AppColors.tooastErrorColor,
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: isSuccess ? 2 : 0,
                child: icon.isNotEmpty
                    ? SvgPicture.asset(
                        icon,
                        height: 24,
                        width: 24,
                      )
                    : isSuccess
                        ? SvgPicture.asset(
                            AppAssets.smileSuccess,
                            height: 90.sp,
                            width: 90.sp,
                          )
                        : SvgPicture.asset(
                            AppAssets.sadError,
                            height: 90.sp,
                            width: 90.sp,
                          ),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth() * 0.45,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: Config.b1(context).copyWith(
                          fontSize: 12.sp,
                          color: textColor ?? AppColors.white100,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        gravity: ToastGravity.TOP,
        fadeDuration: Duration(milliseconds: 200),
        toastDuration: Duration(seconds: toastDurationInSeconds));
  }
}
