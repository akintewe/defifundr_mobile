// import 'package:defifundr_mobile/core/global/constants/app_icons.dart';
// import 'package:defifundr_mobile/core/global/constants/app_texts.dart';
// import 'package:defifundr_mobile/core/global/constants/size.dart';
// import 'package:defifundr_mobile/core/shared/textfield/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SignupEmailScreen extends StatefulWidget {
//   const SignupEmailScreen({super.key});

//   @override
//   State<SignupEmailScreen> createState() => _SignupEmailScreenState();
// }

// class _SignupEmailScreenState extends State<SignupEmailScreen> {
//   final FocusNode _emailNode = FocusNode();
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppTexts.signup),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {},
//           icon: SvgPicture.asset(
//             AppIcons.arrowBack,
//           ),
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
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text(
//               AppTexts.whatsYourEmail,
//               style: Config.h2(context).copyWith(fontSize: 24),
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               AppTexts.yourEmailAddressWillImprove,
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xffA1A1A1),
//                   fontWeight: FontWeight.w400),
//               textAlign: TextAlign.center,
//             ),
//             VerticalMargin(50),
//             AppTextField(
//               prefixIcon: Icon(Icons.email, color: Colors.grey),
//               controller: _emailController,
//               hintText: AppTexts.enterEmail,
//               inputType: TextInputType.emailAddress,
//               textCapitalization: TextCapitalization.none,
//               focusNode: _emailNode,
//               textInputAction: TextInputAction.done,
//             ),
//             VerticalMargin(50),
//             buildNextButton(
//                 Colors.black, Colors.white, AppTexts.next, () {}, context),
//             VerticalMargin(10),
//             buildNextButton(Color(0xffF5F5F5), Color(0xff8E9BAE),
//                 AppTexts.continueAsGuest, () {}, context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildNextButton(Color buttonColor, Color textColor, String text,
//       Function() onTap, BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         height: 60,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: buttonColor, borderRadius: BorderRadius.circular(7)),
//         child: Text(
//           text,
//           style: TextStyle(
//               color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
//         ),
//       ),
//     );
//   }
// }
