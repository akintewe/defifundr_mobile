// import 'package:defifundr_mobile/core/global/constants/app_icons.dart';
// import 'package:defifundr_mobile/core/global/constants/size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../../../core/global/constants/app_texts.dart';
// import '../../../../../core/global/themes/color_scheme.dart';
// import '../../../../../core/shared/appbar/appbar.dart';
// import '../../../../../core/shared/bottom_sheet/base_bottom_sheet.dart';
// import '../../../../../core/shared/button/buttons.dart';
// import '../widgets/did_you_know_option.dart';

// class PasteRecoveryPhraseScreen extends ConsumerStatefulWidget {
//   const PasteRecoveryPhraseScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<PasteRecoveryPhraseScreen> createState() =>
//       _PasteRecoveryPhraseScreenState();
// }

// class _PasteRecoveryPhraseScreenState
//     extends ConsumerState<PasteRecoveryPhraseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size(context.screenWidth(), 60),
//           child: DeFiRaiseAppBar(
//             isBack: true,
//             title: AppTexts.signUp,
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: SvgPicture.asset(AppIcons.support),
//               )
//             ],
//           )),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             VerticalMargin(10),
//             Text(
//               AppTexts.pasteYourRecoveryPhrase,
//               style: Config.h3(context).copyWith(
//                 color: AppColors.primaryColor,
//               ),
//             ),
//             VerticalMargin(30),
//             Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.borderColor),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//               child: Padding(
//                 padding: const EdgeInsets.all(64.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(AppIcons.document),
//                     HorizontalMargin(5),
//                     Text(
//                       AppTexts.pasteOrTypePrivateKey,
//                       style: Config.b3(context).copyWith(
//                         color: AppColors.grey500,
//                       ),
//                     ),
//                     HorizontalMargin(5),
//                     SvgPicture.asset(AppIcons.rightArrow),
//                   ],
//                 ),
//               ),
//             ),
//             VerticalMargin(20),
//             Container(
//               //width: 128,
//                 constraints: BoxConstraints(
//                   maxWidth: 110,
//                   maxHeight: 45,
//                 ),
//               decoration: BoxDecoration(
//                   color: AppColors.grey400,
//                   borderRadius: BorderRadius.all(Radius.circular(7.0))),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       AppTexts.clear,
//                       style: Config.b3(context).copyWith(
//                         color: AppColors.grey500,
//                       ),
//                     ),
//                     HorizontalMargin(5),
//                     SvgPicture.asset(AppIcons.cancel)
//                   ],
//                 ),
//               ),
//             ),
//             Spacer(),
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       AppTexts.whatIsARecoveryPhrase,
//                       style: Config.b3(context).copyWith(
//                         color: AppColors.secondaryTextColor,
//                       ),
//                     ),
//                     HorizontalMargin(3),
//                     GestureDetector(
//                       onTap: () {
//                         showModalBottomSheet(
//                             context: context,
//                             backgroundColor: Colors.transparent,
//                             useRootNavigator: true,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return BaseBottomSheet(
//                                   title: AppTexts.didYouKnow,
//                                   items: [
//                                     DidYouKnowOption(
//                                         label: AppTexts.privateKey,
//                                         description:
//                                             AppTexts.yourPrivateKeyIsA64Char),
//                                     VerticalMargin(15),
//                                     DidYouKnowOption(
//                                         label: AppTexts.recoveryOrSeedPhrase,
//                                         description:
//                                             AppTexts.yourRecoveryOrSeedPhrase)
//                                   ]);
//                             });
//                       },
//                       child: Text(
//                         AppTexts.learnMore,
//                         style: Config.b3(context).copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 VerticalMargin(50),
//                 AppButton(
//                   text: AppTexts.importMyAccount,
//                   isActive: false,
//                   onTap: () async {},
//                   textColor: AppColors.white100,
//                   textSize: 12,
//                   color: AppColors.primaryColor,
//                 )
//               ],
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
