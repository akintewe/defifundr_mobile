import 'package:defifundr_mobile/core/global/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/global/constants/app_icons.dart';
import '../../../../../core/global/constants/size.dart';



class DidYouKnowOption extends StatelessWidget {

  final String label, description;

  const DidYouKnowOption({
    super.key,
    required this.label,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey400,
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.keyIcon,
            ),
            VerticalMargin(10),
            Text(
              label ,
              style: Config.b2(context).copyWith(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
            VerticalMargin(10),
            Text(
              description ,
              style: Config.b2(context).copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
