import 'package:defifundr_mobile/core/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_texts.dart';
import '../../core/shared/appbar/appbar.dart';
import '../../core/shared/auth_header.dart';
import '../../core/themes/color_scheme.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
             preferredSize: Size(context.screenWidth(), 60),
             child: DeFiRaiseAppBar(
               isBack: true,
               title: '',
               actions: [
                 Padding(
                   padding: EdgeInsets.only(right: 25.sp),
                   child: Container(
                     width: 107.sp,
                     height: 34.sp,
                     decoration: BoxDecoration(
                       color: AppColors.transparent,
                       border: Border.all(
                         color: AppColors.borderColor, // Border color
                         width: 1, // Border width
                       ),
                       borderRadius: BorderRadius.circular(20), // Set border radius
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset(
                           AppIcons.headsetIcon,
                           fit: BoxFit.scaleDown,
                         ),
                         HorizontalMargin(6),
                         Text(AppTexts.needHelp,
                             style: Config.h2(context).copyWith(
                               fontSize: 10,
                             )),
                       ],
                     ),
                   ),
                 )
               ],
             )),
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                AuthHeader(
                  title: AppTexts.createAPassword,
                  subtitle: AppTexts.addAPasswordToKeepAccountSafe,
                )
              ],
            ),
          )
      ),
    );
  }
}
