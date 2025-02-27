import 'package:defifundr_mobile/core/constants/color_scheme.dart';
import 'package:defifundr_mobile/core/constants/size.dart';
import 'package:defifundr_mobile/core/shared/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContractOverview extends StatefulWidget {
  const ContractOverview({super.key});

  @override
  State<ContractOverview> createState() => _ContractOverviewState();
}

class _ContractOverviewState extends State<ContractOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: DeFiRaiseAppBar(
          isBack: false,
          title: '',
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ),
     backgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}
