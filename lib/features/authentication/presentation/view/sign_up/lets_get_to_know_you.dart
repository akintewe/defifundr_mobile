
import 'package:defifundr_mobile/%20core/constants/app_texts.dart';
import 'package:defifundr_mobile/%20core/constants/assets.dart';
import 'package:defifundr_mobile/%20core/constants/color_scheme.dart';
import 'package:defifundr_mobile/%20core/constants/size.dart';
import 'package:defifundr_mobile/%20core/shared/appbar/appbar.dart';
import 'package:defifundr_mobile/%20core/shared/button/buttons.dart';
import 'package:defifundr_mobile/%20core/shared/textfield/textfield.dart';
import 'package:defifundr_mobile/features/authentication/presentation/states/lets_get_to_know_you/lets_get_to_know_you_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LetsGetToKnowYouScreen extends StatefulWidget {
  const LetsGetToKnowYouScreen({Key? key}) : super(key: key);

  @override
  State<LetsGetToKnowYouScreen> createState() => _LetsGetToKnowYouScreenState();
}

class _LetsGetToKnowYouScreenState extends State<LetsGetToKnowYouScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _selectedGender = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _agreeToTerms = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white250,
      appBar: PreferredSize(
          preferredSize: Size(context.screenWidth(), 60),
          child: DeFiRaiseAppBar(
            title: '',
            isBack: false,
          )),
      body: BlocListener<LetsGetToKnowYouBloc, LetsGetToKnowYouState>(
        listener: (context, state) {
            if (state is LetsGetToKnowYouError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message), backgroundColor: AppColors.errorColor),
                );
              } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppTexts.signUpSuccess), backgroundColor: AppColors.successColor),
              );
            }
            
     
        
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // app icon
                    SvgPicture.asset(AppAssets.appIcon,
                   
                          fit: BoxFit.scaleDown),
                    SizedBox(height: 8.h),
                    Text(
                      AppTexts.letsGetToKnowYouTitle,
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppTexts.letsGetToKnowYouSub,
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 30.h),
                    AppTextField(
                      controller: _emailController,
                      hintText: AppTexts.email,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: SvgPicture.asset(AppAssets.userIcon,
                          fit: BoxFit.scaleDown),
                      fillColor: AppColors.white,
                    ),
                    SizedBox(height: 15.h),
                    AppTextField(
                      controller: _firstNameController,
                      hintText: AppTexts.istName,
                      prefixIcon: SvgPicture.asset(AppAssets.userIcon,
                          fit: BoxFit.scaleDown),
                      fillColor: AppColors.white,
                    ),
                    SizedBox(height: 15.h),
                    AppTextField(
                      controller: _lastNameController,
                      hintText: AppTexts.lastName,
                      prefixIcon: SvgPicture.asset(AppAssets.userIcon,
                          fit: BoxFit.scaleDown),
                      fillColor: AppColors.white,
                    ),
                    SizedBox(height: 15.h),
                    AppTextField(
                      
                      controller: _selectedGender,
                      hintText: AppTexts.gender,
                           fillColor: AppColors.white,
                    ),

                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.black,
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                              children: [
                                TextSpan(text: AppTexts.tacText),
                                TextSpan(
                                  text: AppTexts.tosText,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle Terms of Service tap
                                    },
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: AppTexts.ppText,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle Privacy Policy tap
                                    },
                                ),
                                TextSpan(text: "."),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AppButton(
                      text: AppTexts.continueButton,
                      textColor: AppColors.white200,
                      borderRadius: 48.sp,
                      onTap: () {
                        context.read<LetsGetToKnowYouBloc>().add(
                              ValidateSignUp(
                                email: _emailController.text,
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                gender: _selectedGender.text,
                                agreeToTerms: _agreeToTerms,
                              ),
                            );
                      },
                      textSize: 14.sp,
                      
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
