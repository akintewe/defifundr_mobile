import 'package:defifundr_mobile/%20core/shared/button/buttons.dart';
import 'package:defifundr_mobile/%20core/shared/textfield/textfield.dart';
import 'package:defifundr_mobile/core/constants/app_texts.dart';
import 'package:defifundr_mobile/core/constants/assets.dart';
import 'package:defifundr_mobile/core/constants/color_scheme.dart';
import 'package:defifundr_mobile/core/constants/size.dart';
import 'package:defifundr_mobile/features/authentication/presentation/forgot_password/state/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ResetEmailScreenState();
}

class _ResetEmailScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final isValidate = ValueNotifier<bool>(false);

  @override
  void initState() {
    _emailNode.requestFocus();
    _emailController.addListener(_checkValidation);
    super.initState();
  }

  void _checkValidation() {
    setState(() {
      isValidate.value = _emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ForgotPasswordBloc(),
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
          if (state is ForgotPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.errorColor),
            );
          } else if (state is ForgotPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.successColor),
            );
          }
        }, builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientColor, // Adjust based on your image
                  AppColors.grey400, // Adjust based on your image
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scaffold(
              backgroundColor:
                  AppColors.transparent, // Make Scaffold background transparent
              appBar: PreferredSize(
                preferredSize: Size(context.screenWidth(), 60),
                child: AppBar(
                  backgroundColor:
                      AppColors.transparent, // Make AppBar transparent
                  elevation: 0, // Remove shadow
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gradientColor, // Adjust based on your image
                          AppColors.grey400, // Adjust based on your image
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  leading: IconButton(
                    icon: SvgPicture.asset(
                      AppAssets
                          .backArrow, // Make sure this is the correct asset path
                     
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
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
                          borderRadius:
                              BorderRadius.circular(20), // Set border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.headSetIcon,
                              fit: BoxFit.scaleDown,
                            ),
                            HorizontalMargin(6),
                            Text(AppTexts.neeHelp,
                                style: Config.h2(context).copyWith(
                                  fontSize: 10,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppTexts.forgotPassword,
                              style: Config.h2(context).copyWith(fontSize: 24)),
                          VerticalMargin(5),
                          Text(AppTexts.forgotPasswordDesc,
                              style: Config.b3(context).copyWith(
                                color: AppColors.grey100,
                              )),
                          // vertical space
                          VerticalMargin(50),
                          AppTextField(
                            controller: _emailController,
                            hintText: AppTexts.forgetPasswordLogin,
                            inputType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                            focusNode: _emailNode,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgPicture.asset(AppAssets.userIcon,
                                fit: BoxFit.scaleDown),
                          ),
                          VerticalMargin(20),
                          VerticalMargin(10),
                          AppButton(
                            text: AppTexts.forgotPasswordButton,
                            onTap: () {
                              context.read<ForgotPasswordBloc>().add(
                                    SubmitEmail(_emailController.text),
                                  );
                            },
                            textSize: 12,
                            borderRadius: 47.sp,
                            textColor: AppColors.white100,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
