// import 'package:defifundr_mobile/core/global/constants/app_icons.dart';
// import 'package:defifundr_mobile/core/global/constants/app_texts.dart';
// import 'package:defifundr_mobile/core/global/constants/size.dart';
// import 'package:defifundr_mobile/core/shared/textfield/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class PrivateKeyInputScreen extends StatefulWidget {
//   const PrivateKeyInputScreen({super.key});

//   @override
//   State<PrivateKeyInputScreen> createState() => _PrivateKeyInputScreenState();
// }

// class _PrivateKeyInputScreenState extends State<PrivateKeyInputScreen> {
//   final FocusNode _keyNode = FocusNode();
//   final TextEditingController _keyController = TextEditingController();

//   bool isPrivateKeyEntered = false;

//   @override
//   void initState() {
//     super.initState();
//     _keyController.addListener(_onPrivateKeyChange);
//   }

//   @override
//   void dispose() {
//     _keyController.removeListener(_onPrivateKeyChange);
//     _keyController.dispose();
//     _keyNode.dispose();
//     super.dispose();
//   }

//   void _onPrivateKeyChange() {
//     setState(() {
//       isPrivateKeyEntered = _keyController.text.trim().isNotEmpty;
//     });
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
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   // Title
//                   Text(
//                     AppTexts.enterYourPrivateKey,
//                     style: Config.h2(context).copyWith(fontSize: 24),
//                     textAlign: TextAlign.center,
//                   ),

//                   // Subtitle
//                   Text(
//                     AppTexts.pasteOrTypePrivateKey,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Color(0xffA1A1A1),
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),

//                   const VerticalMargin(50),

//                   // Private Key Input Field
//                   AppTextField(
//                     controller: _keyController,
//                     hintText: AppTexts.typePrivateKey,
//                     inputType: TextInputType.text,
//                     textCapitalization: TextCapitalization.none,
//                     focusNode: _keyNode,
//                     textInputAction: TextInputAction.done,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Import Button 
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
//             child: buildNextButton(
//               isPrivateKeyEntered ? Colors.black : const Color(0xffF5F5F5),
//               isPrivateKeyEntered ? Colors.white : const Color(0xff8E9BAE),
//               AppTexts.importMyAccount,
//               isPrivateKeyEntered ? _importAccount : null,
//               context,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildNextButton(Color buttonColor, Color textColor, String text,
//       Function()? onTap, BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         height: 60,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: buttonColor,
//           borderRadius: BorderRadius.circular(7),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: textColor,
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }

//   // Import Account Functionality
//   void _importAccount() {
//     final privateKey = _keyController.text.trim();
//     if (privateKey.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Private key cannot be empty')),
//       );
//     } else {
//       // Add actual import functionality here
//       print('Private Key: $privateKey');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Importing account...')),
//       );
//     }
//   }
// }
