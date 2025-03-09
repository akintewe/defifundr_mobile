// import 'package:defifundr_mobile/core/global/constants/app_texts.dart';
// import 'package:defifundr_mobile/core/global/constants/size.dart';
// import 'package:defifundr_mobile/core/global/themes/color_scheme.dart';
// import 'package:defifundr_mobile/core/shared/button/buttons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ImportWalletScreen extends ConsumerStatefulWidget {
//   const ImportWalletScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ImportWalletScreenState();
// }

// class _ImportWalletScreenState extends ConsumerState<ImportWalletScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: AppBar(
//             leading: IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: const Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.black,
//               ),
//             ),
//             title: Text(
//               AppTexts.signup,
//               style: Config.h2(context).copyWith(
//                 fontSize: 24,
//               ),
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             actions: [
//               Image.asset(
//                 'assets/icons/person.png',
//                 width: 24,
//                 height: 24,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(AppTexts.importWallet,
//                   style: Config.h2(context).copyWith(
//                     color: AppColors.primaryColor,
//                   )),
//               const SizedBox(height: 8),
//               Text(AppTexts.importWalletDesc,
//                   style: Config.b2(context).copyWith(
//                     color: AppColors.grey100,
//                   )),
//               const SizedBox(height: 40),
//               AppButton(
//                 text: AppTexts.privateKeyButton,
//                 onTap: () {},
//                 textSize: 18.sp,
//                 textColor: AppColors.primaryColor,
//                 color: AppColors.grey400,
//                 iconRtr: 'assets/icons/key.svg',
//               ),
//               const SizedBox(height: 5),
//               AppButton(
//                 text: AppTexts.seedPhrase,
//                 onTap: () {},
//                 textSize: 18.sp,
//                 textColor: AppColors.primaryColor,
//                 color: AppColors.grey400,
//                 iconRtr: 'assets/icons/seed.svg',
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () {},
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Need assistance? ',
//                     style: Config.b3(context).copyWith(
//                       fontSize: 14.sp,
//                       color: AppColors.grey100,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Learn more',
//                         style: Config.b3(context).copyWith(
//                           fontSize: 14.sp,
//                           color: AppColors.primaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
