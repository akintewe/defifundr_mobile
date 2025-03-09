// import 'package:defifundr_mobile/core/global/constants/app_icons.dart';
// import 'package:defifundr_mobile/core/global/constants/app_images.dart';
// import 'package:defifundr_mobile/core/global/constants/size.dart';
// import 'package:defifundr_mobile/core/global/themes/color_scheme.dart';
// import 'package:defifundr_mobile/core/routers/routes_constants.dart';
// import 'package:defifundr_mobile/core/shared/custom_tooast/custom_tooast.dart';
// import 'package:defifundr_mobile/core/utils/loading_overlay.dart';
// import 'package:defifundr_mobile/features/authentication/presentation/signup/states/bloc/sign_up_bloc.dart';
// import 'package:defifundr_mobile/features/authentication/presentation/signup/states/verify_bloc/bloc/verify_otp_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pinput/pinput.dart';
// import 'package:timer_count_down/timer_controller.dart';
// import 'package:timer_count_down/timer_count_down.dart';

// import '../../../../../core/global/constants/app_texts.dart';

// class VerifyOTPScreen extends ConsumerStatefulWidget {
//   final String username;
//   final String email;
//   const VerifyOTPScreen({required this.username, required this.email, super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _VerifyOTPScreenState();
// }

// class _VerifyOTPScreenState extends ConsumerState<VerifyOTPScreen> with LoadingOverlayMixin {
//   final ValueNotifier<String> otp = ValueNotifier<String>("");
//   final TextEditingController _otpController = TextEditingController();
//   late final CountdownController _controller;
//   OverlayEntry? _overlayEntry;

//   bool canResend = false;
//   final FocusNode _otpNode = FocusNode();
//   final GlobalKey<FormState> _formKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     _otpNode.requestFocus();
//     _controller = CountdownController(
//       autoStart: true,
//     );
//   }

