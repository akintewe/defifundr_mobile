import 'package:defifundr_mobile/core/constants/fonts.dart';
import 'package:defifundr_mobile/core/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: DefiFundrFonts.h2(context).copyWith(
            fontSize: 26,
          ),
        ),
        Text(
          subtitle,
          style: DefiFundrFonts.b3(context).copyWith(
            color: AppColors.grey100,
          ),
        ),
      ],
    );
  }
}
