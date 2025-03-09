import 'package:defifundr_mobile/core/global/constants/app_texts.dart';
import 'package:defifundr_mobile/core/global/constants/size.dart';
import 'package:defifundr_mobile/core/global/themes/color_scheme.dart';
import 'package:defifundr_mobile/core/routers/routes_constants.dart';
import 'package:defifundr_mobile/core/shared/button/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  final String email;
  const WelcomeScreen({required this.email, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  bool isLoading = false;

  void _startLoading() {
    setState(() {
      isLoading = true;
    });
   
    Future.delayed(const Duration(seconds: 5), () {
      context.goNamed(RouteConstants.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.arrow_back_ios_new_rounded)
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 100.sp),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset('assets/icons/Welcomeimage.svg'),
                      Positioned(
                        top: -10.sp,
                        right: -3.sp,
                        child: SvgPicture.asset(
                          'assets/icons/star2.svg',
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                      Positioned(
                        bottom: -10.sp,
                        left: -16.sp,
                        child: SvgPicture.asset(
                          'assets/icons/star1.svg',
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  VerticalMargin(30),
                  Text(
                    'Welcome',
                    style: Config.h3(context).copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  VerticalMargin(10),
                  Text(
                    '${widget.email}👋',
                    style: Config.b2(context).copyWith(
                      fontSize: 19.sp,
                      color: AppColors.black100,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  VerticalMargin(10),
                  Text(
                    'This email is associated with an existing\naccount that was backed up on the cloud.',
                    textAlign: TextAlign.center,
                    style: Config.b3(context).copyWith(
                      fontSize: 14.sp,
                      color: AppColors.grey100.withOpacity(0.5),
                    ),
                  ),
                  VerticalMargin(40),
                  AppButton(
                    borderRadius: 7.sp,
                    iconSize: 25.sp,
                    
                    iconRtr: 'assets/icons/passkey.svg',
                    text: 'Recovery with Passkey',
                    textSize: 16.sp,
                    onTap: isLoading ? null : _startLoading,
                    textColor: AppColors.white100,
                    color: AppColors.primaryColor,
                    preserveIconColor: true,
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.white.withOpacity(0.9),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                  VerticalMargin(20),
                  Text(
                    'Recovering your account',
                    style: Config.h3(context).copyWith(
                      fontSize: 20.sp,
                      color: AppColors.black100,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