//   void _restartTimer() {
//     _controller.restart();
//     setState(() {
//       canResend = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppTexts.signup,
//           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: SvgPicture.asset(AppIcons.arrowBack),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SvgPicture.asset(
//                 AppIcons.personSupport,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 50.sp),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(AppImages.mailbox),
//                   VerticalMargin(30),
//                   Text(AppTexts.enterCode,
//                       style: Config.h2(context).copyWith(
//                         fontSize: 22.sp,
//                       )),
//                   VerticalMargin(5),
//                   Text(widget.email, style: TextStyle(color: Color(0xFFA1A1A1), fontSize: 16.sp)),
//                   VerticalMargin(20),
//                   TextButton(
//                     onPressed: () {
//                       context.goNamed(RouteConstants.register, queryParameters: {"username": widget.username, "email": widget.email});
//                     },
//                     child: Text(
//                       AppTexts.changeEmail,
//                       style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, decoration: TextDecoration.underline, color: AppColors.primaryColor),
//                     ),
//                   ),
//                   VerticalMargin(25),
//                   BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
//                     listener: _listenerToVerification,
//                     builder: (context, state) {
//                       return Pinput(
//                         defaultPinTheme: defaultPinTheme,
//                         focusedPinTheme: defaultPinTheme.copyDecorationWith(
//                           border: Border.all(color: AppColors.primaryColor),
//                         ),
//                         listenForMultipleSmsOnAndroid: true,
//                         androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
//                         length: 6,
//                         pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                         hapticFeedbackType: HapticFeedbackType.vibrate,
//                         keyboardType: TextInputType.number,
//                         controller: _otpController,
//                         pinAnimationType: PinAnimationType.fade,
//                         onChanged: (newOtp) {
//                           setState(() {
//                             otp.value = newOtp;
//                           });
//                           _verifyOtp(newOtp);
//                         },
//                         errorPinTheme: defaultPinTheme.copyBorderWith(
//                           border: Border.all(color: Colors.redAccent),
//                         ),
//                       );
//                     },
//                   ),
//                   const VerticalMargin(30),
//                   BlocConsumer<SignUpBloc, SignUpState>(
//                       listener: _listener,
//                       builder: (context, state) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Countdown(
//                               seconds: 180,
//                               controller: _controller,
//                               onFinished: () {
//                                 canResend = true;
//                               },
//                               build: (BuildContext context, double time) {
//                                 canResend = time.toInt() == 0;
//                                 return RichText(
//                                   text: TextSpan(
//                                       text: '${AppTexts.codeExpiresIn} ',
//                                       style: TextStyle(
//                                         color: AppColors.primaryColor,
//                                       ),
//                                       children: [
//                                         TextSpan(
//                                           text: '${(time ~/ 60).toString().padLeft(2, '0')} : ${(time % 60).toInt().toString().padLeft(2, '0')}',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ]),
//                                 );
//                               },
//                             ),
//                           ],
//                         );
//                       }),
//                   const VerticalMargin(20),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.sp),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFF2F4F7),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.info, color: Colors.black),
//                             const SizedBox(width: 8),
//                             Text(AppTexts.didntGetCode),
//                           ],
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             () async {
//                               context.read<SignUpBloc>().add(ResendOtp(
//                                     username: widget.username,
//                                   ));
//                             };
//                           },
//                           child: Text(
//                             AppTexts.resendCode,
//                             style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _verifyOtp(String otpValue) {
//     if (otpValue.length == 6) {
//       context.read<VerifyOtpBloc>().add(
//             VerifyOtpEq(
//               otp: otpValue,
//               username: widget.username,
//             ),
//           );
//     }
//   }

//   void _listenerToVerification(BuildContext context, VerifyOtpState state) {
//     state.maybeWhen(orElse: () {
//       _overlayEntry?.remove();
//     }, otpVerificationError: (error) {
//       _overlayEntry?.remove();

//       context.showToast(
//         title: error,
//         context: context,
//         toastDurationInSeconds: 1,
//         isSuccess: false,
//       );
//     }, verifyingOtp: () {
//       _overlayEntry = showLoadingOverlay(context, _overlayEntry);
//     }, otpVerificationSuccessful: (success) {
//       _overlayEntry?.remove();

//       context.goNamed(RouteConstants.confirmPassword, queryParameters: {"username": widget.username});
//     });
//   }

//   void _listener(BuildContext context, SignUpState state) {
//     state.maybeWhen(
//         orElse: () {
//           if (_overlayEntry != null) {
//             _overlayEntry?.remove();
//           }
//         },
//         verifyingOtp: () {
//           _overlayEntry = showLoadingOverlay(context, _overlayEntry);
//         },
//         loading: () {
//           _overlayEntry = showLoadingOverlay(context, _overlayEntry);
//         },
//         registrationError: (message) {
//           _overlayEntry?.remove();

//           context.showToast(
//             title: message,
//             context: context,
//             toastDurationInSeconds: 1,
//             isSuccess: false,
//           );
//         },
//         otpVerificationError: (message) {
//           _overlayEntry?.remove();

//           context.showToast(
//             title: message,
//             context: context,
//             toastDurationInSeconds: 1,
//             isSuccess: false,
//           );
//         },
//         otpResendError: (message) {
//           _overlayEntry?.remove();

//           context.showToast(
//             title: message,
//             context: context,
//             toastDurationInSeconds: 1,
//             isSuccess: false,
//           );
//         },
//         otpResendSuccessful: (message) {
//           _overlayEntry?.remove();

//           context.showToast(
//             title: message,
//             context: context,
//             toastDurationInSeconds: 1,
//             isSuccess: true,
//           );
//           _restartTimer();
//         },
//         registrationSuccessful: (message) {});
//   }

//   final preFilledWidget = Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       Container(
//         width: 56,
//         height: 3,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     ],
//   );

//   final defaultPinTheme = PinTheme(
//     width: 60,
//     height: 56,
//     textStyle: GoogleFonts.poppins(
//       fontSize: 22,
//       color: const Color.fromRGBO(30, 60, 87, 1),
//     ),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 2, color: const Color(0xFFE2E8F0))),
//   );
// }
